#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class VIEW_OBJECT_PROPERTIES_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static VPF_SELECTRELATIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VPF_DISABLERELATIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VPF_DISABLESCALE => 4
}
