# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.delete_all
  Artwork.delete_all
  Artworkshare.delete_all
  Comment.delete_all
  Like.delete_all
  Collection.delete_all

  #Seed users
  user_1 = User.create!(username: 'abc')
  user_2 = User.create!(username: 'def')
  user_3 = User.create!(username: 'ghi')
  user_4 = User.create!(username: 'jkl')
  user_5 = User.create!(username: 'mno')


  #Seed artworks
  artwork_1 = Artwork.create!(title: 'ABC', img_url: 'abc.com' ,artist_id: user_1.id, favorite: true)
  artwork_2 = Artwork.create!(title: 'AABBCC', img_url: 'aabbcc.com' ,artist_id: user_1.id)
  artwork_3 = Artwork.create!(title: 'DEF', img_url: 'def.com' ,artist_id: user_2.id, favorite: true)
  artwork_4 = Artwork.create!(title: 'GHI', img_url: 'ghi.com' ,artist_id: user_3.id)

  #Seed artworkshares
  as_1 = Artworkshare.create!(viewer_id: user_1.id, artwork_id: artwork_1.id)
  as_2 = Artworkshare.create!(viewer_id: user_2.id, artwork_id: artwork_1.id, favorite: true)
  as_3 = Artworkshare.create!(viewer_id: user_5.id, artwork_id: artwork_2.id)
  as_2 = Artworkshare.create!(viewer_id: user_3.id, artwork_id: artwork_3.id, favorite: true)


  #Seed comments
  comment_1 = Comment.create!(user_id: user_1.id, artwork_id: artwork_1.id, body: "This is my amazing masterpiece!")
  comment_2 = Comment.create!(user_id: user_2.id, artwork_id: artwork_1.id, body: "WOWWWWW")
  comment_3 = Comment.create!(user_id: user_3.id, artwork_id: artwork_2.id, body: "The blending is nice!")
  comment_4 = Comment.create!(user_id: user_5.id, artwork_id: artwork_3.id, body: "How did you make the clouds look so realistic?")


  #Seed likes

  like1 = Like.create!(user_id: user_1.id, liked_object_id: artwork_1.id, liked_object_type: "Artwork")
  like2 = Like.create!(user_id: user_1.id, liked_object_id: comment_1.id, liked_object_type: "Comment")
  like3 = Like.create!(user_id: user_2.id, liked_object_id: artwork_4.id, liked_object_type: "Artwork")
  like4 = Like.create!(user_id: user_3.id, liked_object_id: comment_2.id, liked_object_type: "Comment")
  like5 = Like.create!(user_id: user_5.id, liked_object_id: artwork_3.id, liked_object_type: "Artwork")

  collection1 = Collection.create!(user_id: user_1.id, collection_id: 1, artwork_id: artwork_1.id)
  collection2 = Collection.create!(user_id: user_1.id, collection_id: 1, artwork_id: artwork_2.id)
  collection3 = Collection.create!(user_id: user_3.id, collection_id: 1, artwork_id: artwork_1.id)
  collection4 = Collection.create!(user_id: user_1.id, collection_id: 2, artwork_id: artwork_4.id)
  collection5 = Collection.create!(user_id: user_4.id, collection_id: 1, artwork_id: artwork_1.id)

end


