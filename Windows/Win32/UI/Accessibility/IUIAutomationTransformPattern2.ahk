#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ZoomUnit.ahk" { ZoomUnit }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IUIAutomationTransformPattern.ahk" { IUIAutomationTransformPattern }

/**
 * Extends the IUIAutomationTransformPattern interface to enable Microsoft UI Automation clients to programmatically access the viewport zooming functionality of a control.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationtransformpattern2
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationTransformPattern2 extends IUIAutomationTransformPattern {
    /**
     * The interface identifier for IUIAutomationTransformPattern2
     * @type {Guid}
     */
    static IID := Guid("{6d74d017-6ecb-4381-b38b-3c17a48ff1c2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationTransformPattern2 interfaces
    */
    struct Vtbl extends IUIAutomationTransformPattern.Vtbl {
        Zoom                   : IntPtr
        ZoomByUnit             : IntPtr
        get_CurrentCanZoom     : IntPtr
        get_CachedCanZoom      : IntPtr
        get_CurrentZoomLevel   : IntPtr
        get_CachedZoomLevel    : IntPtr
        get_CurrentZoomMinimum : IntPtr
        get_CachedZoomMinimum  : IntPtr
        get_CurrentZoomMaximum : IntPtr
        get_CachedZoomMaximum  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationTransformPattern2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Zooms the viewport of the control. (IUIAutomationTransformPattern2.Zoom)
     * @param {Float} zoomValue Type: <b>double</b>
     * 
     * The amount to zoom the viewport, specified as a percentage. Positive values increase the zoom level, and negative values decrease it. The control zooms its viewport to the nearest supported value.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-zoom
     */
    Zoom(zoomValue) {
        result := ComCall(12, this, "double", zoomValue, "HRESULT")
        return result
    }

    /**
     * Zooms the viewport of the control by the specified unit.
     * @param {ZoomUnit} _zoomUnit 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-zoombyunit
     */
    ZoomByUnit(_zoomUnit) {
        result := ComCall(13, this, ZoomUnit, _zoomUnit, "HRESULT")
        return result
    }

    /**
     * Indicates whether the control supports zooming of its viewport. (IUIAutomationTransformPattern2.get_CurrentCanZoom)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_currentcanzoom
     */
    get_CurrentCanZoom() {
        result := ComCall(14, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the control supports zooming of its viewport.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_cachedcanzoom
     */
    get_CachedCanZoom() {
        result := ComCall(15, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the zoom level of the control's viewport.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_currentzoomlevel
     */
    get_CurrentZoomLevel() {
        result := ComCall(16, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached zoom level of the control's viewport.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_cachedzoomlevel
     */
    get_CachedZoomLevel() {
        result := ComCall(17, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the minimum zoom level of the control's viewport.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_currentzoomminimum
     */
    get_CurrentZoomMinimum() {
        result := ComCall(18, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached minimum zoom level of the control's viewport.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_cachedzoomminimum
     */
    get_CachedZoomMinimum() {
        result := ComCall(19, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the maximum zoom level of the control's viewport.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_currentzoommaximum
     */
    get_CurrentZoomMaximum() {
        result := ComCall(20, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached maximum zoom level of the control's viewport.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtransformpattern2-get_cachedzoommaximum
     */
    get_CachedZoomMaximum() {
        result := ComCall(21, this, "double*", &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationTransformPattern2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Zoom := CallbackCreate(GetMethod(implObj, "Zoom"), flags, 2)
        this.vtbl.ZoomByUnit := CallbackCreate(GetMethod(implObj, "ZoomByUnit"), flags, 2)
        this.vtbl.get_CurrentCanZoom := CallbackCreate(GetMethod(implObj, "get_CurrentCanZoom"), flags, 2)
        this.vtbl.get_CachedCanZoom := CallbackCreate(GetMethod(implObj, "get_CachedCanZoom"), flags, 2)
        this.vtbl.get_CurrentZoomLevel := CallbackCreate(GetMethod(implObj, "get_CurrentZoomLevel"), flags, 2)
        this.vtbl.get_CachedZoomLevel := CallbackCreate(GetMethod(implObj, "get_CachedZoomLevel"), flags, 2)
        this.vtbl.get_CurrentZoomMinimum := CallbackCreate(GetMethod(implObj, "get_CurrentZoomMinimum"), flags, 2)
        this.vtbl.get_CachedZoomMinimum := CallbackCreate(GetMethod(implObj, "get_CachedZoomMinimum"), flags, 2)
        this.vtbl.get_CurrentZoomMaximum := CallbackCreate(GetMethod(implObj, "get_CurrentZoomMaximum"), flags, 2)
        this.vtbl.get_CachedZoomMaximum := CallbackCreate(GetMethod(implObj, "get_CachedZoomMaximum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Zoom)
        CallbackFree(this.vtbl.ZoomByUnit)
        CallbackFree(this.vtbl.get_CurrentCanZoom)
        CallbackFree(this.vtbl.get_CachedCanZoom)
        CallbackFree(this.vtbl.get_CurrentZoomLevel)
        CallbackFree(this.vtbl.get_CachedZoomLevel)
        CallbackFree(this.vtbl.get_CurrentZoomMinimum)
        CallbackFree(this.vtbl.get_CachedZoomMinimum)
        CallbackFree(this.vtbl.get_CurrentZoomMaximum)
        CallbackFree(this.vtbl.get_CachedZoomMaximum)
    }
}
