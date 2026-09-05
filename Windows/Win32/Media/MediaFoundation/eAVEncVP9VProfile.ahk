#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncVP9VProfile extends Win32Enum {

    /**
     * Native name: eAVEncVP9VProfile_unknown
     * @type {Integer (Int32)}
     */
    static unknown => 0

    /**
     * Native name: eAVEncVP9VProfile_420_8
     * @type {Integer (Int32)}
     */
    static 420_8 => 1

    /**
     * Native name: eAVEncVP9VProfile_420_10
     * @type {Integer (Int32)}
     */
    static 420_10 => 2

    /**
     * Native name: eAVEncVP9VProfile_420_12
     * @type {Integer (Int32)}
     */
    static 420_12 => 3
}
