// input
export let listGroupInputBinding = new Shiny.InputBinding();

$.extend(listGroupInputBinding, {
  find: (scope) => $(scope).find(".yonder-list-groupl[id]"),

  getId: (el) => el.id,

  getValue: (el) => {
    return $(el)
      .children(".list-group-item.active:not(.disabled)")
      .map((index, item) => $(item).data("value"))
      .get();
  },

  getState: function(el, data) {
    return { value: this.getValue(el) };
  },

  subscribe: (el, callback) => {
    $(el).on("change.listGroupInputBinding", (e) => callback());
  },

  unsubscribe: (el) => $(el).off(".listGroupInputBinding")
});

// output
export let listGroupOutputBinding = new Shiny.OutputBinding();

$.extend(listGroupOutputBinding, {
  find: (scope) => $(scope).find(".yonder-list-group[id]"),

  getId: (el) => el.id,

  renderValue: (el, data) => {
    if (!data.items) {
      return;
    }

    let items = data.items.join("\n");

    Shiny.renderContent(el, items);
  }
});
