#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EventArgsType.ahk
#Include .\UIA_EVENT_ID.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Variant\VARENUM.ahk
#Include ..\..\System\Com\CY.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Com\SAFEARRAY.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\..\System\Ole\IRecordInfo.ahk

/**
 * Note  This structure is deprecated.  Contains information about an event that is raised when a Microsoft UI Automation element property change occurs.
 * @remarks
 * The old value might not be set if the UI Automation provider cannot do so efficiently.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiapropertychangedeventargs
 * @namespace Windows.Win32.UI.Accessibility
 */
class UiaPropertyChangedEventArgs extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-eventargstype">EventArgsType</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-eventargstype">EventArgsType</a> enumerated type indicating the type of event.
     * @type {EventArgsType}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The identifier of the event. For a list of event identifiers, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @type {UIA_EVENT_ID}
     */
    EventId {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>PROPERTYID</b>
     * 
     * The identifier of the property that has changed. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @type {Integer}
     */
    PropertyId {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a> containing the old value of the property.
     * @type {VARIANT}
     */
    OldValue {
        get {
            if(!this.HasProp("__OldValue"))
                this.__OldValue := VARIANT(16, this)
            return this.__OldValue
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a> containing the new value of the property.
     * @type {VARIANT}
     */
    NewValue {
        get {
            if(!this.HasProp("__NewValue"))
                this.__NewValue := VARIANT(40, this)
            return this.__NewValue
        }
    }
}
