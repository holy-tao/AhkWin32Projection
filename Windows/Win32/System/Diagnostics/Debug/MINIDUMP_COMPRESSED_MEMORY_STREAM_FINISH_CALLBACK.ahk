#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class MINIDUMP_COMPRESSED_MEMORY_STREAM_FINISH_CALLBACK extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    CompressedStreamSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    StreamCompressionRate {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
