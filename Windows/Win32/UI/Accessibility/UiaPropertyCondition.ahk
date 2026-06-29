#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PropertyConditionFlags.ahk" { PropertyConditionFlags }
#Import "..\..\System\Com\CY.ahk" { CY }
#Import "..\..\System\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import ".\ConditionType.ahk" { ConditionType }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\UIA_PROPERTY_ID.ahk" { UIA_PROPERTY_ID }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Ole\IRecordInfo.ahk" { IRecordInfo }

/**
 * Note  This structure is deprecated.  Contains information about a condition used to find UI Automation elements that have a matching property.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiapropertycondition
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaPropertyCondition {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-conditiontype">ConditionType</a></b>
     * 
     * A value indicating the type of the condition.
     */
    ConditionType : ConditionType

    /**
     * Type: <b>PROPERTYID</b>
     * 
     * The identifier of the property to match. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     */
    PropertyId : UIA_PROPERTY_ID

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
     * 
     * The value that the property must have.
     */
    Value : VARIANT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-propertyconditionflags">PropertyConditionFlags</a></b>
     * 
     * A value indicating how the condition is applied.
     */
    Flags : PropertyConditionFlags

}
