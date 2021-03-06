$(document).on 'click', '.add-group-to-folder-button', (e) ->
  list = $('#share-with-these-groups').show().find('ul')
  for input in $('#group_results input:checked')
    elm = $(input)
    id = elm.val()
    name = elm.data('name')
    input = $("<input type='checkbox' id='group#{id}' name='folder[group_ids][]' value='#{id}' checked>")
    label = $("<label for='group#{id}'>#{name}</label>")
    li = $('<li/>').append(input).append(document.createTextNode(' ')).append(label)
    list.append(li)
    $('#add_group').hide()

$('#document-visibility input[type="checkbox"]').click (e) ->
  form = $(e.target).parents('form')
  args = form.serialize()
  args += '&hidden_folders=false' unless args.match(/hidden_folders/)
  args += '&restricted_folders=false' unless args.match(/restricted_folders/)
  location.href = '?' + args

$('#document_file').change (e) ->
  return if $('#document_name').val() != ''
  name = e.target.value.replace(/_/g, ' ').replace(/\.\w{3,4}$/, '')
  $('#document_name').val(name)
