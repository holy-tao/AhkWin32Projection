#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class FORMAT_MESSAGE_OPTIONS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static FORMAT_MESSAGE_ALLOCATE_BUFFER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FORMAT_MESSAGE_ARGUMENT_ARRAY => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static FORMAT_MESSAGE_FROM_HMODULE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FORMAT_MESSAGE_FROM_STRING => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FORMAT_MESSAGE_FROM_SYSTEM => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FORMAT_MESSAGE_IGNORE_INSERTS => 512
}
