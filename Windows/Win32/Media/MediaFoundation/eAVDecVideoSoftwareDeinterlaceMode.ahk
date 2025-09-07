#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a video decoder's software deinterlace mode. This enumeration is used with the AVDecVideoSoftwareDeinterlaceMode property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdecvideosoftwaredeinterlacemode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVDecVideoSoftwareDeinterlaceMode{

    /**
     * No software deinterlacing.
     * @type {Integer (Int32)}
     */
    static eAVDecVideoSoftwareDeinterlaceMode_NoDeinterlacing => 0

    /**
     * Progressive deinterlacing.
     * @type {Integer (Int32)}
     */
    static eAVDecVideoSoftwareDeinterlaceMode_ProgressiveDeinterlacing => 1

    /**
     * Bob deinterlacing.
     * @type {Integer (Int32)}
     */
    static eAVDecVideoSoftwareDeinterlaceMode_BOBDeinterlacing => 2

    /**
     * "Smart" bob deinterlacing.
     * @type {Integer (Int32)}
     */
    static eAVDecVideoSoftwareDeinterlaceMode_SmartBOBDeinterlacing => 3
}
