#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether a Dolby Digital audio stream is encoded in Dolby Digital Surround EX. This enumeration is used with the AVEncDDSurroundExMode property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencddsurroundexmode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncDDSurroundExMode extends Win32Enum {

    /**
     * The Surround EX mode is not indicated.
     * Native name: eAVEncDDSurroundExMode_NotIndicated
     * @type {Integer (Int32)}
     */
    static NotIndicated => 0

    /**
     * The audio is not encoded in Surround EX.
     * Native name: eAVEncDDSurroundExMode_No
     * @type {Integer (Int32)}
     */
    static No => 1

    /**
     * The audio is encoded in Surround EX.
     * Native name: eAVEncDDSurroundExMode_Yes
     * @type {Integer (Int32)}
     */
    static Yes => 2
}
