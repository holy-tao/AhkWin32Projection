#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WAIT_CHAIN_THREAD_OPTIONS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static WCT_OUT_OF_PROC_COM_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WCT_OUT_OF_PROC_CS_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WCT_OUT_OF_PROC_FLAG => 1
}
