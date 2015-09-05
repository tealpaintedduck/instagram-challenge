require 'rails_helper'

feature 'posts' do
  context 'no posts have been made' do
    scenario 'should display a prompt to make a post' do
      visit "/posts"
      expect(page).to have_content "No posts yet!"
      expect(page).to have_link "Make a post"
    end
  end

  context 'creating posts' do
    scenario 'user can make a post and then see the post' do
      visit '/'
      click_link 'Sign up'
      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "12345678"
      fill_in "Password confirmation", with: "12345678"
      click_button "Sign up"
      click_link "Make a post"
      fill_in "Title", with: "I love cheese"
      attach_file("post[image]", "spec/assets/images/KFC.jpg")
      click_button "Post"
      expect(page).to have_content "I love cheese"
    end

    scenario 'user must upload image' do
      visit '/'
      click_link 'Sign up'
      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "12345678"
      fill_in "Password confirmation", with: "12345678"
      click_button "Sign up"
      click_link "Make a post"
      fill_in "Title", with: "I love cheese"
      click_button "Post"
      expect(page).to have_content "You must select a photo"
    end
  end

  context 'user not signed in' do
    scenario 'user cannot make a post' do
      visit '/posts'
      click_link "Make a post"
      expect(current_path).to eq "/users/sign_in"
    end
  end
end