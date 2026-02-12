#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\AutomationPeer.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IAutomationPeer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPeer
     * @type {Guid}
     */
    static IID => Guid("{35aac87a-62ee-4d3e-a24c-2bc8432d68b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EventsSource", "put_EventsSource", "GetPattern", "RaiseAutomationEvent", "RaisePropertyChangedEvent", "GetAcceleratorKey", "GetAccessKey", "GetAutomationControlType", "GetAutomationId", "GetBoundingRectangle", "GetChildren", "GetClassName", "GetClickablePoint", "GetHelpText", "GetItemStatus", "GetItemType", "GetLabeledBy", "GetLocalizedControlType", "GetName", "GetOrientation", "HasKeyboardFocus", "IsContentElement", "IsControlElement", "IsEnabled", "IsKeyboardFocusable", "IsOffscreen", "IsPassword", "IsRequiredForForm", "SetFocus", "GetParent", "InvalidatePeer", "GetPeerFromPoint", "GetLiveSetting"]

    /**
     * @type {AutomationPeer} 
     */
    EventsSource {
        get => this.get_EventsSource()
        set => this.put_EventsSource(value)
    }

    /**
     * 
     * @returns {AutomationPeer} 
     */
    get_EventsSource() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationPeer(value)
    }

    /**
     * 
     * @param {AutomationPeer} value 
     * @returns {HRESULT} 
     */
    put_EventsSource(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} patternInterface_ 
     * @returns {IInspectable} 
     */
    GetPattern(patternInterface_) {
        result := ComCall(8, this, "int", patternInterface_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {Integer} eventId 
     * @returns {HRESULT} 
     */
    RaiseAutomationEvent(eventId) {
        result := ComCall(9, this, "int", eventId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {AutomationProperty} automationProperty_ 
     * @param {IInspectable} oldValue 
     * @param {IInspectable} newValue 
     * @returns {HRESULT} 
     */
    RaisePropertyChangedEvent(automationProperty_, oldValue, newValue) {
        result := ComCall(10, this, "ptr", automationProperty_, "ptr", oldValue, "ptr", newValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetAcceleratorKey() {
        result_ := HSTRING()
        result := ComCall(11, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetAccessKey() {
        result_ := HSTRING()
        result := ComCall(12, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAutomationControlType() {
        result := ComCall(13, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetAutomationId() {
        result_ := HSTRING()
        result := ComCall(14, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {RECT} 
     */
    GetBoundingRectangle() {
        result_ := RECT()
        result := ComCall(15, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * GetChildren Method (ADO)
     * @remarks
     * The provider determines what columns exist in the returned **Recordset**. For example, a document source provider always returns a resource **Recordset**.
     * @returns {IVector<AutomationPeer>} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/getchildren-method-ado
     */
    GetChildren() {
        result := ComCall(16, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(AutomationPeer, result_)
    }

    /**
     * Retrieves the name of the class to which the specified window belongs. (GetClassNameW)
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getclassname
     */
    GetClassName() {
        result_ := HSTRING()
        result := ComCall(17, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {POINT} 
     */
    GetClickablePoint() {
        result_ := POINT()
        result := ComCall(18, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetHelpText() {
        result_ := HSTRING()
        result := ComCall(19, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetItemStatus() {
        result_ := HSTRING()
        result := ComCall(20, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetItemType() {
        result_ := HSTRING()
        result := ComCall(21, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {AutomationPeer} 
     */
    GetLabeledBy() {
        result := ComCall(22, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationPeer(result_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetLocalizedControlType() {
        result_ := HSTRING()
        result := ComCall(23, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        result_ := HSTRING()
        result := ComCall(24, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOrientation() {
        result := ComCall(25, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    HasKeyboardFocus() {
        result := ComCall(26, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsContentElement() {
        result := ComCall(27, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsControlElement() {
        result := ComCall(28, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * The IsEnabled method of the Win32\_Tpm class indicates whether the device is enabled. This value can be changed by the Enable and Disable methods.
     * @remarks
     * According to the Trusted Computing Group (TCG) v1.2 specification only the following commands are available when the device is in a deactivated state.
     * 
     * -   TPM\_ContinueSelfTest
     * -   TPM\_DSAP
     * -   TPM\_FlushSpecific
     * -   TPM\_GetCapability
     * -   TPM\_GetTestResult
     * -   TPM\_Init
     * -   TPM\_OIAP
     * -   TPM\_OSAP
     * -   TPM\_OwnerSetDisable
     * -   TPM\_PCR\_Reset
     * -   TPM\_PhysicalDisable
     * -   TPM\_PhysicalEnable
     * -   TPM\_PhysicalSetDeactivated
     * -   TPM\_Reset
     * -   TPM\_SaveState
     * -   TPM\_SelfTestFull
     * -   TPM\_SetCapability
     * -   TPM\_SHA1Complete
     * -   TPM\_SHA1Start
     * -   TPM\_SHA1Update
     * -   TPM\_Startup
     * -   TPM\_TakeOwnership
     * -   TPM\_Terminate\_Handle
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/SecProv/isenabled-win32-tpm
     */
    IsEnabled() {
        result := ComCall(29, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsKeyboardFocusable() {
        result := ComCall(30, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsOffscreen() {
        result := ComCall(31, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsPassword() {
        result := ComCall(32, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsRequiredForForm() {
        result := ComCall(33, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Sets the keyboard focus to the specified window. The window must be attached to the calling thread's message queue.
     * @remarks
     * This function sends a [WM_KILLFOCUS](/windows/desktop/inputdev/wm-killfocus) message to the window that loses the keyboard focus and a [WM_SETFOCUS](/windows/desktop/inputdev/wm-setfocus) message to the window that receives the keyboard focus. It also activates either the window that receives the focus or the parent of the window that receives the focus.
     * 
     * If a window is active but does not have the focus, any key pressed produces the [WM_SYSCHAR](/windows/desktop/menurc/wm-syschar), [WM_SYSKEYDOWN](/windows/desktop/inputdev/wm-syskeydown), or [WM_SYSKEYUP](/windows/desktop/inputdev/wm-syskeyup) message. If the VK_MENU key is also pressed, bit 30 of the *lParam* parameter of the message is set. Otherwise, the messages produced do not have this bit set.
     * 
     * By using the [AttachThreadInput function](nf-winuser-attachthreadinput.md), a thread can attach its input processing to another thread. This allows a thread to call SetFocus to set the keyboard focus to a window attached to another thread's message queue.
     * @returns {HRESULT} Type: **HWND**
     * 
     * If the function succeeds, the return value is the handle to the window that previously had the keyboard focus. If the *hWnd* parameter is invalid or the window is not attached to the calling thread's message queue, the return value is NULL. To get extended error information, call [GetLastError function](../errhandlingapi/nf-errhandlingapi-getlasterror.md).
     * 
     * Extended error ERROR_INVALID_PARAMETER (0x57) means that window is in disabled state.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-setfocus
     */
    SetFocus() {
        result := ComCall(34, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @remarks
     * To obtain a window's owner window, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindow">GetWindow</a> with the <b>GW_OWNER</b> flag. To obtain the parent window and not the owner, instead of using <b>GetParent</b>, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getancestor">GetAncestor</a> with the <b>GA_PARENT</b> flag.
     * @returns {AutomationPeer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getparent
     */
    GetParent() {
        result := ComCall(35, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationPeer(result_)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidatePeer() {
        result := ComCall(36, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {POINT} point_ 
     * @returns {AutomationPeer} 
     */
    GetPeerFromPoint(point_) {
        result := ComCall(37, this, "ptr", point_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationPeer(result_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLiveSetting() {
        result := ComCall(38, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
