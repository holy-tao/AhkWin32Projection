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
     * 
     * @param {Float} zoomValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-zoom
     */
    Zoom(zoomValue) {
        result := ComCall(12, this, "double", zoomValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} zoomUnit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-zoombyunit
     */
    ZoomByUnit(zoomUnit) {
        result := ComCall(13, this, "int", zoomUnit, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_currentcanzoom
     */
    get_CurrentCanZoom() {
        result := ComCall(14, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_cachedcanzoom
     */
    get_CachedCanZoom() {
        result := ComCall(15, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_currentzoomlevel
     */
    get_CurrentZoomLevel() {
        result := ComCall(16, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_cachedzoomlevel
     */
    get_CachedZoomLevel() {
        result := ComCall(17, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_currentzoomminimum
     */
    get_CurrentZoomMinimum() {
        result := ComCall(18, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_cachedzoomminimum
     */
    get_CachedZoomMinimum() {
        result := ComCall(19, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_currentzoommaximum
     */
    get_CurrentZoomMaximum() {
        result := ComCall(20, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_cachedzoommaximum
     */
    get_CachedZoomMaximum() {
        result := ComCall(21, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }
}
