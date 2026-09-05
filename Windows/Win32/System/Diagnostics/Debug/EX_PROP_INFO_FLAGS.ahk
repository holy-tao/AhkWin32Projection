#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class EX_PROP_INFO_FLAGS extends Win32Enum {

    /**
     * Native name: EX_PROP_INFO_ID
     * @type {Integer (Int32)}
     */
    static ID => 256

    /**
     * Native name: EX_PROP_INFO_NTYPE
     * @type {Integer (Int32)}
     */
    static NTYPE => 512

    /**
     * Native name: EX_PROP_INFO_NVALUE
     * @type {Integer (Int32)}
     */
    static NVALUE => 1024

    /**
     * Native name: EX_PROP_INFO_LOCKBYTES
     * @type {Integer (Int32)}
     */
    static LOCKBYTES => 2048

    /**
     * Native name: EX_PROP_INFO_DEBUGEXTPROP
     * @type {Integer (Int32)}
     */
    static DEBUGEXTPROP => 4096
}
