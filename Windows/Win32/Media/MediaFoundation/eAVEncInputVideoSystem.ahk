#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the nominal range for a video source. This enumeration is used with the AVEncInputVideoSystem property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencinputvideosystem
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncInputVideoSystem extends Win32Enum {

    /**
     * The video system is not specified.
     * Native name: eAVEncInputVideoSystem_Unspecified
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * PAL television.
     * Native name: eAVEncInputVideoSystem_PAL
     * @type {Integer (Int32)}
     */
    static PAL => 1

    /**
     * NTSC television.
     * Native name: eAVEncInputVideoSystem_NTSC
     * @type {Integer (Int32)}
     */
    static NTSC => 2

    /**
     * SECAM television.
     * Native name: eAVEncInputVideoSystem_SECAM
     * @type {Integer (Int32)}
     */
    static SECAM => 3

    /**
     * Not documented for this release.
     * Native name: eAVEncInputVideoSystem_MAC
     * @type {Integer (Int32)}
     */
    static MAC => 4

    /**
     * High-definition (HD) video.
     * Native name: eAVEncInputVideoSystem_HDV
     * @type {Integer (Int32)}
     */
    static HDV => 5

    /**
     * Component video.
     * Native name: eAVEncInputVideoSystem_Component
     * @type {Integer (Int32)}
     */
    static Component => 6
}
