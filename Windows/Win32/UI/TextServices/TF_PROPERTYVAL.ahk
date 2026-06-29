#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\..\System\Ole\IRecordInfo.ahk
#Include ..\..\System\Variant\VARENUM.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Com\CY.ahk
#Include ..\..\System\Com\SAFEARRAY.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\CHAR.ahk

/**
 * The TF_PROPERTYVAL structure contains property value data. This structure is used with the IEnumTfPropertyValue::Next method.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ns-msctf-tf_propertyval
 * @namespace Windows.Win32.UI.TextServices
 */
class TF_PROPERTYVAL extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * A <b>GUID</b> that identifies the property type. This can be a custom identifier or one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/predefined-properties">predefined property identifiers</a>.
     * @type {Guid}
     */
    guidId {
        get {
            if(!this.HasProp("__guidId"))
                this.__guidId := Guid(0, this)
            return this.__guidId
        }
    }

    /**
     * A <b>VARIANT</b> that contains the value of the property specified by <b>guidId</b>. The user must know the type and format of this data.
     * @type {VARIANT}
     */
    varValue {
        get {
            if(!this.HasProp("__varValue"))
                this.__varValue := VARIANT(16, this)
            return this.__varValue
        }
    }
}
