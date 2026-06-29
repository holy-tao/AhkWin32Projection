#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAppxManifestPackageId.ahk" { IAppxManifestPackageId }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\APPX_PACKAGE_ARCHITECTURE2.ahk" { APPX_PACKAGE_ARCHITECTURE2 }

/**
 * Provides access to the app package identity.
 * @remarks
 * Package identity information is specified using the <b>Identity</b> element in the package manifest.
 * 
 * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getpackageid">IAppxManifestReader::GetPackageId</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxmanifestpackageid2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestPackageId2 extends IAppxManifestPackageId {
    /**
     * The interface identifier for IAppxManifestPackageId2
     * @type {Guid}
     */
    static IID := Guid("{2256999d-d617-42f1-880e-0ba4542319d5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestPackageId2 interfaces
    */
    struct Vtbl extends IAppxManifestPackageId.Vtbl {
        GetArchitecture2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestPackageId2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the processor architecture as defined in the manifest. (IAppxManifestPackageId2.GetArchitecture2)
     * @remarks
     * Processor architecture information is specified using the <b>ProcessorArchitecture</b> attribute of the <b>Identity</b> element in the app package manifest.
     * 
     * If no architecture is defined in the manifest, this method returns the <b>APPX_PACKAGE_ARCHITECTURE_NEUTRAL</b> value of the  <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_package_architecture2">APPX_PACKAGE_ARCHITECTURE2</a> enumeration.
     * @returns {APPX_PACKAGE_ARCHITECTURE2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_package_architecture2">APPX_PACKAGE_ARCHITECTURE2</a>*</b>
     * 
     * The architecture specified for the package.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestpackageid2-getarchitecture2
     */
    GetArchitecture2() {
        result := ComCall(11, this, "int*", &_architecture := 0, "HRESULT")
        return _architecture
    }

    Query(iid) {
        if (IAppxManifestPackageId2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetArchitecture2 := CallbackCreate(GetMethod(implObj, "GetArchitecture2"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetArchitecture2)
    }
}
