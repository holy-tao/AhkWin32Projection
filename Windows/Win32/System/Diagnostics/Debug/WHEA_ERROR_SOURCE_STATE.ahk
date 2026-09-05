#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class WHEA_ERROR_SOURCE_STATE extends Win32Enum {

    /**
     * Native name: WheaErrSrcStateStopped
     * @type {Integer (Int32)}
     */
    static ErrSrcStateStopped => 1

    /**
     * Native name: WheaErrSrcStateStarted
     * @type {Integer (Int32)}
     */
    static ErrSrcStateStarted => 2

    /**
     * Native name: WheaErrSrcStateRemoved
     * @type {Integer (Int32)}
     */
    static ErrSrcStateRemoved => 3

    /**
     * Native name: WheaErrSrcStateRemovePending
     * @type {Integer (Int32)}
     */
    static ErrSrcStateRemovePending => 4
}
