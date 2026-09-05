#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the decoded video stream is interlaced. This enumeration is used with the AVDecVideoInputScanType property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavdecvideoinputscantype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVDecVideoInputScanType extends Win32Enum {

    /**
     * The interlacing is not known.
     * Native name: eAVDecVideoInputScan_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Decoded frames are progressive.
     * Native name: eAVDecVideoInputScan_Progressive
     * @type {Integer (Int32)}
     */
    static Progressive => 1

    /**
     * Decoded frames are interlaced, with the upper field appearing first.
     * Native name: eAVDecVideoInputScan_Interlaced_UpperFieldFirst
     * @type {Integer (Int32)}
     */
    static Interlaced_UpperFieldFirst => 2

    /**
     * Decoded frames are interlaced, with the lower field appearing first.
     * Native name: eAVDecVideoInputScan_Interlaced_LowerFieldFirst
     * @type {Integer (Int32)}
     */
    static Interlaced_LowerFieldFirst => 3
}
