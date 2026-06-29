#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import ".\IAppxManifestPackageId.ahk" { IAppxManifestPackageId }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxBundleManifestPackageInfoEnumerator.ahk" { IAppxBundleManifestPackageInfoEnumerator }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a read-only object model for manifests of bundle packages. (IAppxBundleManifestReader)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxbundlemanifestreader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxBundleManifestReader extends IUnknown {
    /**
     * The interface identifier for IAppxBundleManifestReader
     * @type {Guid}
     */
    static IID := Guid("{cf0ebbc1-cc99-4106-91eb-e67462e04fb0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxBundleManifestReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPackageId        : IntPtr
        GetPackageInfoItems : IntPtr
        GetStream           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxBundleManifestReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an object that represents the &lt;Identity&gt; element under the root &lt;Bundle&gt; element.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method when you have finished using the <i>packageId</i> object.
     * @returns {IAppxManifestPackageId} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestpackageid">IAppxManifestPackageId</a>**</b>
     * 
     * The package identifier.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestreader-getpackageid
     */
    GetPackageId() {
        result := ComCall(3, this, "ptr*", &packageId := 0, "HRESULT")
        return IAppxManifestPackageId(packageId)
    }

    /**
     * Retrieves an enumerator over all the &lt;Package&gt; elements under the &lt;Packages&gt; element.
     * @returns {IAppxBundleManifestPackageInfoEnumerator} Type: <b>IAppxBundleManifestPackageInfoEnumerator**</b>
     * 
     *  An enumerator over all payload packages in a &lt;Packages&gt; element of a bundle.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestreader-getpackageinfoitems
     */
    GetPackageInfoItems() {
        result := ComCall(4, this, "ptr*", &packageInfoItems := 0, "HRESULT")
        return IAppxBundleManifestPackageInfoEnumerator(packageInfoItems)
    }

    /**
     * Gets the raw XML document without any preprocessing.
     * @remarks
     * The raw XML stream is the entire source stream and might contain elements and attributes in other namespaces that are ignored by the manifest reader.  For example, the XML stream might have elements in other namespaces that were marked in the <b>IgnorableNamespaces</b> attribute in the <b>Package</b> element, which were not validated. So, we recommend not to trust or parse this XML without security testing.
     * @returns {IStream} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * The read-only stream that represents the XML content of the manifest.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlemanifestreader-getstream
     */
    GetStream() {
        result := ComCall(5, this, "ptr*", &manifestStream := 0, "HRESULT")
        return IStream(manifestStream)
    }

    Query(iid) {
        if (IAppxBundleManifestReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPackageId := CallbackCreate(GetMethod(implObj, "GetPackageId"), flags, 2)
        this.vtbl.GetPackageInfoItems := CallbackCreate(GetMethod(implObj, "GetPackageInfoItems"), flags, 2)
        this.vtbl.GetStream := CallbackCreate(GetMethod(implObj, "GetStream"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPackageId)
        CallbackFree(this.vtbl.GetPackageInfoItems)
        CallbackFree(this.vtbl.GetStream)
    }
}
