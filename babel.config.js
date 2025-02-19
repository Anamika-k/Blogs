module.exports = function(api) {
  // Define valid environments
  const validEnv = ['development', 'test', 'production'];
  const currentEnv = api.env();
  const isDevelopmentEnv = api.env('development');
  const isProductionEnv = api.env('production');
  const isTestEnv = api.env('test');

  // Throw error if NODE_ENV or BABEL_ENV is not valid
  if (!validEnv.includes(currentEnv)) {
    throw new Error(
      'Please specify a valid `NODE_ENV` or ' +
        '`BABEL_ENV` environment variables. Valid values are "development", ' +
        '"test", and "production". Instead, received: ' +
        JSON.stringify(currentEnv) +
        '.'
    );
  }

  return {
    // Presets based on the environment
    presets: [
      // For testing environments
      isTestEnv && [
        '@babel/preset-env',
        {
          targets: {
            node: 'current'
          }
        }
      ],

      // For production and development environments
      (isProductionEnv || isDevelopmentEnv) && [
        '@babel/preset-env',
        {
          forceAllTransforms: true,
          useBuiltIns: 'entry',
          corejs: 3, // Ensure you have core-js@3 installed for polyfills
          modules: false,
          exclude: ['transform-typeof-symbol']
        }
      ]
    ].filter(Boolean),

    // Plugins based on the environment
    plugins: [
      // Include common plugins
      'babel-plugin-macros',
      '@babel/plugin-syntax-dynamic-import',

      // For testing environments
      isTestEnv && 'babel-plugin-dynamic-import-node',

      // Transformations for specific syntax
      '@babel/plugin-transform-destructuring',
      [
        '@babel/plugin-proposal-class-properties',
        {
          loose: true
        }
      ],
      [
        '@babel/plugin-proposal-object-rest-spread',
        {
          useBuiltIns: true
        }
      ],
      // Ensure support for private methods
      [
        '@babel/plugin-proposal-private-methods',
        {
          loose: true
        }
      ],
      [
        '@babel/plugin-proposal-private-property-in-object',
        {
          loose: true
        }
      ],
      // Support async/await transformations
      [
        '@babel/plugin-transform-runtime',
        {
          helpers: false
        }
      ],
      [
        '@babel/plugin-transform-regenerator',
        {
          async: false
        }
      ]
    ].filter(Boolean)
  };
};
