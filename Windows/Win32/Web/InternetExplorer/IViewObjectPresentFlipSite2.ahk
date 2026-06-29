#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Graphics\Dxgi\Common\DXGI_MODE_ROTATION.ahk" { DXGI_MODE_ROTATION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IViewObjectPresentFlipSite2 extends IUnknown {
    /**
     * The interface identifier for IViewObjectPresentFlipSite2
     * @type {Guid}
     */
    static IID := Guid("{aad0cbf1-e7fd-4f12-8902-c78132a8e01d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IViewObjectPresentFlipSite2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRotationForCurrentOutput : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IViewObjectPresentFlipSite2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {DXGI_MODE_ROTATION} 
     */
    GetRotationForCurrentOutput() {
        result := ComCall(3, this, "int*", &pDxgiRotation := 0, "HRESULT")
        return pDxgiRotation
    }

    Query(iid) {
        if (IViewObjectPresentFlipSite2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRotationForCurrentOutput := CallbackCreate(GetMethod(implObj, "GetRotationForCurrentOutput"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRotationForCurrentOutput)
    }
}
