#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how the decoded video stream is interlaced. This enumeration is used with the AVDecVideoInputScanType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdecvideoinputscantype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVDecVideoInputScanType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The interlacing is not known.
     * @type {Integer (Int32)}
     */
    static eAVDecVideoInputScan_Unknown => 0

    /**
     * Decoded frames are progressive.
     * @type {Integer (Int32)}
     */
    static eAVDecVideoInputScan_Progressive => 1

    /**
     * Decoded frames are interlaced, with the upper field appearing first.
     * @type {Integer (Int32)}
     */
    static eAVDecVideoInputScan_Interlaced_UpperFieldFirst => 2

    /**
     * Decoded frames are interlaced, with the lower field appearing first.
     * @type {Integer (Int32)}
     */
    static eAVDecVideoInputScan_Interlaced_LowerFieldFirst => 3
}
