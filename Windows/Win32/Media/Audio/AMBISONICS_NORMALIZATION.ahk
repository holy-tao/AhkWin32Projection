#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 */
class AMBISONICS_NORMALIZATION extends Win32Enum {

    /**
     * Native name: AMBISONICS_NORMALIZATION_SN3D
     * @type {Integer (Int32)}
     */
    static SN3D => 0

    /**
     * Native name: AMBISONICS_NORMALIZATION_N3D
     * @type {Integer (Int32)}
     */
    static N3D => 1
}
