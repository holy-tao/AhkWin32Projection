#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationTransformPattern.ahk

/**
 * Extends the IUIAutomationTransformPattern interface to enable Microsoft UI Automation clients to programmatically access the viewport zooming functionality of a control.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtransformpattern2
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTransformPattern2 extends IUIAutomationTransformPattern{
    /**
     * The interface identifier for IUIAutomationTransformPattern2
     * @type {Guid}
     */
    static IID => Guid("{6d74d017-6ecb-4381-b38b-3c17a48ff1c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * 
     * @param {Float} zoomValue 
     * @returns {HRESULT} 
     */
    Zoom(zoomValue) {
        result := ComCall(12, this, "double", zoomValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} zoomUnit 
     * @returns {HRESULT} 
     */
    ZoomByUnit(zoomUnit) {
        result := ComCall(13, this, "int", zoomUnit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentCanZoom(retVal) {
        result := ComCall(14, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedCanZoom(retVal) {
        result := ComCall(15, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentZoomLevel(retVal) {
        result := ComCall(16, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedZoomLevel(retVal) {
        result := ComCall(17, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentZoomMinimum(retVal) {
        result := ComCall(18, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedZoomMinimum(retVal) {
        result := ComCall(19, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentZoomMaximum(retVal) {
        result := ComCall(20, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedZoomMaximum(retVal) {
        result := ComCall(21, this, "double*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
