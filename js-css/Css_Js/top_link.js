// Lấy danh sách các mục trong slide show
var slideshowItems = document.querySelectorAll('.slideshow-item');
var currentIndex = 0;

// Hiển thị mục đầu tiên
slideshowItems[currentIndex].classList.add('active');

// Hàm chuyển đổi slide
function changeSlide() {
    // Ẩn mục hiện tại
    slideshowItems[currentIndex].classList.remove('active');

    // Tăng chỉ số hiện tại hoặc reset về 0 nếu đã ở cuối danh sách
    currentIndex = (currentIndex + 1) % slideshowItems.length;

    // Hiển thị mục mới
    slideshowItems[currentIndex].classList.add('active');
}

// Chuyển đổi slide mỗi 2 giây
setInterval(changeSlide, 3000);

window.addEventListener('DOMContentLoaded', (event) => {
    const slideShow = document.querySelector('.slide_show');
    const slideItems = slideShow.querySelectorAll('.slideshow-item');
    let maxWidth = 0;

    slideItems.forEach((item) => {
        const width = item.offsetWidth;
        if (width > maxWidth) {
            maxWidth = width;
        }
    });

    slideShow.style.width = `${maxWidth}px`;
});