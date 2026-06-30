#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\UIAutomationMethodInfo.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\UIAutomationPropertyInfo.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationPatternHandler.ahk
#Include .\UIAutomationEventInfo.ahk

/**
 * Contains information about a custom control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ns-uiautomationcore-uiautomationpatterninfo
 * @namespace Windows.Win32.UI.Accessibility
 */
class UIAutomationPatternInfo extends Win32Struct {
    static sizeof => 112

    static packingSize => 8

    /**
     * Type: <b>GUID</b>
     * 
     * The unique identifier of the control pattern.
     * @type {Guid}
     */
    guid {
        get {
            if(!this.HasProp("__guid"))
                this.__guid := Guid(0, this)
            return this.__guid
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the control pattern (a non-localizable string).
     * @type {PWSTR}
     */
    pProgrammaticName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>GUID</b>
     * 
     * The unique identifier of the provider interface for the control pattern.
     * @type {Guid}
     */
    providerInterfaceId {
        get {
            if(!this.HasProp("__providerInterfaceId"))
                this.__providerInterfaceId := Guid(24, this)
            return this.__providerInterfaceId
        }
    }

    /**
     * Type: <b>GUID</b>
     * 
     * The unique identifier of the client interface for the control pattern.
     * @type {Guid}
     */
    clientInterfaceId {
        get {
            if(!this.HasProp("__clientInterfaceId"))
                this.__clientInterfaceId := Guid(40, this)
            return this.__clientInterfaceId
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of elements in <b>pProperties</b>.
     * @type {Integer}
     */
    cProperties {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationpropertyinfo">UIAutomationPropertyInfo</a>*</b>
     * 
     * A pointer to an array of structures describing properties available on the control pattern.
     * @type {Pointer<UIAutomationPropertyInfo>}
     */
    pProperties {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of elements in <b>pMethods</b>.
     * @type {Integer}
     */
    cMethods {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationmethodinfo">UIAutomationMethodInfo</a>*</b>
     * 
     * A pointer to an array of structures describing methods available on the control pattern.
     * @type {Pointer<UIAutomationMethodInfo>}
     */
    pMethods {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of elements in <b>pEvents</b>.
     * @type {Integer}
     */
    cEvents {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationeventinfo">UIAutomationEventInfo</a>*</b>
     * 
     * A pointer to an array of structures describing events available on the control pattern.
     * @type {Pointer<UIAutomationEventInfo>}
     */
    pEvents {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iuiautomationpatternhandler">IUIAutomationPatternHandler</a>*</b>
     * 
     * A pointer to the object that makes the control pattern available to clients.
     * @type {IUIAutomationPatternHandler}
     */
    pPatternHandler {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}
