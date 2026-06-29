#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ZoomUnit.ahk" { ZoomUnit }
#Import ".\ITransformProvider.ahk" { ITransformProvider }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Extends the ITransformProvider interface to enable Microsoft UI Automation providers to expose properties to support the viewport zooming functionality of a control.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-itransformprovider2
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ITransformProvider2 extends ITransformProvider {
    /**
     * The interface identifier for ITransformProvider2
     * @type {Guid}
     */
    static IID := Guid("{4758742f-7ac2-460c-bc48-09fc09308a93}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransformProvider2 interfaces
    */
    struct Vtbl extends ITransformProvider.Vtbl {
        Zoom            : IntPtr
        get_CanZoom     : IntPtr
        get_ZoomLevel   : IntPtr
        get_ZoomMinimum : IntPtr
        get_ZoomMaximum : IntPtr
        ZoomByUnit      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransformProvider2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Zooms the viewport of the control. (ITransformProvider2.Zoom)
     * @param {Float} zoom Type: <b>double</b>
     * 
     * The amount to zoom the viewport, specified as a percentage. The provider should zoom the viewport to the nearest supported value.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider2-zoom
     */
    Zoom(zoom) {
        result := ComCall(9, this, "double", zoom, "HRESULT")
        return result
    }

    /**
     * Indicates whether the control supports zooming of its viewport. (ITransformProvider2.get_CanZoom)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider2-get_canzoom
     */
    get_CanZoom() {
        result := ComCall(10, this, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves the current zoom level of the element.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider2-get_zoomlevel
     */
    get_ZoomLevel() {
        result := ComCall(11, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves the minimum zoom level of the element.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider2-get_zoomminimum
     */
    get_ZoomMinimum() {
        result := ComCall(12, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves the maximum zoom level of the element.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider2-get_zoommaximum
     */
    get_ZoomMaximum() {
        result := ComCall(13, this, "double*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Zooms the viewport of the control by the specified logical unit.
     * @param {ZoomUnit} _zoomUnit The logical unit by which to increase or decrease the zoom of the viewport.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itransformprovider2-zoombyunit
     */
    ZoomByUnit(_zoomUnit) {
        result := ComCall(14, this, ZoomUnit, _zoomUnit, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransformProvider2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Zoom := CallbackCreate(GetMethod(implObj, "Zoom"), flags, 2)
        this.vtbl.get_CanZoom := CallbackCreate(GetMethod(implObj, "get_CanZoom"), flags, 2)
        this.vtbl.get_ZoomLevel := CallbackCreate(GetMethod(implObj, "get_ZoomLevel"), flags, 2)
        this.vtbl.get_ZoomMinimum := CallbackCreate(GetMethod(implObj, "get_ZoomMinimum"), flags, 2)
        this.vtbl.get_ZoomMaximum := CallbackCreate(GetMethod(implObj, "get_ZoomMaximum"), flags, 2)
        this.vtbl.ZoomByUnit := CallbackCreate(GetMethod(implObj, "ZoomByUnit"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Zoom)
        CallbackFree(this.vtbl.get_CanZoom)
        CallbackFree(this.vtbl.get_ZoomLevel)
        CallbackFree(this.vtbl.get_ZoomMinimum)
        CallbackFree(this.vtbl.get_ZoomMaximum)
        CallbackFree(this.vtbl.ZoomByUnit)
    }
}
