#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains members that identify a pattern within an image file which can be used to identify a particular format.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ns-wincodec-wicbitmappattern
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICBitmapPattern extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>ULARGE_INTEGER</b>
     * 
     * The offset the pattern is located in the file.
     * @type {Integer}
     */
    Position {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The pattern length.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>BYTE*</b>
     * 
     * The actual pattern.
     * @type {Pointer<Byte>}
     */
    Pattern {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>BYTE*</b>
     * 
     * The pattern mask.
     * @type {Pointer<Byte>}
     */
    Mask {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * The end of the stream.
     * @type {BOOL}
     */
    EndOfStream{
        get {
            if(!this.HasProp("__EndOfStream"))
                this.__EndOfStream := BOOL(this.ptr + 32)
            return this.__EndOfStream
        }
    }
}
