#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates video compression capabilities.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-compressioncaps
 * @namespace Windows.Win32.Media.DirectShow
 */
class CompressionCaps extends Win32Enum {

    /**
     * Video compressor supports the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-put_quality">IAMVideoCompression::put_Quality</a> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-get_quality">IAMVideoCompression::get_Quality</a> methods.
     * Native name: CompressionCaps_CanQuality
     * @type {Integer (Int32)}
     */
    static CanQuality => 1

    /**
     * Video compressor can compress video to a specified data rate. If the compressor has this capability then the output pins media type will contain the data rate in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader">VIDEOINFOHEADER</a> structure's <b>dwBitRate</b> member. The only way to set the data rate is to set <b>dwBitRate</b>.
     * Native name: CompressionCaps_CanCrunch
     * @type {Integer (Int32)}
     */
    static CanCrunch => 2

    /**
     * Video compressor supports the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-put_keyframerate">IAMVideoCompression::put_KeyFrameRate</a> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-get_keyframerate">IAMVideoCompression::get_KeyFrameRate</a> methods.
     * Native name: CompressionCaps_CanKeyFrame
     * @type {Integer (Int32)}
     */
    static CanKeyFrame => 4

    /**
     * Video compressor supports the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-put_pframesperkeyframe">IAMVideoCompression::put_PFramesPerKeyFrame</a> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-get_pframesperkeyframe">IAMVideoCompression::get_PFramesPerKeyFrame</a> methods.
     * Native name: CompressionCaps_CanBFrame
     * @type {Integer (Int32)}
     */
    static CanBFrame => 8

    /**
     * Video compressor supports the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-put_windowsize">IAMVideoCompression::put_WindowSize</a> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-get_windowsize">IAMVideoCompression::get_WindowSize</a> methods.
     * Native name: CompressionCaps_CanWindow
     * @type {Integer (Int32)}
     */
    static CanWindow => 16
}
