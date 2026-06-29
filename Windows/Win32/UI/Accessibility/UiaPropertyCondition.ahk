#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\System\Variant\VARENUM.ahk
#Include ..\..\Foundation\CHAR.ahk
#Include ..\..\System\Com\CY.ahk
#Include ..\..\System\Com\SAFEARRAY.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\ConditionType.ahk
#Include ..\..\System\Ole\IRecordInfo.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include .\PropertyConditionFlags.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\UIA_PROPERTY_ID.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk

/**
 * Note  This structure is deprecated.  Contains information about a condition used to find UI Automation elements that have a matching property.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiapropertycondition
 * @namespace Windows.Win32.UI.Accessibility
 */
class UiaPropertyCondition extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-conditiontype">ConditionType</a></b>
     * 
     * A value indicating the type of the condition.
     * @type {ConditionType}
     */
    ConditionType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>PROPERTYID</b>
     * 
     * The identifier of the property to match. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @type {UIA_PROPERTY_ID}
     */
    PropertyId {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
     * 
     * The value that the property must have.
     * @type {VARIANT}
     */
    Value {
        get {
            if(!this.HasProp("__Value"))
                this.__Value := VARIANT(8, this)
            return this.__Value
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-propertyconditionflags">PropertyConditionFlags</a></b>
     * 
     * A value indicating how the condition is applied.
     * @type {PropertyConditionFlags}
     */
    Flags {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
