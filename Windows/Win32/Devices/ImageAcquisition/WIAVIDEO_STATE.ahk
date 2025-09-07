#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WIAVIDEO_STATE enumeration is used to specify the current state of a video stream.
 * @see https://learn.microsoft.com/windows/win32/api/wiavideo/ne-wiavideo-wiavideo_state
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class WIAVIDEO_STATE{

    /**
     * No video stream exists. Call <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-createvideobywiadevid">IWiaVideo::CreateVideoByWiaDevID</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-createvideobydevnum">IWiaVideo::CreateVideoByDevNum</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-createvideobyname">IWiaVideo::CreateVideoByName</a> to create a video.
     * @type {Integer (Int32)}
     */
    static WIAVIDEO_NO_VIDEO => 1

    /**
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nn-wiavideo-iwiavideo">IWiaVideo</a> CreateVideo methods was called and WIA is in the process of creating the video stream.
     * @type {Integer (Int32)}
     */
    static WIAVIDEO_CREATING_VIDEO => 2

    /**
     * A video stream has been successfully created, but playback has not yet started.
     * @type {Integer (Int32)}
     */
    static WIAVIDEO_VIDEO_CREATED => 3

    /**
     * A video stream has been successfully created, and the video is playing. The application can now call the <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-takepicture">IWiaVideo::TakePicture</a> method.
     * @type {Integer (Int32)}
     */
    static WIAVIDEO_VIDEO_PLAYING => 4

    /**
     * A video stream has been successfully created, and the video is paused. The application can now call the <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-takepicture">IWiaVideo::TakePicture</a> method.
     * @type {Integer (Int32)}
     */
    static WIAVIDEO_VIDEO_PAUSED => 5

    /**
     * The application called <a href="https://docs.microsoft.com/windows/desktop/api/wiavideo/nf-wiavideo-iwiavideo-destroyvideo">IWiaVideo::DestroyVideo</a> method, and WIA is in the process of destroying the video stream.
     * @type {Integer (Int32)}
     */
    static WIAVIDEO_DESTROYING_VIDEO => 6
}
