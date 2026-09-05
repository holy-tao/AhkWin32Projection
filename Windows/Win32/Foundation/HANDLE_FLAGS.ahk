#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Foundation
 */
class HANDLE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: HANDLE_FLAG_INHERIT
     * @type {Integer (UInt32)}
     */
    static FLAG_INHERIT => 1

    /**
     * Native name: HANDLE_FLAG_PROTECT_FROM_CLOSE
     * @type {Integer (UInt32)}
     */
    static FLAG_PROTECT_FROM_CLOSE => 2
}
