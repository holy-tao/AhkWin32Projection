#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Com\CY.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * The TS_ATTRVAL structure contains document attribute values.
 * @remarks
 * An application uses attributes to expose its data to TSF, whereas text services use properties to expose their data to TSF. <b>TS_ATTRVAL</b> is used in <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nn-textstor-itextstoreacp">ITextStoreACP</a> and <a href="https://docs.microsoft.com/windows/desktop/api/textstor/nn-textstor-itextstoreanchor">ITextStoreAnchor</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/textstor/ns-textstor-ts_attrval
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TS_ATTRVAL extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * GUID for the attribute type.
     * @type {Pointer<Guid>}
     */
    idAttr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A unique identifier of this attribute when overlapped with other attributes. This is a feature in <a href="https://docs.microsoft.com/previous-versions/ms971350(v=msdn.10)">Microsoft Active Accessibility</a>. In TSF, this parameter value is zero (0). Any nonzero value is ignored.
     * @type {Integer}
     */
    dwOverlapId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Value of the attribute.
     * @type {VARIANT}
     */
    varValue{
        get {
            if(!this.HasProp("__varValue"))
                this.__varValue := VARIANT(this.ptr + 16)
            return this.__varValue
        }
    }
}
