#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IAppxBlockMapFilesEnumerator.ahk" { IAppxBlockMapFilesEnumerator }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUri.ahk" { IUri }
#Import ".\IAppxBlockMapFile.ahk" { IAppxBlockMapFile }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a read-only object model for block maps that provides access to the file attributes and block hashes.
 * @remarks
 * The <b>IAppxBlockMapReader</b> represents the <b>BlockMap</b> root element of the block map. <b>File</b> elements are the child elements of the <b>BlockMap</b> element.
 * 
 * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxfactory-createblockmapreader">CreateBlockMapReader</a> or <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxfactory-createvalidatedblockmapreader">CreateValidatedBlockMapReader</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfactory">IAppxFactory</a> interface, or the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxpackagereader-getblockmap">GetBlockMap </a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxpackagereader">IAppxPackageReader</a> interface.
 * 
 * For a code example, see the [Query app package and app manifest sample](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/AppxPackingDescribeAppx).
 * 
 * <div class="code"></div>
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxblockmapreader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxBlockMapReader extends IUnknown {
    /**
     * The interface identifier for IAppxBlockMapReader
     * @type {Guid}
     */
    static IID := Guid("{5efec991-bca3-42d1-9ec2-e92d609ec22a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxBlockMapReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFile       : IntPtr
        GetFiles      : IntPtr
        GetHashMethod : IntPtr
        GetStream     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxBlockMapReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves data corresponding to a file in the block map with the specified file name.
     * @param {PWSTR} filename Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the file.
     * @returns {IAppxBlockMapFile} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxblockmapfile">IAppxBlockMapFile</a>**</b>
     * 
     * The data about the file's attributes and blocks.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapreader-getfile
     */
    GetFile(filename) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(3, this, "ptr", filename, "ptr*", &_file := 0, "HRESULT")
        return IAppxBlockMapFile(_file)
    }

    /**
     * Retrieves an enumerator for traversing the files listed in the block map.
     * @returns {IAppxBlockMapFilesEnumerator} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxblockmapfilesenumerator">IAppxBlockMapFilesEnumerator</a>**</b>
     * 
     * The enumerator of all the files listed in the block map.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapreader-getfiles
     */
    GetFiles() {
        result := ComCall(4, this, "ptr*", &_enumerator := 0, "HRESULT")
        return IAppxBlockMapFilesEnumerator(_enumerator)
    }

    /**
     * Retrieves the URI for the hash algorithm used to create block hashes in the block map.
     * @remarks
     * The <i>hashMethod</i> value corresponds to the <b>HashMethod</b> attribute of the <a href="https://docs.microsoft.com/uwp/schemas/blockmapschema/element-blockmap">BlockMap</a> root element. 
     * 
     * <b>GetHashMethod</b> returns supported URIs for <a href="https://docs.microsoft.com/uwp/schemas/mobilebroadbandschema/carriercontrolsignatureschema/element-digestmethod">DigestMethod</a>s.
     * @returns {IUri} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775038(v=vs.85)">IUri</a>**</b>
     * 
     * The hash algorithm used in this block map.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapreader-gethashmethod
     */
    GetHashMethod() {
        result := ComCall(5, this, "ptr*", &hashMethod := 0, "HRESULT")
        return IUri(hashMethod)
    }

    /**
     * Retrieves a read-only stream that represents the XML content of the block map.
     * @returns {IStream} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * A read-only stream that represents the XML content of the block map.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapreader-getstream
     */
    GetStream() {
        result := ComCall(6, this, "ptr*", &blockMapStream := 0, "HRESULT")
        return IStream(blockMapStream)
    }

    Query(iid) {
        if (IAppxBlockMapReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFile := CallbackCreate(GetMethod(implObj, "GetFile"), flags, 3)
        this.vtbl.GetFiles := CallbackCreate(GetMethod(implObj, "GetFiles"), flags, 2)
        this.vtbl.GetHashMethod := CallbackCreate(GetMethod(implObj, "GetHashMethod"), flags, 2)
        this.vtbl.GetStream := CallbackCreate(GetMethod(implObj, "GetStream"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFile)
        CallbackFree(this.vtbl.GetFiles)
        CallbackFree(this.vtbl.GetHashMethod)
        CallbackFree(this.vtbl.GetStream)
    }
}
