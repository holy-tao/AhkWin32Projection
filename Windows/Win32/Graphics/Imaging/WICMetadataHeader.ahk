#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents metadata header.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/ns-wincodecsdk-wicmetadataheader
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICMetadataHeader extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>ULARGE_INTEGER</b>
     * 
     * The position of the header.
     * @type {Integer}
     */
    Position {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The length of the header.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>BYTE*</b>
     * 
     * Pointer to the header.
     * @type {Pointer<Integer>}
     */
    Header {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>ULARGE_INTEGER</b>
     * 
     * The offset of the header.
     * @type {Integer}
     */
    DataOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
