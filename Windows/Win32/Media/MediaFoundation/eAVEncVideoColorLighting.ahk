#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the intended lighting conditions for viewing a video source. This enumeration is used with the AVEncVideoInputColorLighting and AVEncVideoOutputColorLighting properties.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideocolorlighting
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncVideoColorLighting{

    /**
     * Use the same lighting as the input video. This flag applies to the <b>AVEncVideoOutputColorLighting</b> property only.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorLighting_SameAsSource => 0

    /**
     * The optimal lighting is unknown.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorLighting_Unknown => 1

    /**
     * Bright lighting; for example, outdoors.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorLighting_Bright => 2

    /**
     * Medium brightness; for example, normal office lighting.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorLighting_Office => 3

    /**
     * Dim; for example, a living room with a television and additional low lighting.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorLighting_Dim => 4

    /**
     * Dark; for example, a movie theater.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoColorLighting_Dark => 5
}
