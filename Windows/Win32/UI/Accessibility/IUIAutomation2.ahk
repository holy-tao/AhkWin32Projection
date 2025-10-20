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
     * 
     * @param {Pointer<BOOL>} autoSetFocus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation2-get_autosetfocus
     */
    get_AutoSetFocus(autoSetFocus) {
        result := ComCall(58, this, "ptr", autoSetFocus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} autoSetFocus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation2-put_autosetfocus
     */
    put_AutoSetFocus(autoSetFocus) {
        result := ComCall(59, this, "int", autoSetFocus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} timeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation2-get_connectiontimeout
     */
    get_ConnectionTimeout(timeout) {
        result := ComCall(60, this, "uint*", timeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} timeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation2-put_connectiontimeout
     */
    put_ConnectionTimeout(timeout) {
        result := ComCall(61, this, "uint", timeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} timeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation2-get_transactiontimeout
     */
    get_TransactionTimeout(timeout) {
        result := ComCall(62, this, "uint*", timeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} timeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation2-put_transactiontimeout
     */
    put_TransactionTimeout(timeout) {
        result := ComCall(63, this, "uint", timeout, "HRESULT")
        return result
    }
}
