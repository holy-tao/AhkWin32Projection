#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An ImageCodecInfo object stores information about an image codec (encoder/decoder).
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusimaging/nl-gdiplusimaging-imagecodecinfo
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ImageCodecInfo extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    Clsid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    FormatID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Char>}
     */
    CodecName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Char>}
     */
    DllName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Char>}
     */
    FormatDescription {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Char>}
     */
    FilenameExtension {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Char>}
     */
    MimeType {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    SigCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    SigSize {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Pointer<Byte>}
     */
    SigPattern {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<Byte>}
     */
    SigMask {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
