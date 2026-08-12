# Test Coverage Report - US-002

## Acceptance Criteria Coverage

| AC # | Description | Test Cases | Status |
|------|-------------|------------|--------|
| AC-1 | 6 продуктов с названием, ценой, изображением | US002-TC-001, US002-TC-002 | ✅ Covered |
| AC-2 | Кнопка "Add to cart" для каждого товара | US002-TC-003 | ✅ Covered |
| AC-3 | Сортировка по цене (low to high, high to low) | US002-TC-004, US002-TC-005, US002-TC-011, US002-TC-013 | ✅ Covered |

## Test Type Distribution

- Positive: 5 (36%)
- Negative: 5 (36%)
- Edge: 4 (29%)

## Priority Distribution

- High: 6 (43%)
- Medium: 6 (43%)
- Low: 2 (14%)

## Security Tests

- SQL injection / XSS: **Не применимо** — у US-002 нет полей текстового ввода (только sort dropdown и кнопки). Security-кейсы покрыты в US-001 (логин) и US-013 (обработка ошибок).