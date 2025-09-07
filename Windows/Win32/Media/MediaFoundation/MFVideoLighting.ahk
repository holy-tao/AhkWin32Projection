#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the optimal lighting for viewing a particular set of video content.
 * @remarks
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-lighting-attribute">MF_MT_VIDEO_LIGHTING</a> attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mfvideolighting
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoLighting{

    /**
     * The optimal lighting is unknown.
     * @type {Integer (Int32)}
     */
    static MFVideoLighting_Unknown => 0

    /**
     * Bright lighting; for example, outdoors.
     * @type {Integer (Int32)}
     */
    static MFVideoLighting_bright => 1

    /**
     * Medium brightness; for example, normal office lighting.
     * @type {Integer (Int32)}
     */
    static MFVideoLighting_office => 2

    /**
     * Dim; for example, a living room with a television and additional low lighting.
     * @type {Integer (Int32)}
     */
    static MFVideoLighting_dim => 3

    /**
     * Dark; for example, a movie theater.
     * @type {Integer (Int32)}
     */
    static MFVideoLighting_dark => 4

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static MFVideoLighting_Last => 5

    /**
     * Reserved. This member forces the enumeration type to compile as a <b>DWORD</b> value.
     * @type {Integer (Int32)}
     */
    static MFVideoLighting_ForceDWORD => 2147483647
}
