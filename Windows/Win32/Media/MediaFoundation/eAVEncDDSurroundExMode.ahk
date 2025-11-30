#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether a Dolby Digital audio stream is encoded in Dolby Digital Surround EX. This enumeration is used with the AVEncDDSurroundExMode property.
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavencddsurroundexmode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncDDSurroundExMode extends Win32Enum{

    /**
     * The Surround EX mode is not indicated.
     * @type {Integer (Int32)}
     */
    static eAVEncDDSurroundExMode_NotIndicated => 0

    /**
     * The audio is not encoded in Surround EX.
     * @type {Integer (Int32)}
     */
    static eAVEncDDSurroundExMode_No => 1

    /**
     * The audio is encoded in Surround EX.
     * @type {Integer (Int32)}
     */
    static eAVEncDDSurroundExMode_Yes => 2
}
