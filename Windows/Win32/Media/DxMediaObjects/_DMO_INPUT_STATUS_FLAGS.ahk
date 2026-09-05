#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DxMediaObjects
 */
class _DMO_INPUT_STATUS_FLAGS extends Win32Enum {

    /**
     * Native name: DMO_INPUT_STATUSF_ACCEPT_DATA
     * @type {Integer (Int32)}
     */
    static STATUSF_ACCEPT_DATA => 1
}
