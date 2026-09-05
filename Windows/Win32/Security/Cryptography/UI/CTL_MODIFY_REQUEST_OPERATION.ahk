#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
class CTL_MODIFY_REQUEST_OPERATION extends Win32Enum {

    /**
     * Native name: CTL_MODIFY_REQUEST_ADD_TRUSTED
     * @type {Integer (UInt32)}
     */
    static ADD_TRUSTED => 3

    /**
     * Native name: CTL_MODIFY_REQUEST_ADD_NOT_TRUSTED
     * @type {Integer (UInt32)}
     */
    static ADD_NOT_TRUSTED => 1

    /**
     * Native name: CTL_MODIFY_REQUEST_REMOVE
     * @type {Integer (UInt32)}
     */
    static REMOVE => 2
}
