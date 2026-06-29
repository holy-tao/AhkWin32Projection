#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomation.ahk" { IUIAutomation }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Extends the IUIAutomation interface to expose additional methods for controlling Microsoft UI Automation functionality.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomation2
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomation2 extends IUIAutomation {
    /**
     * The interface identifier for IUIAutomation2
     * @type {Guid}
     */
    static IID := Guid("{34723aff-0c9d-49d0-9896-7ab52df8cd8a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomation2 interfaces
    */
    struct Vtbl extends IUIAutomation.Vtbl {
        get_AutoSetFocus       : IntPtr
        put_AutoSetFocus       : IntPtr
        get_ConnectionTimeout  : IntPtr
        put_ConnectionTimeout  : IntPtr
        get_TransactionTimeout : IntPtr
        put_TransactionTimeout : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomation2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    AutoSetFocus {
        get => this.get_AutoSetFocus()
        set => this.put_AutoSetFocus(value)
    }

    /**
     * @type {Integer} 
     */
    ConnectionTimeout {
        get => this.get_ConnectionTimeout()
        set => this.put_ConnectionTimeout(value)
    }

    /**
     * @type {Integer} 
     */
    TransactionTimeout {
        get => this.get_TransactionTimeout()
        set => this.put_TransactionTimeout(value)
    }

    /**
     * Specifies whether calls to UI Automation control pattern methods automatically set focus to the target element. (Get)
     * @remarks
     * By default, most UI Automation methods that perform an action on an element, such as <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationinvokepattern-invoke">IUIAutomationInvokePattern::Invoke</a> and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-setvalue">IUIAutomationValuePattern::SetValue</a>, set focus to the element before performing the action. For most applications, setting the focus results in a more consistent user experience.  In situations where setting the focus would be disruptive, such as automating a drop-down menu, you can set <b>AutoSetFocus</b> to FALSE to prevent UI Automation methods from setting the focus.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation2-get_autosetfocus
     */
    get_AutoSetFocus() {
        result := ComCall(58, this, BOOL.Ptr, &autoSetFocus := 0, "HRESULT")
        return autoSetFocus
    }

    /**
     * Specifies whether calls to UI Automation control pattern methods automatically set focus to the target element. (Put)
     * @remarks
     * By default, most UI Automation methods that perform an action on an element, such as <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationinvokepattern-invoke">IUIAutomationInvokePattern::Invoke</a> and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-setvalue">IUIAutomationValuePattern::SetValue</a>, set focus to the element before performing the action. For most applications, setting the focus results in a more consistent user experience.  In situations where setting the focus would be disruptive, such as automating a drop-down menu, you can set <b>AutoSetFocus</b> to FALSE to prevent UI Automation methods from setting the focus.
     * @param {BOOL} autoSetFocus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation2-put_autosetfocus
     */
    put_AutoSetFocus(autoSetFocus) {
        result := ComCall(59, this, BOOL, autoSetFocus, "HRESULT")
        return result
    }

    /**
     * Specifies the length of time that UI Automation will wait for a provider to respond to a client request for an automation element. (Get)
     * @remarks
     * The default connection timeout value is two seconds. A responsive UI Automation provider can typically return an automation element to a client in a short length of time.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * The duration of the time-out period, in milliseconds.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation2-get_connectiontimeout
     */
    get_ConnectionTimeout() {
        result := ComCall(60, this, "uint*", &timeout := 0, "HRESULT")
        return timeout
    }

    /**
     * Specifies the length of time that UI Automation will wait for a provider to respond to a client request for an automation element. (Put)
     * @remarks
     * The default connection timeout value is two seconds. A responsive UI Automation provider can typically return an automation element to a client in a short length of time.
     * @param {Integer} timeout Type: <b>DWORD</b>
     * 
     * The duration of the time-out period, in milliseconds.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation2-put_connectiontimeout
     */
    put_ConnectionTimeout(timeout) {
        result := ComCall(61, this, "uint", timeout, "HRESULT")
        return result
    }

    /**
     * Specifies the length of time that UI Automation will wait for a provider to respond to a client request for information about an automation element. (Get)
     * @remarks
     * The default transaction timeout value is 20 seconds.  Because some operations require the provider to process hundreds of elements, the provider might need a significant amount of time to return information to the client.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * The duration of the time-out period, in milliseconds.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation2-get_transactiontimeout
     */
    get_TransactionTimeout() {
        result := ComCall(62, this, "uint*", &timeout := 0, "HRESULT")
        return timeout
    }

    /**
     * Specifies the length of time that UI Automation will wait for a provider to respond to a client request for information about an automation element. (Put)
     * @remarks
     * The default transaction timeout value is 20 seconds.  Because some operations require the provider to process hundreds of elements, the provider might need a significant amount of time to return information to the client.
     * @param {Integer} timeout Type: <b>DWORD</b>
     * 
     * The duration of the time-out period, in milliseconds.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation2-put_transactiontimeout
     */
    put_TransactionTimeout(timeout) {
        result := ComCall(63, this, "uint", timeout, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomation2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AutoSetFocus := CallbackCreate(GetMethod(implObj, "get_AutoSetFocus"), flags, 2)
        this.vtbl.put_AutoSetFocus := CallbackCreate(GetMethod(implObj, "put_AutoSetFocus"), flags, 2)
        this.vtbl.get_ConnectionTimeout := CallbackCreate(GetMethod(implObj, "get_ConnectionTimeout"), flags, 2)
        this.vtbl.put_ConnectionTimeout := CallbackCreate(GetMethod(implObj, "put_ConnectionTimeout"), flags, 2)
        this.vtbl.get_TransactionTimeout := CallbackCreate(GetMethod(implObj, "get_TransactionTimeout"), flags, 2)
        this.vtbl.put_TransactionTimeout := CallbackCreate(GetMethod(implObj, "put_TransactionTimeout"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AutoSetFocus)
        CallbackFree(this.vtbl.put_AutoSetFocus)
        CallbackFree(this.vtbl.get_ConnectionTimeout)
        CallbackFree(this.vtbl.put_ConnectionTimeout)
        CallbackFree(this.vtbl.get_TransactionTimeout)
        CallbackFree(this.vtbl.put_TransactionTimeout)
    }
}
