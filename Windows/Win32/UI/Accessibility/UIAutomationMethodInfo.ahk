#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\UIAutomationType.ahk" { UIAutomationType }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information about a method that is supported by a custom control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ns-uiautomationcore-uiautomationmethodinfo
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UIAutomationMethodInfo {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the method (a non-localizable string).
     */
    pProgrammaticName : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if UI Automation should set the focus on the object before calling the method; otherwise <b>FALSE</b>.
     */
    doSetFocus : BOOL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of [in] parameters, which are always first in the <b>pParameterTypes</b> array.
     */
    cInParameters : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of [out] parameters, which always follow the [in] parameters in the <b>pParameterTypes</b> array.
     */
    cOutParameters : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-uiautomationtype">UIAutomationType</a>*</b>
     * 
     * A pointer to an array of values indicating the data types of the parameters of the method. The data types of the In parameters should be first, followed by those of the Out parameters.
     */
    pParameterTypes : UIAutomationType.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a>*</b>
     * 
     * A pointer to an array containing the parameter names (non-localizable strings).
     */
    pParameterNames : PWSTR.Ptr

}
