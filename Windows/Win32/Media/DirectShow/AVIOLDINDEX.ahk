#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AVIOLDINDEX structure describes an AVI 1.0 index ('idx1' format). New AVI files should use an AVI 2.0 index ('indx' format).
 * @remarks
 * This structure consists of the initial RIFF chunk (the <b>fcc</b> and <b>cb</b> members) followed by one index entry for each data chunk in the 'movi' list.
 * @see https://learn.microsoft.com/windows/win32/api/aviriff/ns-aviriff-avioldindex
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AVIOLDINDEX extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies a FOURCC code. The value must be 'idx1'.
     * @type {Integer}
     */
    fcc {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the size of the structure, not including the initial 8 bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwChunkId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
