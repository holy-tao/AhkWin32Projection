#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates video compression capabilities.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-compressioncaps
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class CompressionCaps{

    /**
     * Video compressor supports the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-put_quality">IAMVideoCompression::put_Quality</a> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-get_quality">IAMVideoCompression::get_Quality</a> methods.
     * @type {Integer (Int32)}
     */
    static CompressionCaps_CanQuality => 1

    /**
     * Video compressor can compress video to a specified data rate. If the compressor has this capability then the output pins media type will contain the data rate in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader">VIDEOINFOHEADER</a> structure's <b>dwBitRate</b> member. The only way to set the data rate is to set <b>dwBitRate</b>.
     * @type {Integer (Int32)}
     */
    static CompressionCaps_CanCrunch => 2

    /**
     * Video compressor supports the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-put_keyframerate">IAMVideoCompression::put_KeyFrameRate</a> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-get_keyframerate">IAMVideoCompression::get_KeyFrameRate</a> methods.
     * @type {Integer (Int32)}
     */
    static CompressionCaps_CanKeyFrame => 4

    /**
     * Video compressor supports the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-put_pframesperkeyframe">IAMVideoCompression::put_PFramesPerKeyFrame</a> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-get_pframesperkeyframe">IAMVideoCompression::get_PFramesPerKeyFrame</a> methods.
     * @type {Integer (Int32)}
     */
    static CompressionCaps_CanBFrame => 8

    /**
     * Video compressor supports the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-put_windowsize">IAMVideoCompression::put_WindowSize</a> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamvideocompression-get_windowsize">IAMVideoCompression::get_WindowSize</a> methods.
     * @type {Integer (Int32)}
     */
    static CompressionCaps_CanWindow => 16
}
