#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that presents a range of values.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationrangevaluepattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationRangeValuePattern extends IUnknown{
    /**
     * The interface identifier for IUIAutomationRangeValuePattern
     * @type {Guid}
     */
    static IID => Guid("{59213f4f-7346-49e5-b120-80555987a148}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Float} val 
     * @returns {HRESULT} 
     */
    SetValue(val) {
        result := ComCall(3, this, "double", val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentValue(retVal) {
        result := ComCall(4, this, "double*", retVal, "int")
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
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentMaximum(retVal) {
        result := ComCall(6, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentMinimum(retVal) {
        result := ComCall(7, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentLargeChange(retVal) {
        result := ComCall(8, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentSmallChange(retVal) {
        result := ComCall(9, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedValue(retVal) {
        result := ComCall(10, this, "double*", retVal, "int")
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
        result := ComCall(11, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedMaximum(retVal) {
        result := ComCall(12, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedMinimum(retVal) {
        result := ComCall(13, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedLargeChange(retVal) {
        result := ComCall(14, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedSmallChange(retVal) {
        result := ComCall(15, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
