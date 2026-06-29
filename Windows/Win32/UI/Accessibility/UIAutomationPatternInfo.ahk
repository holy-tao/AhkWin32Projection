#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UIAutomationEventInfo.ahk" { UIAutomationEventInfo }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\UIAutomationMethodInfo.ahk" { UIAutomationMethodInfo }
#Import ".\UIAutomationPropertyInfo.ahk" { UIAutomationPropertyInfo }
#Import ".\IUIAutomationPatternHandler.ahk" { IUIAutomationPatternHandler }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains information about a custom control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ns-uiautomationcore-uiautomationpatterninfo
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UIAutomationPatternInfo {
    #StructPack 8

    /**
     * Type: <b>GUID</b>
     * 
     * The unique identifier of the control pattern.
     */
    guid : Guid

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the control pattern (a non-localizable string).
     */
    pProgrammaticName : PWSTR

    /**
     * Type: <b>GUID</b>
     * 
     * The unique identifier of the provider interface for the control pattern.
     */
    providerInterfaceId : Guid

    /**
     * Type: <b>GUID</b>
     * 
     * The unique identifier of the client interface for the control pattern.
     */
    clientInterfaceId : Guid

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of elements in <b>pProperties</b>.
     */
    cProperties : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationpropertyinfo">UIAutomationPropertyInfo</a>*</b>
     * 
     * A pointer to an array of structures describing properties available on the control pattern.
     */
    pProperties : UIAutomationPropertyInfo.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of elements in <b>pMethods</b>.
     */
    cMethods : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationmethodinfo">UIAutomationMethodInfo</a>*</b>
     * 
     * A pointer to an array of structures describing methods available on the control pattern.
     */
    pMethods : UIAutomationMethodInfo.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of elements in <b>pEvents</b>.
     */
    cEvents : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationeventinfo">UIAutomationEventInfo</a>*</b>
     * 
     * A pointer to an array of structures describing events available on the control pattern.
     */
    pEvents : UIAutomationEventInfo.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iuiautomationpatternhandler">IUIAutomationPatternHandler</a>*</b>
     * 
     * A pointer to the object that makes the control pattern available to clients.
     */
    pPatternHandler : IUIAutomationPatternHandler

}
