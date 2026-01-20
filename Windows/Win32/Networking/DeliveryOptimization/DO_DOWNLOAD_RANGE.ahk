#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Identifies a single range of bytes to download from a file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/ns-deliveryoptimization-do_download_range
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 * @version v4.0.30319
 */
class DO_DOWNLOAD_RANGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Zero-based offset to the beginning of the range of bytes to download from a file.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The length of the range, in bytes. Do not specify a zero-byte length. To indicate that the range extends to the end of the file, specify **DO_LENGTH_TO_EOF**.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
