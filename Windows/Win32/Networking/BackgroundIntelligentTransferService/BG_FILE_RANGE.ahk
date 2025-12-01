#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Identifies a range of bytes to download from a file.
 * @remarks
 * The range must exist in the file or BITS generates an <b>BG_E_INVALID_RANGE</b> error.
 * @see https://learn.microsoft.com/windows/win32/api/bits2_0/ns-bits2_0-bg_file_range
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_FILE_RANGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Zero-based offset to the beginning of the range of bytes to download from a file.
     * @type {Integer}
     */
    InitialOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The length of the range, in bytes. Do not specify a zero byte length. To indicate that the range extends to the end of the file, specify <b>BG_LENGTH_TO_EOF</b>.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
