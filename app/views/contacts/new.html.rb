<div class="px-8 py-6 rounded-md shadow bg-white">
    <h1 class="text-4xl text-center">Contact Railscoder</h1>
    <hr>
    <p>I'd love to hear from you. Send me a message below.</p>

    <%= form_for @contact do |form| %>

    <% if @contact.errors.any? %>
        <div id="error_explanation" class="bg-rose-200 pt-3 pb-1 mb-4 px-4 rounded-md">
            <div class="font-bold text-rose-700 text-sm pb-4"><%= pluralize(@contact.errors.count, "error") %> prohibited this page from being saved:</div>

            <ul class="pb-0 mb-0">
                <% @contact.errors.each do |error| %>
                    <li class="text-rose-600 pl-4 text-sm"><%= error.full_message %></li>
                <% end %>
            </ul>
        </div>
    <% end %>



    <div class="field mb-6">
        <%= form.label :name %>
        <%= form.text_field :name %>
    </div>

    <div class="field mb-6">
        <%= form.label :email %>
        <%= form.email_field :email %>
    </div>

    <div class="field">
        <%= form.label :message %>
        <%= form.text_area :message %>
    </div>

    <div class="hidden">
        <%= form.label :nickname %>
        <%= form.text_field :nickname %>
    </div>

    <div class="actions flex justify-end">
        <%= form.submit "Send Message" %>
    </div>
    <% end %>
</div>
