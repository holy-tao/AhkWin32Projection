#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITransformProvider.ahk

/**
 * Extends the ITransformProvider interface to enable Microsoft UI Automation providers to expose properties to support the viewport zooming functionality of a control.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-itransformprovider2
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ITransformProvider2 extends ITransformProvider{
    /**
     * The interface identifier for ITransformProvider2
     * @type {Guid}
     */
    static IID => Guid("{4758742f-7ac2-460c-bc48-09fc09308a93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Float} zoom 
     * @returns {HRESULT} 
     */
    Zoom(zoom) {
        result := ComCall(9, this, "double", zoom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     */
    get_CanZoom(pRetVal) {
        result := ComCall(10, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pRetVal 
     * @returns {HRESULT} 
     */
    get_ZoomLevel(pRetVal) {
        result := ComCall(11, this, "double*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pRetVal 
     * @returns {HRESULT} 
     */
    get_ZoomMinimum(pRetVal) {
        result := ComCall(12, this, "double*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pRetVal 
     * @returns {HRESULT} 
     */
    get_ZoomMaximum(pRetVal) {
        result := ComCall(13, this, "double*", pRetVal, "int")
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
        result := ComCall(14, this, "int", zoomUnit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
