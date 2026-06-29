#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxManifestPackageDependency.ahk" { IAppxManifestPackageDependency }

/**
 * Describes the dependency of one package on another package. (IAppxManifestPackageDependency2)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxmanifestpackagedependency2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestPackageDependency2 extends IAppxManifestPackageDependency {
    /**
     * The interface identifier for IAppxManifestPackageDependency2
     * @type {Guid}
     */
    static IID := Guid("{dda0b713-f3ff-49d3-898a-2786780c5d98}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestPackageDependency2 interfaces
    */
    struct Vtbl extends IAppxManifestPackageDependency.Vtbl {
        GetMaxMajorVersionTested : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestPackageDependency2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the maximum major version number of the package that is tested to be compatible with the current package.
     * @remarks
     * If the
     * <b>MaxMajorVersionTested</b> attribute is not specified for the current dependency package, this method returns the highest 16 bits of the <b>MinVersion</b> field. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestpackagedependency-getminversion">GetMinVersion</a> method.
     * @returns {Integer} The maximum major version number of the dependency package that has been tested to be compatible
     * with the current package.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackagedependency2-getmaxmajorversiontested
     */
    GetMaxMajorVersionTested() {
        result := ComCall(6, this, "ushort*", &maxMajorVersionTested := 0, "HRESULT")
        return maxMajorVersionTested
    }

    Query(iid) {
        if (IAppxManifestPackageDependency2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMaxMajorVersionTested := CallbackCreate(GetMethod(implObj, "GetMaxMajorVersionTested"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMaxMajorVersionTested)
    }
}
