#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomation.ahk

/**
 * Extends the IUIAutomation interface to expose additional methods for controlling Microsoft UI Automation functionality.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomation2
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomation2 extends IUIAutomation{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomation2
     * @type {Guid}
     */
    static IID => Guid("{34723aff-0c9d-49d0-9896-7ab52df8cd8a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 58

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AutoSetFocus", "put_AutoSetFocus", "get_ConnectionTimeout", "put_ConnectionTimeout", "get_TransactionTimeout", "put_TransactionTimeout"]

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
     * Specifies whether calls to UI Automation control pattern methods automatically set focus to the target element.
     * @remarks
     * 
     *  By default, most UI Automation methods that perform an action on an element, such as <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationinvokepattern-invoke">IUIAutomationInvokePattern::Invoke</a> and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-setvalue">IUIAutomationValuePattern::SetValue</a>, set focus to the element before performing the action. For most applications, setting the focus results in a more consistent user experience.  In situations where setting the focus would be disruptive, such as automating a drop-down menu, you can set <b>AutoSetFocus</b> to FALSE to prevent UI Automation methods from setting the focus.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation2-get_autosetfocus
     */
    get_AutoSetFocus() {
        result := ComCall(58, this, "int*", &autoSetFocus := 0, "HRESULT")
        return autoSetFocus
    }

    /**
     * Specifies whether calls to UI Automation control pattern methods automatically set focus to the target element.
     * @remarks
     * 
     *  By default, most UI Automation methods that perform an action on an element, such as <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationinvokepattern-invoke">IUIAutomationInvokePattern::Invoke</a> and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationvaluepattern-setvalue">IUIAutomationValuePattern::SetValue</a>, set focus to the element before performing the action. For most applications, setting the focus results in a more consistent user experience.  In situations where setting the focus would be disruptive, such as automating a drop-down menu, you can set <b>AutoSetFocus</b> to FALSE to prevent UI Automation methods from setting the focus.
     * 
     * 
     * @param {BOOL} autoSetFocus 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation2-put_autosetfocus
     */
    put_AutoSetFocus(autoSetFocus) {
        result := ComCall(59, this, "int", autoSetFocus, "HRESULT")
        return result
    }

    /**
     * Specifies the length of time that UI Automation will wait for a provider to respond to a client request for an automation element.
     * @remarks
     * 
     * The default connection timeout value is two seconds. A responsive UI Automation provider can typically return an automation element to a client in a short length of time.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation2-get_connectiontimeout
     */
    get_ConnectionTimeout() {
        result := ComCall(60, this, "uint*", &timeout := 0, "HRESULT")
        return timeout
    }

    /**
     * Specifies the length of time that UI Automation will wait for a provider to respond to a client request for an automation element.
     * @remarks
     * 
     * The default connection timeout value is two seconds. A responsive UI Automation provider can typically return an automation element to a client in a short length of time.
     * 
     * 
     * @param {Integer} timeout 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation2-put_connectiontimeout
     */
    put_ConnectionTimeout(timeout) {
        result := ComCall(61, this, "uint", timeout, "HRESULT")
        return result
    }

    /**
     * Specifies the length of time that UI Automation will wait for a provider to respond to a client request for information about an automation element.
     * @remarks
     * 
     * The default transaction timeout value is 20 seconds.  Because some operations require the provider to process hundreds of elements, the provider might need a significant amount of time to return information to the client.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation2-get_transactiontimeout
     */
    get_TransactionTimeout() {
        result := ComCall(62, this, "uint*", &timeout := 0, "HRESULT")
        return timeout
    }

    /**
     * Specifies the length of time that UI Automation will wait for a provider to respond to a client request for information about an automation element.
     * @remarks
     * 
     * The default transaction timeout value is 20 seconds.  Because some operations require the provider to process hundreds of elements, the provider might need a significant amount of time to return information to the client.
     * 
     * 
     * @param {Integer} timeout 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation2-put_transactiontimeout
     */
    put_TransactionTimeout(timeout) {
        result := ComCall(63, this, "uint", timeout, "HRESULT")
        return result
    }
}
