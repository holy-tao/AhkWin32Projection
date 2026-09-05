#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class IMAGE_DEBUG_TYPE extends Win32Enum {

    /**
     * Native name: IMAGE_DEBUG_TYPE_UNKNOWN
     * @type {Integer (UInt32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: IMAGE_DEBUG_TYPE_COFF
     * @type {Integer (UInt32)}
     */
    static COFF => 1

    /**
     * Native name: IMAGE_DEBUG_TYPE_CODEVIEW
     * @type {Integer (UInt32)}
     */
    static CODEVIEW => 2

    /**
     * Native name: IMAGE_DEBUG_TYPE_FPO
     * @type {Integer (UInt32)}
     */
    static FPO => 3

    /**
     * Native name: IMAGE_DEBUG_TYPE_MISC
     * @type {Integer (UInt32)}
     */
    static MISC => 4

    /**
     * Native name: IMAGE_DEBUG_TYPE_EXCEPTION
     * @type {Integer (UInt32)}
     */
    static EXCEPTION => 5

    /**
     * Native name: IMAGE_DEBUG_TYPE_FIXUP
     * @type {Integer (UInt32)}
     */
    static FIXUP => 6

    /**
     * Native name: IMAGE_DEBUG_TYPE_BORLAND
     * @type {Integer (UInt32)}
     */
    static BORLAND => 9
}
