#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OBJECT_PROPERTIES_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static OPF_OBJECTISLINK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OPF_NOFILLDEFAULT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OPF_SHOWHELP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OPF_DISABLECONVERT => 8
}
