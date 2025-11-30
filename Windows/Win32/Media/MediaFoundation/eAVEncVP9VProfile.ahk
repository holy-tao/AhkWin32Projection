#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncVP9VProfile extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncVP9VProfile_unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncVP9VProfile_420_8 => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncVP9VProfile_420_10 => 2

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncVP9VProfile_420_12 => 3
}
