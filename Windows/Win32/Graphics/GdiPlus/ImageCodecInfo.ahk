#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
     * @type {PWSTR}
     */
    CodecName{
        get {
            if(!this.HasProp("__CodecName"))
                this.__CodecName := PWSTR(this.ptr + 16)
            return this.__CodecName
        }
    }

    /**
     * @type {PWSTR}
     */
    DllName{
        get {
            if(!this.HasProp("__DllName"))
                this.__DllName := PWSTR(this.ptr + 24)
            return this.__DllName
        }
    }

    /**
     * @type {PWSTR}
     */
    FormatDescription{
        get {
            if(!this.HasProp("__FormatDescription"))
                this.__FormatDescription := PWSTR(this.ptr + 32)
            return this.__FormatDescription
        }
    }

    /**
     * @type {PWSTR}
     */
    FilenameExtension{
        get {
            if(!this.HasProp("__FilenameExtension"))
                this.__FilenameExtension := PWSTR(this.ptr + 40)
            return this.__FilenameExtension
        }
    }

    /**
     * @type {PWSTR}
     */
    MimeType{
        get {
            if(!this.HasProp("__MimeType"))
                this.__MimeType := PWSTR(this.ptr + 48)
            return this.__MimeType
        }
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
