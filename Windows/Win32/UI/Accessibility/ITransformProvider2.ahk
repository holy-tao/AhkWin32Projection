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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Zoom", "get_CanZoom", "get_ZoomLevel", "get_ZoomMinimum", "get_ZoomMaximum", "ZoomByUnit"]

    /**
     * 
     * @param {Float} zoom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider2-zoom
     */
    Zoom(zoom) {
        result := ComCall(9, this, "double", zoom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider2-get_canzoom
     */
    get_CanZoom(pRetVal) {
        result := ComCall(10, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider2-get_zoomlevel
     */
    get_ZoomLevel(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "double*" : "ptr"

        result := ComCall(11, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider2-get_zoomminimum
     */
    get_ZoomMinimum(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "double*" : "ptr"

        result := ComCall(12, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider2-get_zoommaximum
     */
    get_ZoomMaximum(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "double*" : "ptr"

        result := ComCall(13, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} zoomUnit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider2-zoombyunit
     */
    ZoomByUnit(zoomUnit) {
        result := ComCall(14, this, "int", zoomUnit, "HRESULT")
        return result
    }
}
