#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class BDCB_CALLBACK_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static BdCbStatusUpdate => 0

    /**
     * @type {Integer (Int32)}
     */
    static BdCbInitializeImage => 1
}
