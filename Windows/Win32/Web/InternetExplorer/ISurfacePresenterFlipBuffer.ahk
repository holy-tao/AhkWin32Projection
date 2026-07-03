#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct ISurfacePresenterFlipBuffer extends IUnknown {
    /**
     * The interface identifier for ISurfacePresenterFlipBuffer
     * @type {Guid}
     */
    static IID := Guid("{e43f4a08-8bbc-4665-ac92-c55ce61fd7e7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISurfacePresenterFlipBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BeginDraw : IntPtr
        EndDraw   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISurfacePresenterFlipBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    BeginDraw(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &ppBuffer := 0, "HRESULT")
        return ppBuffer
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndDraw() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISurfacePresenterFlipBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginDraw := CallbackCreate(GetMethod(implObj, "BeginDraw"), flags, 3)
        this.vtbl.EndDraw := CallbackCreate(GetMethod(implObj, "EndDraw"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginDraw)
        CallbackFree(this.vtbl.EndDraw)
    }
}
