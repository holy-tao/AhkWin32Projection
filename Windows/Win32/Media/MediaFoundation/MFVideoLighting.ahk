#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the optimal lighting for viewing a particular set of video content.
 * @remarks
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-lighting-attribute">MF_MT_VIDEO_LIGHTING</a> attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mfvideolighting
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFVideoLighting extends Win32Enum {

    /**
     * The optimal lighting is unknown.
     * Native name: MFVideoLighting_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Bright lighting; for example, outdoors.
     * Native name: MFVideoLighting_bright
     * @type {Integer (Int32)}
     */
    static bright => 1

    /**
     * Medium brightness; for example, normal office lighting.
     * Native name: MFVideoLighting_office
     * @type {Integer (Int32)}
     */
    static office => 2

    /**
     * Dim; for example, a living room with a television and additional low lighting.
     * Native name: MFVideoLighting_dim
     * @type {Integer (Int32)}
     */
    static dim => 3

    /**
     * Dark; for example, a movie theater.
     * Native name: MFVideoLighting_dark
     * @type {Integer (Int32)}
     */
    static dark => 4

    /**
     * Reserved.
     * Native name: MFVideoLighting_Last
     * @type {Integer (Int32)}
     */
    static Last => 5

    /**
     * Reserved. This member forces the enumeration type to compile as a <b>DWORD</b> value.
     * Native name: MFVideoLighting_ForceDWORD
     * @type {Integer (Int32)}
     */
    static ForceDWORD => 2147483647
}
