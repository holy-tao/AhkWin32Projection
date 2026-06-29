#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAppxBlockMapReader.ahk" { IAppxBlockMapReader }
#Import ".\APPX_FOOTPRINT_FILE_TYPE.ahk" { APPX_FOOTPRINT_FILE_TYPE }
#Import ".\IAppxManifestReader.ahk" { IAppxManifestReader }
#Import ".\IAppxFilesEnumerator.ahk" { IAppxFilesEnumerator }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IAppxFile.ahk" { IAppxFile }

/**
 * Provides a read-only object model for app packages.
 * @remarks
 * The <b>IAppxPackageReader</b> interface provides the ability to access payload files from a package and to query metadata from footprint files. 
 * 
 * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxfactory-createpackagereader">CreatePackageReader</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfactory">IAppxFactory</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxpackagereader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxPackageReader extends IUnknown {
    /**
     * The interface identifier for IAppxPackageReader
     * @type {Guid}
     */
    static IID := Guid("{b5c49650-99bc-481c-9a34-3d53a4106708}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxPackageReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetBlockMap      : IntPtr
        GetFootprintFile : IntPtr
        GetPayloadFile   : IntPtr
        GetPayloadFiles  : IntPtr
        GetManifest      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxPackageReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the block map object model of the package.
     * @remarks
     * The package block map is validated when the package reader is created using <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfactory">IAppxFactory</a>.
     * @returns {IAppxBlockMapReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxblockmapreader">IAppxBlockMapReader</a>**</b>
     * 
     * The object model of the block map of the package.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackagereader-getblockmap
     */
    GetBlockMap() {
        result := ComCall(3, this, "ptr*", &blockMapReader := 0, "HRESULT")
        return IAppxBlockMapReader(blockMapReader)
    }

    /**
     * Retrieves a footprint file from the package.
     * @param {APPX_FOOTPRINT_FILE_TYPE} type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_footprint_file_type">APPX_FOOTPRINT_FILE_TYPE</a></b>
     * 
     * The type of footprint file to be retrieved.
     * @returns {IAppxFile} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfile">IAppxFile</a>**</b>
     * 
     * The file object that corresponds to the footprint file of <i>type</i>.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackagereader-getfootprintfile
     */
    GetFootprintFile(type) {
        result := ComCall(4, this, APPX_FOOTPRINT_FILE_TYPE, type, "ptr*", &_file := 0, "HRESULT")
        return IAppxFile(_file)
    }

    /**
     * Retrieves a payload file from the package.
     * @remarks
     * The specified <i>fileName</i> must include the path relative to the package root directory.
     * @param {PWSTR} fileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the payload file to be retrieved.
     * @returns {IAppxFile} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfile">IAppxFile</a>**</b>
     * 
     * The file object that corresponds to <i>fileName</i>.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackagereader-getpayloadfile
     */
    GetPayloadFile(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(5, this, "ptr", fileName, "ptr*", &_file := 0, "HRESULT")
        return IAppxFile(_file)
    }

    /**
     * Retrieves an enumerator that iterates through the payload files in the package.
     * @returns {IAppxFilesEnumerator} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfilesenumerator">IAppxFilesEnumerator</a>**</b>
     * 
     *  An enumerator over all payload files in the package.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackagereader-getpayloadfiles
     */
    GetPayloadFiles() {
        result := ComCall(6, this, "ptr*", &filesEnumerator := 0, "HRESULT")
        return IAppxFilesEnumerator(filesEnumerator)
    }

    /**
     * Retrieves the object model of the app manifest of the package.
     * @remarks
     * The package app manifest is validated when the package reader is created using <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfactory">IAppxFactory</a>.
     * @returns {IAppxManifestReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestreader">IAppxManifestReader</a>**</b>
     * 
     * The object model of the app manifest.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackagereader-getmanifest
     */
    GetManifest() {
        result := ComCall(7, this, "ptr*", &manifestReader := 0, "HRESULT")
        return IAppxManifestReader(manifestReader)
    }

    Query(iid) {
        if (IAppxPackageReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBlockMap := CallbackCreate(GetMethod(implObj, "GetBlockMap"), flags, 2)
        this.vtbl.GetFootprintFile := CallbackCreate(GetMethod(implObj, "GetFootprintFile"), flags, 3)
        this.vtbl.GetPayloadFile := CallbackCreate(GetMethod(implObj, "GetPayloadFile"), flags, 3)
        this.vtbl.GetPayloadFiles := CallbackCreate(GetMethod(implObj, "GetPayloadFiles"), flags, 2)
        this.vtbl.GetManifest := CallbackCreate(GetMethod(implObj, "GetManifest"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBlockMap)
        CallbackFree(this.vtbl.GetFootprintFile)
        CallbackFree(this.vtbl.GetPayloadFile)
        CallbackFree(this.vtbl.GetPayloadFiles)
        CallbackFree(this.vtbl.GetManifest)
    }
}
