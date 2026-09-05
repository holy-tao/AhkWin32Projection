#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Foundation
 */
class DUPLICATE_HANDLE_OPTIONS extends Win32BitflagEnum {

    /**
     * Native name: DUPLICATE_CLOSE_SOURCE
     * @type {Integer (UInt32)}
     */
    static CLOSE_SOURCE => 1

    /**
     * Native name: DUPLICATE_SAME_ACCESS
     * @type {Integer (UInt32)}
     */
    static SAME_ACCESS => 2
}
