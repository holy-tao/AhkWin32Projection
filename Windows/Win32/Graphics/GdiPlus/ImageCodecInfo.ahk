#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ImageCodecInfo extends Win32Struct {
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Guid}
     */
    Clsid {
        get {
            if(!this.HasProp("__Clsid"))
                this.__Clsid := Guid(0, this)
            return this.__Clsid
        }
    }

    /**
     * @type {Guid}
     */
    FormatID {
        get {
            if(!this.HasProp("__FormatID"))
                this.__FormatID := Guid(16, this)
            return this.__FormatID
        }
    }

    /**
     * @type {PWSTR}
     */
    CodecName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {PWSTR}
     */
    DllName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {PWSTR}
     */
    FormatDescription {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {PWSTR}
     */
    FilenameExtension {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {PWSTR}
     */
    MimeType {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    SigCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    SigSize {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Pointer<Integer>}
     */
    SigPattern {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<Integer>}
     */
    SigMask {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
