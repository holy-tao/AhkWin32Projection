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
     * @type {BOOL} 
     */
    CanZoom {
        get => this.get_CanZoom()
    }

    /**
     * @type {Float} 
     */
    ZoomLevel {
        get => this.get_ZoomLevel()
    }

    /**
     * @type {Float} 
     */
    ZoomMinimum {
        get => this.get_ZoomMinimum()
    }

    /**
     * @type {Float} 
     */
    ZoomMaximum {
        get => this.get_ZoomMaximum()
    }

    /**
     * Zooms the viewport of the control.
     * @param {Float} zoom Type: <b>double</b>
     * 
     * The amount to zoom the viewport, specified as a percentage. The provider should zoom the viewport to the nearest supported value.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itransformprovider2-zoom
     */
    Zoom(zoom) {
        result := ComCall(9, this, "double", zoom, "HRESULT")
        return result
    }

    /**
     * Indicates whether the control supports zooming of its viewport.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itransformprovider2-get_canzoom
     */
    get_CanZoom() {
        result := ComCall(10, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves the current zoom level of the element.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itransformprovider2-get_zoomlevel
     */
    get_ZoomLevel() {
        result := ComCall(11, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves the minimum zoom level of the element.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itransformprovider2-get_zoomminimum
     */
    get_ZoomMinimum() {
        result := ComCall(12, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves the maximum zoom level of the element.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itransformprovider2-get_zoommaximum
     */
    get_ZoomMaximum() {
        result := ComCall(13, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Zooms the viewport of the control by the specified logical unit.
     * @param {Integer} zoomUnit The logical unit by which to increase or decrease the zoom of the viewport.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-itransformprovider2-zoombyunit
     */
    ZoomByUnit(zoomUnit) {
        result := ComCall(14, this, "int", zoomUnit, "HRESULT")
        return result
    }
}
