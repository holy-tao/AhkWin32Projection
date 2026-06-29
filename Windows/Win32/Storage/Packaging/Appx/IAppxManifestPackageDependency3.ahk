#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestPackageDependency3 extends IUnknown {
    /**
     * The interface identifier for IAppxManifestPackageDependency3
     * @type {Guid}
     */
    static IID := Guid("{1ac56374-6198-4d6b-92e4-749d5ab8a895}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestPackageDependency3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIsOptional : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestPackageDependency3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetIsOptional() {
        result := ComCall(3, this, BOOL.Ptr, &isOptional := 0, "HRESULT")
        return isOptional
    }

    Query(iid) {
        if (IAppxManifestPackageDependency3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIsOptional := CallbackCreate(GetMethod(implObj, "GetIsOptional"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIsOptional)
    }
}
