#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Graphics\Dxgi\Common\DXGI_MODE_ROTATION.ahk" { DXGI_MODE_ROTATION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct ISurfacePresenterFlip2 extends IUnknown {
    /**
     * The interface identifier for ISurfacePresenterFlip2
     * @type {Guid}
     */
    static IID := Guid("{30510865-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISurfacePresenterFlip2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetRotation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISurfacePresenterFlip2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {DXGI_MODE_ROTATION} dxgiRotation 
     * @returns {HRESULT} 
     */
    SetRotation(dxgiRotation) {
        result := ComCall(3, this, DXGI_MODE_ROTATION, dxgiRotation, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISurfacePresenterFlip2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetRotation := CallbackCreate(GetMethod(implObj, "SetRotation"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetRotation)
    }
}
