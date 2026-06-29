#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISurfacePresenterFlipBuffer.ahk" { ISurfacePresenterFlipBuffer }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IViewObjectPresentFlip extends IUnknown {
    /**
     * The interface identifier for IViewObjectPresentFlip
     * @type {Guid}
     */
    static IID := Guid("{30510847-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IViewObjectPresentFlip interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NotifyRender               : IntPtr
        RenderObjectToBitmap       : IntPtr
        RenderObjectToSharedBuffer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IViewObjectPresentFlip.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BOOL} fRecreatePresenter 
     * @returns {HRESULT} 
     */
    NotifyRender(fRecreatePresenter) {
        result := ComCall(3, this, BOOL, fRecreatePresenter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pBitmap 
     * @returns {HRESULT} 
     */
    RenderObjectToBitmap(pBitmap) {
        result := ComCall(4, this, "ptr", pBitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISurfacePresenterFlipBuffer} pBuffer 
     * @returns {HRESULT} 
     */
    RenderObjectToSharedBuffer(pBuffer) {
        result := ComCall(5, this, "ptr", pBuffer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IViewObjectPresentFlip.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NotifyRender := CallbackCreate(GetMethod(implObj, "NotifyRender"), flags, 2)
        this.vtbl.RenderObjectToBitmap := CallbackCreate(GetMethod(implObj, "RenderObjectToBitmap"), flags, 2)
        this.vtbl.RenderObjectToSharedBuffer := CallbackCreate(GetMethod(implObj, "RenderObjectToSharedBuffer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NotifyRender)
        CallbackFree(this.vtbl.RenderObjectToBitmap)
        CallbackFree(this.vtbl.RenderObjectToSharedBuffer)
    }
}
