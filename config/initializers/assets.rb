# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Precompile all assets
# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets. By default, application.js, application.css, and all non-JS/CSS files in app/assets are already added.
Rails.application.config.assets.precompile += %w( application.js application.css )

# Precompile image files, fonts, and other asset types explicitly
Rails.application.config.assets.precompile += %w( *.jpg *.jpeg *.png *.gif *.svg *.ico )
Rails.application.config.assets.precompile += %w( *.woff *.woff2 *.ttf *.eot )

# Add additional asset paths if necessary (for images, fonts, etc.)
# Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'images')


# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
