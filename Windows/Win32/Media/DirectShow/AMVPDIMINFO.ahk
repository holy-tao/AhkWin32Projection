#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The AMVPDIMINFO structure specifies the dimensional characteristics of a video port (VP) input stream.
 * @see https://learn.microsoft.com/windows/win32/api/vptype/ns-vptype-amvpdiminfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMVPDIMINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Field width of the data.
     * @type {Integer}
     */
    dwFieldWidth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Field height of the data.
     * @type {Integer}
     */
    dwFieldHeight {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Width of the VBI data.
     * @type {Integer}
     */
    dwVBIWidth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Height of the VBI data.
     * @type {Integer}
     */
    dwVBIHeight {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Valid rectangle, used for cropping.
     * @type {RECT}
     */
    rcValidRegion{
        get {
            if(!this.HasProp("__rcValidRegion"))
                this.__rcValidRegion := RECT(16, this)
            return this.__rcValidRegion
        }
    }
}
