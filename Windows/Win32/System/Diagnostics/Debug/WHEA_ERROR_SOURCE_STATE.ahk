#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WHEA_ERROR_SOURCE_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcStateStopped => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcStateStarted => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcStateRemoved => 3

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcStateRemovePending => 4
}
