#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the intended lighting conditions for viewing a video source. This enumeration is used with the AVEncVideoInputColorLighting and AVEncVideoOutputColorLighting properties.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideocolorlighting
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncVideoColorLighting extends Win32Enum {

    /**
     * Use the same lighting as the input video. This flag applies to the <b>AVEncVideoOutputColorLighting</b> property only.
     * Native name: eAVEncVideoColorLighting_SameAsSource
     * @type {Integer (Int32)}
     */
    static SameAsSource => 0

    /**
     * The optimal lighting is unknown.
     * Native name: eAVEncVideoColorLighting_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 1

    /**
     * Bright lighting; for example, outdoors.
     * Native name: eAVEncVideoColorLighting_Bright
     * @type {Integer (Int32)}
     */
    static Bright => 2

    /**
     * Medium brightness; for example, normal office lighting.
     * Native name: eAVEncVideoColorLighting_Office
     * @type {Integer (Int32)}
     */
    static Office => 3

    /**
     * Dim; for example, a living room with a television and additional low lighting.
     * Native name: eAVEncVideoColorLighting_Dim
     * @type {Integer (Int32)}
     */
    static Dim => 4

    /**
     * Dark; for example, a movie theater.
     * Native name: eAVEncVideoColorLighting_Dark
     * @type {Integer (Int32)}
     */
    static Dark => 5
}
