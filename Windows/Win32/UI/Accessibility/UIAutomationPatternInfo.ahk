#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about a custom control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ns-uiautomationcore-uiautomationpatterninfo
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UIAutomationPatternInfo extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: <b>GUID</b>
     * 
     * The unique identifier of the control pattern.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the control pattern (a non-localizable string).
     * @type {PWSTR}
     */
    pProgrammaticName{
        get {
            if(!this.HasProp("__pProgrammaticName"))
                this.__pProgrammaticName := PWSTR(this.ptr + 8)
            return this.__pProgrammaticName
        }
    }

    /**
     * Type: <b>GUID</b>
     * 
     * The unique identifier of the provider interface for the control pattern.
     * @type {Pointer<Guid>}
     */
    providerInterfaceId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>GUID</b>
     * 
     * The unique identifier of the client interface for the control pattern.
     * @type {Pointer<Guid>}
     */
    clientInterfaceId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of elements in <b>pProperties</b>.
     * @type {Integer}
     */
    cProperties {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationpropertyinfo">UIAutomationPropertyInfo</a>*</b>
     * 
     * A pointer to an array of structures describing properties available on the control pattern.
     * @type {Pointer<UIAutomationPropertyInfo>}
     */
    pProperties {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of elements in <b>pMethods</b>.
     * @type {Integer}
     */
    cMethods {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationmethodinfo">UIAutomationMethodInfo</a>*</b>
     * 
     * A pointer to an array of structures describing methods available on the control pattern.
     * @type {Pointer<UIAutomationMethodInfo>}
     */
    pMethods {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of elements in <b>pEvents</b>.
     * @type {Integer}
     */
    cEvents {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationeventinfo">UIAutomationEventInfo</a>*</b>
     * 
     * A pointer to an array of structures describing events available on the control pattern.
     * @type {Pointer<UIAutomationEventInfo>}
     */
    pEvents {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iuiautomationpatternhandler">IUIAutomationPatternHandler</a>*</b>
     * 
     * A pointer to the object that makes the control pattern available to clients.
     * @type {Pointer<IUIAutomationPatternHandler>}
     */
    pPatternHandler {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
