#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the macroblock scan pattern. This enumeration is used with the AVEncMPVScanPattern property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencmpvscanpattern
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncMPVScanPattern extends Win32Enum {

    /**
     * The encoder selects the scan pattern.
     * Native name: eAVEncMPVScanPattern_Auto
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Zig-zag scan.
     * Native name: eAVEncMPVScanPattern_ZigZagScan
     * @type {Integer (Int32)}
     */
    static ZigZagScan => 1

    /**
     * Alternate-vertical scan.
     * Native name: eAVEncMPVScanPattern_AlternateScan
     * @type {Integer (Int32)}
     */
    static AlternateScan => 2
}
