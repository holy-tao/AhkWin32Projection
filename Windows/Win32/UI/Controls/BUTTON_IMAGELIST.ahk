#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Contains information about an image list that is used with a button control.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-button_imagelist
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class BUTTON_IMAGELIST extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>HIMAGELIST</b>
     * 
     * A handle to the image list. The provider retains ownership of the image list and is ultimately responsible for its disposal. Under Windows Vista, you can pass BCCL_NOGLYPH in this parameter to indicate that no glyph should be displayed.
     * @type {Pointer}
     */
    himl {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> that specifies the margin around the icon.
     * @type {RECT}
     */
    margin{
        get {
            if(!this.HasProp("__margin"))
                this.__margin := RECT(this.ptr + 8)
            return this.__margin
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    uAlign {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
