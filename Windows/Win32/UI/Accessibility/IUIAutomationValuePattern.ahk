#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that contains a value that does not span a range and that can be represented as a string.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationvaluepattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationValuePattern extends IUnknown{
    /**
     * The interface identifier for IUIAutomationValuePattern
     * @type {Guid}
     */
    static IID => Guid("{a94cd8b1-0844-4cd6-9d2d-640537ab39e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BSTR} val 
     * @returns {HRESULT} 
     */
    SetValue(val) {
        val := val is String ? BSTR.Alloc(val).Value : val

        result := ComCall(3, this, "ptr", val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentValue(retVal) {
        result := ComCall(4, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentIsReadOnly(retVal) {
        result := ComCall(5, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedValue(retVal) {
        result := ComCall(6, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedIsReadOnly(retVal) {
        result := ComCall(7, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
