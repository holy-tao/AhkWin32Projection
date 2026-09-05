#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DxMediaObjects
 */
class _DMO_INPLACE_PROCESS_FLAGS extends Win32Enum {

    /**
     * Native name: DMO_INPLACE_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Native name: DMO_INPLACE_ZERO
     * @type {Integer (Int32)}
     */
    static ZERO => 1
}
