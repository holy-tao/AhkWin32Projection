#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Com\CY.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * The TF_PROPERTYVAL structure contains property value data. This structure is used with the IEnumTfPropertyValue::Next method.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/ns-msctf-tf_propertyval
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TF_PROPERTYVAL extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <b>GUID</b> that identifies the property type. This can be a custom identifier or one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/predefined-properties">predefined property identifiers</a>.
     * @type {Pointer<Guid>}
     */
    guidId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <b>VARIANT</b> that contains the value of the property specified by <b>guidId</b>. The user must know the type and format of this data.
     * @type {VARIANT}
     */
    varValue{
        get {
            if(!this.HasProp("__varValue"))
                this.__varValue := VARIANT(this.ptr + 8)
            return this.__varValue
        }
    }
}
