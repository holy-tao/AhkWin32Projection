#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EventArgsType.ahk" { EventArgsType }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\UIA_EVENT_ID.ahk" { UIA_EVENT_ID }
#Import "..\..\System\Ole\IRecordInfo.ahk" { IRecordInfo }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\System\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\CY.ahk" { CY }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Note  This structure is deprecated.  Contains information about an event that is raised when a Microsoft UI Automation element property change occurs.
 * @remarks
 * The old value might not be set if the UI Automation provider cannot do so efficiently.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiapropertychangedeventargs
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaPropertyChangedEventArgs {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-eventargstype">EventArgsType</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-eventargstype">EventArgsType</a> enumerated type indicating the type of event.
     */
    Type : EventArgsType

    /**
     * Type: <b>int</b>
     * 
     * The identifier of the event. For a list of event identifiers, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     */
    EventId : UIA_EVENT_ID

    /**
     * Type: <b>PROPERTYID</b>
     * 
     * The identifier of the property that has changed. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     */
    PropertyId : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a> containing the old value of the property.
     */
    OldValue : VARIANT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a> containing the new value of the property.
     */
    NewValue : VARIANT

}
