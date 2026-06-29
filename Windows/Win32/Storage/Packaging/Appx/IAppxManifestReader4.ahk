#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAppxManifestOptionalPackageInfo.ahk" { IAppxManifestOptionalPackageInfo }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxManifestReader3.ahk" { IAppxManifestReader3 }

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestReader4 extends IAppxManifestReader3 {
    /**
     * The interface identifier for IAppxManifestReader4
     * @type {Guid}
     */
    static IID := Guid("{4579bb7c-741d-4161-b5a1-47bd3b78ad9b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestReader4 interfaces
    */
    struct Vtbl extends IAppxManifestReader3.Vtbl {
        GetOptionalPackageInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestReader4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IAppxManifestOptionalPackageInfo} 
     */
    GetOptionalPackageInfo() {
        result := ComCall(15, this, "ptr*", &optionalPackageInfo := 0, "HRESULT")
        return IAppxManifestOptionalPackageInfo(optionalPackageInfo)
    }

    Query(iid) {
        if (IAppxManifestReader4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOptionalPackageInfo := CallbackCreate(GetMethod(implObj, "GetOptionalPackageInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOptionalPackageInfo)
    }
}
