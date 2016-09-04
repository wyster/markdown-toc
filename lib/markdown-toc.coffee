Toc = require './Toc'

atom.workspace.observeTextEditors (editor) ->
  editor.onDidStopChanging (item) ->
    if atom.config.get('markdown-toc.automatically-update')
      @toc = new Toc(atom.workspace.getActivePaneItem())
      @toc.autosave()

module.exports =
  config:
    'automatically-update':
      title: 'Automatically update TOC',
      type: 'boolean'
      default: false
  activate: (state) ->
    atom.commands.add 'atom-workspace', 'markdown-toc:create': =>
      @toc = new Toc(atom.workspace.getActivePaneItem())
      @toc.create()
    atom.commands.add 'atom-workspace', 'markdown-toc:update': =>
      @toc = new Toc(atom.workspace.getActivePaneItem())
      @toc.update()
    atom.commands.add 'atom-workspace', 'markdown-toc:delete': =>
      @toc = new Toc(atom.workspace.getActivePaneItem());
      @toc.delete()
    atom.commands.add 'atom-workspace', 'markdown-toc:toggle': =>
      @toc = new Toc(atom.workspace.getActivePaneItem())
      @toc.toggle()

# deactivate: ->
#   @toc.destroy()
