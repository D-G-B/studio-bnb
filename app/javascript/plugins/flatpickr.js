import flatpickr from "flatpickr";
import minMaxTimePlugin from "flatpickr/dist/plugins/minMaxTimePlugin";

const initFlatpickr = () => {
  flatpickr("#date-picker", {
    enableTime: true,
    minDate: "2025",
    plugins: [
        new minMaxTimePlugin({
            table: {
                "2025-01-10": {
                    minTime: "16:00",
                    maxTime: "22:00",
                }
            }
        })
    ]
  })
};

export { initFlatpickr };