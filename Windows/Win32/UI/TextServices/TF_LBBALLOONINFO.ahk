#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * The TF_LBBALLOONINFO structure contains information about a language bar balloon item.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/ns-ctfutb-tf_lbballooninfo
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TF_LBBALLOONINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/ctfutb/ne-ctfutb-tflbballoonstyle">TfLBBalloonStyle</a> values that specify the type of balloon to display.
     * @type {Integer}
     */
    style {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Contains a <b>BSTR</b> that contains the string for the balloon. This string must be allocated using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> function. The caller free this buffer when it is no longer required by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @type {BSTR}
     */
    bstrText{
        get {
            if(!this.HasProp("__bstrText"))
                this.__bstrText := BSTR(8, this)
            return this.__bstrText
        }
    }
}
