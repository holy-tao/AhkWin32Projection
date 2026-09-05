#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_BUS_QUERY_TYPE extends Win32Enum {

    /**
     * Native name: ScmBusQuery_Descriptor
     * @type {Integer (Int32)}
     */
    static Descriptor => 0

    /**
     * Native name: ScmBusQuery_IsSupported
     * @type {Integer (Int32)}
     */
    static IsSupported => 1

    /**
     * Native name: ScmBusQuery_Max
     * @type {Integer (Int32)}
     */
    static Max => 2
}
