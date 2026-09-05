#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether the input frames for an encoder are progressive or interlaced. This enumeration is used with the AVEncVideoForceSourceScanType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideosourcescantype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncVideoSourceScanType extends Win32Enum {

    /**
     * Use the media type on the encoder's input pin to determine whether the frames are progressive or interlaced.
     * Native name: eAVEncVideoSourceScan_Automatic
     * @type {Integer (Int32)}
     */
    static Automatic => 0

    /**
     * Input frames are interlaced.
     * Native name: eAVEncVideoSourceScan_Interlaced
     * @type {Integer (Int32)}
     */
    static Interlaced => 1

    /**
     * Input frames are progressive.
     * Native name: eAVEncVideoSourceScan_Progressive
     * @type {Integer (Int32)}
     */
    static Progressive => 2
}
