#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class HANDLE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static HANDLE_FLAG_INHERIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HANDLE_FLAG_PROTECT_FROM_CLOSE => 2
}
