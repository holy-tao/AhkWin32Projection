#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Dxgi\IDXGISurface.ahk" { IDXGISurface }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\PageCountType.ahk" { PageCountType }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintPreviewDxgiPackageTarget extends IUnknown {
    /**
     * The interface identifier for IPrintPreviewDxgiPackageTarget
     * @type {Guid}
     */
    static IID := Guid("{1a6dd0ad-1e2a-4e99-a5ba-91f17818290e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintPreviewDxgiPackageTarget interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetJobPageCount   : IntPtr
        DrawPage          : IntPtr
        InvalidatePreview : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintPreviewDxgiPackageTarget.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PageCountType} countType 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    SetJobPageCount(countType, count) {
        result := ComCall(3, this, PageCountType, countType, "uint", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} jobPageNumber 
     * @param {IDXGISurface} pageImage 
     * @param {Float} dpiX 
     * @param {Float} dpiY 
     * @returns {HRESULT} 
     */
    DrawPage(jobPageNumber, pageImage, dpiX, dpiY) {
        result := ComCall(4, this, "uint", jobPageNumber, "ptr", pageImage, "float", dpiX, "float", dpiY, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InvalidatePreview() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintPreviewDxgiPackageTarget.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetJobPageCount := CallbackCreate(GetMethod(implObj, "SetJobPageCount"), flags, 3)
        this.vtbl.DrawPage := CallbackCreate(GetMethod(implObj, "DrawPage"), flags, 5)
        this.vtbl.InvalidatePreview := CallbackCreate(GetMethod(implObj, "InvalidatePreview"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetJobPageCount)
        CallbackFree(this.vtbl.DrawPage)
        CallbackFree(this.vtbl.InvalidatePreview)
    }
}
