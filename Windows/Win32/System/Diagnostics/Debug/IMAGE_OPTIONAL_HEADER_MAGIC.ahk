#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class IMAGE_OPTIONAL_HEADER_MAGIC extends Win32Enum {

    /**
     * Native name: IMAGE_NT_OPTIONAL_HDR_MAGIC
     * @type {Integer (UInt16)}
     */
    static NT_OPTIONAL_HDR_MAGIC => 523

    /**
     * Native name: IMAGE_NT_OPTIONAL_HDR32_MAGIC
     * @type {Integer (UInt16)}
     */
    static NT_OPTIONAL_HDR32_MAGIC => 267

    /**
     * Native name: IMAGE_NT_OPTIONAL_HDR64_MAGIC
     * @type {Integer (UInt16)}
     */
    static NT_OPTIONAL_HDR64_MAGIC => 523

    /**
     * Native name: IMAGE_ROM_OPTIONAL_HDR_MAGIC
     * @type {Integer (UInt16)}
     */
    static ROM_OPTIONAL_HDR_MAGIC => 263
}
