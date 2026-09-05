#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class FORMAT_MESSAGE_OPTIONS extends Win32BitflagEnum {

    /**
     * Native name: FORMAT_MESSAGE_ALLOCATE_BUFFER
     * @type {Integer (UInt32)}
     */
    static ALLOCATE_BUFFER => 256

    /**
     * Native name: FORMAT_MESSAGE_ARGUMENT_ARRAY
     * @type {Integer (UInt32)}
     */
    static ARGUMENT_ARRAY => 8192

    /**
     * Native name: FORMAT_MESSAGE_FROM_HMODULE
     * @type {Integer (UInt32)}
     */
    static FROM_HMODULE => 2048

    /**
     * Native name: FORMAT_MESSAGE_FROM_STRING
     * @type {Integer (UInt32)}
     */
    static FROM_STRING => 1024

    /**
     * Native name: FORMAT_MESSAGE_FROM_SYSTEM
     * @type {Integer (UInt32)}
     */
    static FROM_SYSTEM => 4096

    /**
     * Native name: FORMAT_MESSAGE_IGNORE_INSERTS
     * @type {Integer (UInt32)}
     */
    static IGNORE_INSERTS => 512
}
