# 🐦 Bird

Bird is an open-source microblogging platform that emphasizes simplicity and user privacy. It's designed for personal use, allowing posts of 140 characters or less to express thoughts without the social pressure of content curation.

## Why Bird?

Traditional microblogging platforms have evolved to prioritize sharing over personal expression. Bird takes a different approach by:

- Focusing on personal thoughts rather than social sharing
- Removing the pressure to appear cooler or more knowledgeable
- Eliminating the need for content curation
- Providing a space for authentic self-expression

## Features

- 140-character limit for concise expression
- Hashtag support for organizing thoughts
- Simple, clean interface
- User authentication and privacy controls
- Reply functionality for self-dialogue
- Search capabilities across posts and replies

## Technical Stack

- Ruby on Rails
- Turbo for dynamic updates
- Stimulus.js for JavaScript behaviors
- PostgreSQL database
- Modern CSS with custom properties

## Development Setup

1. Clone the repository
```bash
git clone https://github.com/na47io/bird.git
cd bird
```

2. Install dependencies
```bash
bundle install
```

3. Setup database
```bash
rails db:create db:migrate
```

4. Start the server
```bash
rails server
```

## Contributing

Bird is open source and contributions are welcome. Please feel free to submit pull requests or open issues for bugs and feature requests.

## License

This project is open source and available under the MIT License.
