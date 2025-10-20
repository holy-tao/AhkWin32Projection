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
     * 
     * @param {Pointer<BOOL>} autoSetFocus 
     * @returns {HRESULT} 
     */
    get_AutoSetFocus(autoSetFocus) {
        result := ComCall(58, this, "ptr", autoSetFocus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} autoSetFocus 
     * @returns {HRESULT} 
     */
    put_AutoSetFocus(autoSetFocus) {
        result := ComCall(59, this, "int", autoSetFocus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} timeout 
     * @returns {HRESULT} 
     */
    get_ConnectionTimeout(timeout) {
        result := ComCall(60, this, "uint*", timeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} timeout 
     * @returns {HRESULT} 
     */
    put_ConnectionTimeout(timeout) {
        result := ComCall(61, this, "uint", timeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} timeout 
     * @returns {HRESULT} 
     */
    get_TransactionTimeout(timeout) {
        result := ComCall(62, this, "uint*", timeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} timeout 
     * @returns {HRESULT} 
     */
    put_TransactionTimeout(timeout) {
        result := ComCall(63, this, "uint", timeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
