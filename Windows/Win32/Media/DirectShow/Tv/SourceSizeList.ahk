#Requires AutoHotkey v2.0.0 64-bit

/**
 * This topic applies to Windows XP or later.
 * @see https://docs.microsoft.com/windows/win32/api//segment/ne-segment-sourcesizelist
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class SourceSizeList{

    /**
     * Do not clip the source video rectangle.
     * @type {Integer (Int32)}
     */
    static sslFullSize => 0

    /**
     * Clip the source video rectangle by the value specified in the last call to <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidvideorenderer-put_overscan">IMSVidVideoRenderer::put_OverScan</a>.
     * @type {Integer (Int32)}
     */
    static sslClipByOverScan => 1

    /**
     * Clip the source video rectangle by the value specified in the last call to <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidvideorenderer-put_clippedsourcerect">IMSVidVideoRenderer::put_ClippedSourceRect</a>
     * @type {Integer (Int32)}
     */
    static sslClipByClipRect => 2
}
