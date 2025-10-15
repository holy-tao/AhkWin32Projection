#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains information about a method that is supported by a custom control pattern.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/ns-uiautomationcore-uiautomationmethodinfo
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UIAutomationMethodInfo extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the method (a non-localizable string).
     * @type {PWSTR}
     */
    pProgrammaticName{
        get {
            if(!this.HasProp("__pProgrammaticName"))
                this.__pProgrammaticName := PWSTR(this.ptr + 0)
            return this.__pProgrammaticName
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if UI Automation should set the focus on the object before calling the method; otherwise <b>FALSE</b>.
     * @type {BOOL}
     */
    doSetFocus{
        get {
            if(!this.HasProp("__doSetFocus"))
                this.__doSetFocus := BOOL(this.ptr + 8)
            return this.__doSetFocus
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of [in] parameters, which are always first in the <b>pParameterTypes</b> array.
     * @type {Integer}
     */
    cInParameters {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of [out] parameters, which always follow the [in] parameters in the <b>pParameterTypes</b> array.
     * @type {Integer}
     */
    cOutParameters {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-uiautomationtype">UIAutomationType</a>*</b>
     * 
     * A pointer to an array of values indicating the data types of the parameters of the method. The data types of the In parameters should be first, followed by those of the Out parameters.
     * @type {Pointer<Int32>}
     */
    pParameterTypes {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a>*</b>
     * 
     * A pointer to an array containing the parameter names (non-localizable strings).
     * @type {Pointer<PWSTR>}
     */
    pParameterNames {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
