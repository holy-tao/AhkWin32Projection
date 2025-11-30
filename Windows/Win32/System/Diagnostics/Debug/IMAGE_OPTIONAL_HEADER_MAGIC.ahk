#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_OPTIONAL_HEADER_MAGIC extends Win32Enum{

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_NT_OPTIONAL_HDR_MAGIC => 523

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_NT_OPTIONAL_HDR32_MAGIC => 267

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_NT_OPTIONAL_HDR64_MAGIC => 523

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_ROM_OPTIONAL_HDR_MAGIC => 263
}
