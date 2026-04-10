#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Foundation
 */
class DUPLICATE_HANDLE_OPTIONS extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static DUPLICATE_CLOSE_SOURCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DUPLICATE_SAME_ACCESS => 2
}
