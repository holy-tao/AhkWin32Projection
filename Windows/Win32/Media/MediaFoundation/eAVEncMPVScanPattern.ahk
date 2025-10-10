#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the macroblock scan pattern. This enumeration is used with the AVEncMPVScanPattern property.
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavencmpvscanpattern
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncMPVScanPattern{

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
