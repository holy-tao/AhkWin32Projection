#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxBlockMapReader.ahk" { IAppxBlockMapReader }
#Import ".\IAppxFilesEnumerator.ahk" { IAppxFilesEnumerator }
#Import ".\APPX_BUNDLE_FOOTPRINT_FILE_TYPE.ahk" { APPX_BUNDLE_FOOTPRINT_FILE_TYPE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IAppxBundleManifestReader.ahk" { IAppxBundleManifestReader }
#Import ".\IAppxFile.ahk" { IAppxFile }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a read-only object model for bundle packages.
 * @remarks
 * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxbundlefactory-createbundlereader">CreateBundleReader</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxbundlefactory">IAppxBundleFactory</a> interface to retrieve the <b>IAppxBundleReader</b> object. 
 * 
 * Through <b>IAppxBundleReader</b>, you can retrieve both footprint files, such as the bundle’s manifest, block map, and signature, and app packages that are contained in the bundle.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxbundlereader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxBundleReader extends IUnknown {
    /**
     * The interface identifier for IAppxBundleReader
     * @type {Guid}
     */
    static IID := Guid("{dd75b8c0-ba76-43b0-ae0f-68656a1dc5c8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxBundleReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFootprintFile   : IntPtr
        GetBlockMap        : IntPtr
        GetManifest        : IntPtr
        GetPayloadPackages : IntPtr
        GetPayloadPackage  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxBundleReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the specified type of footprint file from the bundle.
     * @param {APPX_BUNDLE_FOOTPRINT_FILE_TYPE} fileType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_bundle_footprint_file_type">APPX_BUNDLE_FOOTPRINT_FILE_TYPE</a></b>
     * 
     * The type of footprint file to be retrieved.
     * @returns {IAppxFile} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfile">IAppxFile</a>**</b>
     * 
     * The file object that corresponds to the footprint file of <i>fileType</i>.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlereader-getfootprintfile
     */
    GetFootprintFile(fileType) {
        result := ComCall(3, this, APPX_BUNDLE_FOOTPRINT_FILE_TYPE, fileType, "ptr*", &footprintFile := 0, "HRESULT")
        return IAppxFile(footprintFile)
    }

    /**
     * Retrieves a read-only block map object from the bundle.
     * @returns {IAppxBlockMapReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxblockmapreader">IAppxBlockMapReader</a>**</b>
     * 
     * The object model of the block map of a package in the bundle.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlereader-getblockmap
     */
    GetBlockMap() {
        result := ComCall(4, this, "ptr*", &blockMapReader := 0, "HRESULT")
        return IAppxBlockMapReader(blockMapReader)
    }

    /**
     * Retrieves a read-only manifest object from the bundle.
     * @returns {IAppxBundleManifestReader} Type: <b>IAppxBundleManifestReader**</b>
     * 
     * The object model of the bundle manifest.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlereader-getmanifest
     */
    GetManifest() {
        result := ComCall(5, this, "ptr*", &manifestReader := 0, "HRESULT")
        return IAppxBundleManifestReader(manifestReader)
    }

    /**
     * Retrieves an enumerator that iterates over the list of all payload packages in the bundle.
     * @returns {IAppxFilesEnumerator} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfilesenumerator">IAppxFilesEnumerator</a>**</b>
     * 
     *  An enumerator over all payload packages in the bundle.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlereader-getpayloadpackages
     */
    GetPayloadPackages() {
        result := ComCall(6, this, "ptr*", &payloadPackages := 0, "HRESULT")
        return IAppxFilesEnumerator(payloadPackages)
    }

    /**
     * Retrieves an appx file object for the payload package with the specified file name.
     * @remarks
     * You can pass the file object’s stream into <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxfactory-createpackagereader">IAppxFactory::CreatePackageReader</a> to get a package reader object over the appx file.
     * @param {PWSTR} fileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the payload file to be retrieved.
     * @returns {IAppxFile} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfile">IAppxFile</a>**</b>
     * 
     * The payload file object the that corresponds to <i>fileName</i>.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlereader-getpayloadpackage
     */
    GetPayloadPackage(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(7, this, "ptr", fileName, "ptr*", &payloadPackage := 0, "HRESULT")
        return IAppxFile(payloadPackage)
    }

    Query(iid) {
        if (IAppxBundleReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFootprintFile := CallbackCreate(GetMethod(implObj, "GetFootprintFile"), flags, 3)
        this.vtbl.GetBlockMap := CallbackCreate(GetMethod(implObj, "GetBlockMap"), flags, 2)
        this.vtbl.GetManifest := CallbackCreate(GetMethod(implObj, "GetManifest"), flags, 2)
        this.vtbl.GetPayloadPackages := CallbackCreate(GetMethod(implObj, "GetPayloadPackages"), flags, 2)
        this.vtbl.GetPayloadPackage := CallbackCreate(GetMethod(implObj, "GetPayloadPackage"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFootprintFile)
        CallbackFree(this.vtbl.GetBlockMap)
        CallbackFree(this.vtbl.GetManifest)
        CallbackFree(this.vtbl.GetPayloadPackages)
        CallbackFree(this.vtbl.GetPayloadPackage)
    }
}
