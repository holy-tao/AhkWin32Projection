#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UIAutomationType.ahk" { UIAutomationType }

/**
 * Contains information about a parameter of a custom control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ns-uiautomationcore-uiautomationparameter
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UIAutomationParameter {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-uiautomationtype">UIAutomationType</a></b>
     * 
     * A value indicating the type of the parameter.
     */
    type : UIAutomationType

    /**
     * Type: <b>void*</b>
     * 
     * A pointer to the parameter data.
     */
    pData : IntPtr

}
