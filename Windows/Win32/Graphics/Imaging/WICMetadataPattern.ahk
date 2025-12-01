#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a metadata pattern.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/ns-wincodecsdk-wicmetadatapattern
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICMetadataPattern extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>ULARGE_INTEGER</b>
     * 
     * The position of the pattern.
     * @type {Integer}
     */
    Position {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The length of the pattern.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>BYTE*</b>
     * 
     * Pointer to the pattern.
     * @type {Pointer<Integer>}
     */
    Pattern {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>BYTE*</b>
     * 
     * Pointer to the pattern mask.
     * @type {Pointer<Integer>}
     */
    Mask {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>ULARGE_INTEGER</b>
     * 
     * The offset location of the pattern.
     * @type {Integer}
     */
    DataOffset {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
