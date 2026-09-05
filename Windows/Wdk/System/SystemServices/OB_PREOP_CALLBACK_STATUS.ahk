#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class OB_PREOP_CALLBACK_STATUS extends Win32Enum {

    /**
     * Native name: OB_PREOP_SUCCESS
     * @type {Integer (Int32)}
     */
    static SUCCESS => 0
}
