#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationSelectionPattern.ahk

/**
 * Extends the IUIAutomationSelectionPattern interface to provide information about selected items.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationselectionpattern2
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationSelectionPattern2 extends IUIAutomationSelectionPattern{
    /**
     * The interface identifier for IUIAutomationSelectionPattern2
     * @type {Guid}
     */
    static IID => Guid("{0532bfae-c011-4e32-a343-6d642d798555}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentFirstSelectedItem(retVal) {
        result := ComCall(9, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentLastSelectedItem(retVal) {
        result := ComCall(10, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentCurrentSelectedItem(retVal) {
        result := ComCall(11, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentItemCount(retVal) {
        result := ComCall(12, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedFirstSelectedItem(retVal) {
        result := ComCall(13, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedLastSelectedItem(retVal) {
        result := ComCall(14, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedCurrentSelectedItem(retVal) {
        result := ComCall(15, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedItemCount(retVal) {
        result := ComCall(16, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
