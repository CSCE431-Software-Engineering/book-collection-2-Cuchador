require 'rails_helper'

RSpec.describe "CreatingBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves and flashes the new book: Test_Book' do
    visit '/books/new'

    fill_in 'book_title', with: 'Test_Book'
    
    click_on 'Create Book'

    expect(page).to have_content('Added Test_Book to the collection!')

    book = Book.order("id").last
    expect(book.title).to eq("Test_Book")
  end

  it 'Create book with empty title' do
    visit '/books/new'

    fill_in 'book_title', with: ''
    click_on 'Create Book'

    expect(page).to have_content('Added to the collection!')
    book = Book.order("id").last
    expect(book.title).to eq("")
  end

  it 'Create Book with author' do
    visit '/books/new'

    fill_in 'book_author', with: 'Test_Author'

    click_on 'Create Book'

    expect(page).to have_content('Test_Author')
    book = Book.order("id").last
    expect(book.author).to eq("Test_Author")
  end

  it 'Create Book with price' do
    visit '/books/new'

    fill_in 'book_price', with: '1000'

    click_on 'Create Book'

    expect(page).to have_content('1000.0')
    book = Book.order("id").last
    expect(book.price).to eq(1000.0)
  end

  it 'Create Book with published date' do
    visit '/books/new'

    fill_in 'book_published_date', with: '2024-01-01'

    click_on 'Create Book'

    expect(page).to have_content('2024-01-01')
    book = Book.order("id").last
    expect(book.published_date).to eq("2024-01-01")
  end

  it 'Create Book with all attributes' do
    visit '/books/new'

    fill_in 'book_title', with: 'Test_Book'
    fill_in 'book_author', with: 'Test_Author'
    fill_in 'book_price', with: '1000'
    fill_in 'book_published_date', with: '2024-01-01'

    click_on 'Create Book'

    expect(page).to have_content('Added Test_Book to the collection!')
    book = Book.order("id").last
    expect(book.title).to eq("Test_Book")
    expect(book.author).to eq("Test_Author")
    expect(book.price).to eq(1000.0)
    expect(book.published_date).to eq("2024-01-01")
  end
end
