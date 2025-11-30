#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class EX_PROP_INFO_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EX_PROP_INFO_ID => 256

    /**
     * @type {Integer (Int32)}
     */
    static EX_PROP_INFO_NTYPE => 512

    /**
     * @type {Integer (Int32)}
     */
    static EX_PROP_INFO_NVALUE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static EX_PROP_INFO_LOCKBYTES => 2048

    /**
     * @type {Integer (Int32)}
     */
    static EX_PROP_INFO_DEBUGEXTPROP => 4096
}
