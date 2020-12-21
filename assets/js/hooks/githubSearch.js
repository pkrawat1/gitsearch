import {Sortable} from '@shopify/draggable';

export default {
  mounted() {
    const containerSelector = '.StackedList';
    const containers = document.querySelectorAll(containerSelector);

    if (containers.length === 0) {
      return false;
    }

    const sortable = new Sortable(containers, {
      draggable: '.StackedListItem--isDraggable',
      mirror: {
        appendTo: containerSelector,
        constrainDimensions: true,
      },
    });

    return sortable;
  }
};