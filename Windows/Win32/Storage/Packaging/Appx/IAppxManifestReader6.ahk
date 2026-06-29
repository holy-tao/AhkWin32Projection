#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents an object model of the package manifest that provides methods to access manifest elements and attributes. (IAppxManifestReader6)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxmanifestreader6
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestReader6 extends IUnknown {
    /**
     * The interface identifier for IAppxManifestReader6
     * @type {Guid}
     */
    static IID := Guid("{34deaca4-d3c0-4e3e-b312-e42625e3807e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestReader6 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIsNonQualifiedResourcePackage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestReader6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Queries whether an app package is a non-qualified resource package.
     * @returns {BOOL} True if the package is a non-qualified resource package, False otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestreader6-getisnonqualifiedresourcepackage
     */
    GetIsNonQualifiedResourcePackage() {
        result := ComCall(3, this, BOOL.Ptr, &isNonQualifiedResourcePackage := 0, "HRESULT")
        return isNonQualifiedResourcePackage
    }

    Query(iid) {
        if (IAppxManifestReader6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIsNonQualifiedResourcePackage := CallbackCreate(GetMethod(implObj, "GetIsNonQualifiedResourcePackage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIsNonQualifiedResourcePackage)
    }
}
