#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the intended aspect ratio for a video stream.
 * @remarks
 * 
 * Use these flags with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-source-content-hint-attribute">MF_MT_SOURCE_CONTENT_HINT</a> attribute.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ne-mfapi-mfvideosrccontenthintflags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoSrcContentHintFlags{

    /**
     * The aspect ratio is unknown.
     * @type {Integer (Int32)}
     */
    static MFVideoSrcContentHintFlag_None => 0

    /**
     * The source is 16×9 content encoded within a 4×3 area.
     * @type {Integer (Int32)}
     */
    static MFVideoSrcContentHintFlag_16x9 => 1

    /**
     * The source is 2.35:1 content encoded within a 16×9 or 4×3 area.
     * @type {Integer (Int32)}
     */
    static MFVideoSrcContentHintFlag_235_1 => 2
}
