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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Zoom", "ZoomByUnit", "get_CurrentCanZoom", "get_CachedCanZoom", "get_CurrentZoomLevel", "get_CachedZoomLevel", "get_CurrentZoomMinimum", "get_CachedZoomMinimum", "get_CurrentZoomMaximum", "get_CachedZoomMaximum"]

    /**
     * @type {BOOL} 
     */
    CurrentCanZoom {
        get => this.get_CurrentCanZoom()
    }

    /**
     * @type {BOOL} 
     */
    CachedCanZoom {
        get => this.get_CachedCanZoom()
    }

    /**
     * @type {Float} 
     */
    CurrentZoomLevel {
        get => this.get_CurrentZoomLevel()
    }

    /**
     * @type {Float} 
     */
    CachedZoomLevel {
        get => this.get_CachedZoomLevel()
    }

    /**
     * @type {Float} 
     */
    CurrentZoomMinimum {
        get => this.get_CurrentZoomMinimum()
    }

    /**
     * @type {Float} 
     */
    CachedZoomMinimum {
        get => this.get_CachedZoomMinimum()
    }

    /**
     * @type {Float} 
     */
    CurrentZoomMaximum {
        get => this.get_CurrentZoomMaximum()
    }

    /**
     * @type {Float} 
     */
    CachedZoomMaximum {
        get => this.get_CachedZoomMaximum()
    }

    /**
     * Zooms the viewport of the control.
     * @param {Float} zoomValue Type: <b>double</b>
     * 
     * The amount to zoom the viewport, specified as a percentage. Positive values increase the zoom level, and negative values decrease it. The control zooms its viewport to the nearest supported value.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-zoom
     */
    Zoom(zoomValue) {
        result := ComCall(12, this, "double", zoomValue, "HRESULT")
        return result
    }

    /**
     * Zooms the viewport of the control by the specified unit.
     * @param {Integer} zoomUnit 
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-zoombyunit
     */
    ZoomByUnit(zoomUnit) {
        result := ComCall(13, this, "int", zoomUnit, "HRESULT")
        return result
    }

    /**
     * Indicates whether the control supports zooming of its viewport.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_currentcanzoom
     */
    get_CurrentCanZoom() {
        result := ComCall(14, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the control supports zooming of its viewport.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_cachedcanzoom
     */
    get_CachedCanZoom() {
        result := ComCall(15, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the zoom level of the control's viewport.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_currentzoomlevel
     */
    get_CurrentZoomLevel() {
        result := ComCall(16, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached zoom level of the control's viewport.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_cachedzoomlevel
     */
    get_CachedZoomLevel() {
        result := ComCall(17, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the minimum zoom level of the control's viewport.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_currentzoomminimum
     */
    get_CurrentZoomMinimum() {
        result := ComCall(18, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached minimum zoom level of the control's viewport.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_cachedzoomminimum
     */
    get_CachedZoomMinimum() {
        result := ComCall(19, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the maximum zoom level of the control's viewport.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_currentzoommaximum
     */
    get_CurrentZoomMaximum() {
        result := ComCall(20, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached maximum zoom level of the control's viewport.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_cachedzoommaximum
     */
    get_CachedZoomMaximum() {
        result := ComCall(21, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }
}
