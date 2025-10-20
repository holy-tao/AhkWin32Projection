#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement2.ahk

/**
 * Extends the IUIAutomationElement2 interface.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationelement3
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationElement3 extends IUIAutomationElement2{
    /**
     * The interface identifier for IUIAutomationElement3
     * @type {Guid}
     */
    static IID => Guid("{8471df34-aee0-4a01-a7de-7db9af12c296}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 91

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowContextMenu() {
        result := ComCall(91, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentIsPeripheral(retVal) {
        result := ComCall(92, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedIsPeripheral(retVal) {
        result := ComCall(93, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
