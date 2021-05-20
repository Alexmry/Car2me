import flatpickr from 'flatpickr';

const date = ()=> {
  let options = {
    dateFormat: "Y-m-d",
    disable: [
        {
            from: "2021-05-08",
            to: "2021-05-14"
        },
        {
            from: "2021-05-22",
            to: "2021-05-28"
        }
      ]
    }
  flatpickr(".datepicker", options);
};

export {date};
