#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_DEBUG_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_COFF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_CODEVIEW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_FPO => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_MISC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_EXCEPTION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_FIXUP => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_BORLAND => 9
}
