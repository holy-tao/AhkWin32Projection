#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a video decoder's software deinterlace mode. This enumeration is used with the AVDecVideoSoftwareDeinterlaceMode property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdecvideosoftwaredeinterlacemode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVDecVideoSoftwareDeinterlaceMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
