#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the macroblock scan pattern. This enumeration is used with the AVEncMPVScanPattern property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpvscanpattern
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncMPVScanPattern {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The encoder selects the scan pattern.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVScanPattern_Auto => 0

    /**
     * Zig-zag scan.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVScanPattern_ZigZagScan => 1

    /**
     * Alternate-vertical scan.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVScanPattern_AlternateScan => 2
}
