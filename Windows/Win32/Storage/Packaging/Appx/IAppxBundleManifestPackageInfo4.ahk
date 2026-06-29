#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxBundleManifestPackageInfo4 extends IUnknown {
    /**
     * The interface identifier for IAppxBundleManifestPackageInfo4
     * @type {Guid}
     */
    static IID := Guid("{5da6f13d-a8a7-4532-857c-1393d659371d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxBundleManifestPackageInfo4 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIsStub : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxBundleManifestPackageInfo4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetIsStub() {
        result := ComCall(3, this, BOOL.Ptr, &isStub := 0, "HRESULT")
        return isStub
    }

    Query(iid) {
        if (IAppxBundleManifestPackageInfo4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIsStub := CallbackCreate(GetMethod(implObj, "GetIsStub"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIsStub)
    }
}
