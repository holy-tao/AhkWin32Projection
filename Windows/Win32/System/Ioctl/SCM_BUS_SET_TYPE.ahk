#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_BUS_SET_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ScmBusSet_Descriptor => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScmBusSet_IsSupported => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScmBusSet_Max => 2
}
