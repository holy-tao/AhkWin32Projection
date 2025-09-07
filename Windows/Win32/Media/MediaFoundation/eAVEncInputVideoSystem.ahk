#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the nominal range for a video source. This enumeration is used with the AVEncInputVideoSystem property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencinputvideosystem
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncInputVideoSystem{

    /**
     * The video system is not specified.
     * @type {Integer (Int32)}
     */
    static eAVEncInputVideoSystem_Unspecified => 0

    /**
     * PAL television.
     * @type {Integer (Int32)}
     */
    static eAVEncInputVideoSystem_PAL => 1

    /**
     * NTSC television.
     * @type {Integer (Int32)}
     */
    static eAVEncInputVideoSystem_NTSC => 2

    /**
     * SECAM television.
     * @type {Integer (Int32)}
     */
    static eAVEncInputVideoSystem_SECAM => 3

    /**
     * Not documented for this release.
     * @type {Integer (Int32)}
     */
    static eAVEncInputVideoSystem_MAC => 4

    /**
     * High-definition (HD) video.
     * @type {Integer (Int32)}
     */
    static eAVEncInputVideoSystem_HDV => 5

    /**
     * Component video.
     * @type {Integer (Int32)}
     */
    static eAVEncInputVideoSystem_Component => 6
}
