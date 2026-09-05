#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a video decoder's software deinterlace mode. This enumeration is used with the AVDecVideoSoftwareDeinterlaceMode property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdecvideosoftwaredeinterlacemode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVDecVideoSoftwareDeinterlaceMode extends Win32Enum {

    /**
     * No software deinterlacing.
     * Native name: eAVDecVideoSoftwareDeinterlaceMode_NoDeinterlacing
     * @type {Integer (Int32)}
     */
    static NoDeinterlacing => 0

    /**
     * Progressive deinterlacing.
     * Native name: eAVDecVideoSoftwareDeinterlaceMode_ProgressiveDeinterlacing
     * @type {Integer (Int32)}
     */
    static ProgressiveDeinterlacing => 1

    /**
     * Bob deinterlacing.
     * Native name: eAVDecVideoSoftwareDeinterlaceMode_BOBDeinterlacing
     * @type {Integer (Int32)}
     */
    static BOBDeinterlacing => 2

    /**
     * "Smart" bob deinterlacing.
     * Native name: eAVDecVideoSoftwareDeinterlaceMode_SmartBOBDeinterlacing
     * @type {Integer (Int32)}
     */
    static SmartBOBDeinterlacing => 3
}
