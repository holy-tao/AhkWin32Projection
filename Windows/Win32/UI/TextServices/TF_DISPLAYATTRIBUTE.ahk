#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TF_DA_COLOR.ahk

/**
 * The TF_DISPLAYATTRIBUTE structure contains display attribute data for rendering text.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ns-msctf-tf_displayattribute
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TF_DISPLAYATTRIBUTE extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_da_color">TF_DA_COLOR</a> structure that defines the text foreground color.
     * @type {TF_DA_COLOR}
     */
    crText{
        get {
            if(!this.HasProp("__crText"))
                this.__crText := TF_DA_COLOR(0, this)
            return this.__crText
        }
    }

    /**
     * Contains a <b>TF_DA_COLOR</b> structure that defines the text background color.
     * @type {TF_DA_COLOR}
     */
    crBk{
        get {
            if(!this.HasProp("__crBk"))
                this.__crBk := TF_DA_COLOR(8, this)
            return this.__crBk
        }
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tf_da_linestyle">TF_DA_LINESTYLE</a> enumeration value that defines the underline style.
     * @type {Integer}
     */
    lsStyle {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A BOOL value that specifies if the underline should be bold or normal weight. If this value is nonzero, the underline should be bold. If this value is zero, the underline should be normal.
     * @type {BOOL}
     */
    fBoldLine {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Contains a <b>TF_DA_COLOR</b> structure that defines the color of the underline.
     * @type {TF_DA_COLOR}
     */
    crLine{
        get {
            if(!this.HasProp("__crLine"))
                this.__crLine := TF_DA_COLOR(24, this)
            return this.__crLine
        }
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tf_da_attr_info">TF_DA_ATTR_INFO</a> value that defines text conversion display attribute data.
     * @type {Integer}
     */
    bAttr {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
