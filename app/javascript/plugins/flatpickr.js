import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr("#range_start", {
    allowInput: true,
    altInput: true,
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    plugins: [new rangePlugin({ input: "#range_end"})]
  });
}

export { initFlatpickr };