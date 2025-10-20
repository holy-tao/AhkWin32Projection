#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that act as scrollable containers for a collection of child objects.
 * @remarks
 * 
  * Implemented on a Microsoft UI Automation provider that must 
  *             support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingscroll">Scroll</a> control pattern.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iscrollprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IScrollProvider extends IUnknown{
    /**
     * The interface identifier for IScrollProvider
     * @type {Guid}
     */
    static IID => Guid("{b38b8077-1fc3-42a5-8cae-d40c2215055a}")

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
     * @param {Pointer<Double>} pRetVal 
     * @returns {HRESULT} 
     */
    get_HorizontalScrollPercent(pRetVal) {
        result := ComCall(5, this, "double*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pRetVal 
     * @returns {HRESULT} 
     */
    get_VerticalScrollPercent(pRetVal) {
        result := ComCall(6, this, "double*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pRetVal 
     * @returns {HRESULT} 
     */
    get_HorizontalViewSize(pRetVal) {
        result := ComCall(7, this, "double*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pRetVal 
     * @returns {HRESULT} 
     */
    get_VerticalViewSize(pRetVal) {
        result := ComCall(8, this, "double*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     */
    get_HorizontallyScrollable(pRetVal) {
        result := ComCall(9, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     */
    get_VerticallyScrollable(pRetVal) {
        result := ComCall(10, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
