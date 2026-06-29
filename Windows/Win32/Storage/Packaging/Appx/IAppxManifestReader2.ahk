#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAppxManifestReader.ahk" { IAppxManifestReader }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxManifestQualifiedResourcesEnumerator.ahk" { IAppxManifestQualifiedResourcesEnumerator }

/**
 * Represents an object model of the package manifest that provides methods to access manifest elements and attributes. (IAppxManifestReader2)
 * @remarks
 * <div class="alert"><b>Note</b>  Starting with Windows 8.1, we recommend not to use <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getresources">IAppxManifestReader::GetResources</a> anymore to only iterate over the <b>Language</b> values in the manifest. Instead, use <b>IAppxManifestReader2::GetResources</b> because it iterates over other resource qualifiers as well, such as, <b>Scale</b> and <b>DXFeatureLevel</b>. </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxmanifestreader2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxManifestReader2 extends IAppxManifestReader {
    /**
     * The interface identifier for IAppxManifestReader2
     * @type {Guid}
     */
    static IID := Guid("{d06f67bc-b31d-4eba-a8af-638e73e77b4d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxManifestReader2 interfaces
    */
    struct Vtbl extends IAppxManifestReader.Vtbl {
        GetQualifiedResources : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxManifestReader2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an enumerator that iterates through the qualified resources that are defined in the manifest.
     * @remarks
     * Resources are specified using the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-resources">Resources</a> element in the manifest.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method when you have finished using the <i>resources</i> object.
     * @returns {IAppxManifestQualifiedResourcesEnumerator} Type: <b><a href="https://docs.microsoft.com/previous-versions/dn280306(v=vs.85)">IAppxManifestQualifiedResourcesEnumerator</a>**</b>
     * 
     * The enumerator that iterates through the qualified resources.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestreader2-getqualifiedresources
     */
    GetQualifiedResources() {
        result := ComCall(12, this, "ptr*", &resources := 0, "HRESULT")
        return IAppxManifestQualifiedResourcesEnumerator(resources)
    }

    Query(iid) {
        if (IAppxManifestReader2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetQualifiedResources := CallbackCreate(GetMethod(implObj, "GetQualifiedResources"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetQualifiedResources)
    }
}
