<div class="contents row">
  <%= form_tag('/tweets', method: :post) do %>
    <h3>
      投稿する
    </h3>
    <input placeholder="Nickname" type="text" name="name">
    <input placeholder="Image Url" type="text" name="image">
    <textarea cols="30" name="text" placeholder="text" rows="10"></textarea>
    <input type="submit" value="SENT">
  <% end %>
</div>