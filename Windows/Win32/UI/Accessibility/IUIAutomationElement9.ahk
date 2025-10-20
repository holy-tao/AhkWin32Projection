#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement8.ahk

/**
 * Extends the IUIAutomationElement8 interface.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationelement9
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationElement9 extends IUIAutomationElement8{
    /**
     * The interface identifier for IUIAutomationElement9
     * @type {Guid}
     */
    static IID => Guid("{39325fac-039d-440e-a3a3-5eb81a5cecc3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 117

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentIsDialog(retVal) {
        result := ComCall(117, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedIsDialog(retVal) {
        result := ComCall(118, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
