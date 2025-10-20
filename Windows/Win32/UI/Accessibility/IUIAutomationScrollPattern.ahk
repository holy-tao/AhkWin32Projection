#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that acts as a scrollable container for a collection of child elements.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationscrollpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationScrollPattern extends IUnknown{
    /**
     * The interface identifier for IUIAutomationScrollPattern
     * @type {Guid}
     */
    static IID => Guid("{88f4d42a-e881-459d-a77c-73bbbb7e02dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} horizontalAmount 
     * @param {Integer} verticalAmount 
     * @returns {HRESULT} 
     */
    Scroll(horizontalAmount, verticalAmount) {
        result := ComCall(3, this, "int", horizontalAmount, "int", verticalAmount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} horizontalPercent 
     * @param {Float} verticalPercent 
     * @returns {HRESULT} 
     */
    SetScrollPercent(horizontalPercent, verticalPercent) {
        result := ComCall(4, this, "double", horizontalPercent, "double", verticalPercent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentHorizontalScrollPercent(retVal) {
        result := ComCall(5, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentVerticalScrollPercent(retVal) {
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
    get_CurrentHorizontalViewSize(retVal) {
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
    get_CurrentVerticalViewSize(retVal) {
        result := ComCall(8, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentHorizontallyScrollable(retVal) {
        result := ComCall(9, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentVerticallyScrollable(retVal) {
        result := ComCall(10, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedHorizontalScrollPercent(retVal) {
        result := ComCall(11, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedVerticalScrollPercent(retVal) {
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
    get_CachedHorizontalViewSize(retVal) {
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
    get_CachedVerticalViewSize(retVal) {
        result := ComCall(14, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedHorizontallyScrollable(retVal) {
        result := ComCall(15, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedVerticallyScrollable(retVal) {
        result := ComCall(16, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
