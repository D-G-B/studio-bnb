import flatpickr from "flatpickr";
import minMaxTimePlugin from "flatpickr/dist/plugins/minMaxTimePlugin";

const initFlatpickr = () => {
  flatpickr("#date-picker", {
    enableTime: true,
    minDate: "2021",
    plugins: [
        new minMaxTimePlugin({
            table: {
                "2021-02-26": {
                    minTime: "12:00",
                    maxTime: "22:00"
                }
            }
        })
    ]
  })
};

export { initFlatpickr };