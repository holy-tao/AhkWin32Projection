#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TF_SELECTIONSTYLE.ahk

/**
 * The TF_SELECTION structure contains text selection data.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ns-msctf-tf_selection
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TF_SELECTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that specifies the selected text.
     * @type {ITfRange}
     */
    range {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_selectionstyle">TF_SELECTIONSTYLE</a> structure that contains selection data.
     * @type {TF_SELECTIONSTYLE}
     */
    style{
        get {
            if(!this.HasProp("__style"))
                this.__style := TF_SELECTIONSTYLE(8, this)
            return this.__style
        }
    }
}
