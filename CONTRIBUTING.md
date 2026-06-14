# Contributing to Sakhi-Safe

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code.

## How to Contribute

### Reporting Bugs

Before creating bug reports, please check if the issue already exists.

**When creating a bug report, please include:**
- Clear title and description
- Steps to reproduce
- Expected behavior
- Actual behavior
- Screenshots if applicable
- Environment details

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues.

**When creating an enhancement suggestion, please include:**
- Clear description of the enhancement
- Use cases
- Why this would be useful
- Possible implementation approach

### Pull Requests

1. Fork the repo and create your branch from `main`
2. Add tests for new functionality
3. Ensure tests pass: `npm run test`
4. Format code: `npm run format`
5. Create a clear PR description
6. Reference related issues

## Development Setup

```bash
git clone https://github.com/ShamrithaGS/sakhi-safe.git
cd sakhi-safe
cp .env.example .env
docker-compose up -d
cd backend && npm install && npm run dev
```

## Testing

```bash
# Unit tests
npm run test:unit

# Integration tests
npm run test:integration

# All tests
npm run test

# Coverage
npm run test:coverage
```

## Coding Standards

- Use TypeScript for type safety
- Follow ESLint configuration
- Use Prettier for formatting
- Write meaningful commit messages
- Comment complex logic
- Keep functions small and focused

## Commit Message Format

```
[TYPE] Brief description

Optional detailed description

Fixes #issue_number
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

## Questions?

Feel free to open an issue or reach out to the maintainers.

Thank you for contributing! 🙏
