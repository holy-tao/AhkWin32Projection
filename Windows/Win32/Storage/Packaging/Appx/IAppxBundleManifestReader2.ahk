#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IAppxBundleManifestOptionalBundleInfoEnumerator.ahk" { IAppxBundleManifestOptionalBundleInfoEnumerator }

/**
 * Provides a read-only object model for manifests of bundle packages. (IAppxBundleManifestReader2)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxbundlemanifestreader2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxBundleManifestReader2 extends IUnknown {
    /**
     * The interface identifier for IAppxBundleManifestReader2
     * @type {Guid}
     */
    static IID := Guid("{5517df70-033f-4af2-8213-87d766805c02}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxBundleManifestReader2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOptionalBundles : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxBundleManifestReader2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an object that represents the &lt;OptionalBundles&gt; element under the root &lt;Bundle&gt; element.
     * @returns {IAppxBundleManifestOptionalBundleInfoEnumerator} The optional bundle.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestreader2-getoptionalbundles
     */
    GetOptionalBundles() {
        result := ComCall(3, this, "ptr*", &optionalBundles := 0, "HRESULT")
        return IAppxBundleManifestOptionalBundleInfoEnumerator(optionalBundles)
    }

    Query(iid) {
        if (IAppxBundleManifestReader2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOptionalBundles := CallbackCreate(GetMethod(implObj, "GetOptionalBundles"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOptionalBundles)
    }
}
