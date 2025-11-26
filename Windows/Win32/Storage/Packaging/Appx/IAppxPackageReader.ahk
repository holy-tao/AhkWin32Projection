#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxBlockMapReader.ahk
#Include .\IAppxFile.ahk
#Include .\IAppxFilesEnumerator.ahk
#Include .\IAppxManifestReader.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a read-only object model for app packages.
 * @remarks
 * 
 * The <b>IAppxPackageReader</b> interface provides the ability to access payload files from a package and to query metadata from footprint files. 
 * 
 * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxfactory-createpackagereader">CreatePackageReader</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfactory">IAppxFactory</a> interface.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxpackagereader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxPackageReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxPackageReader
     * @type {Guid}
     */
    static IID => Guid("{b5c49650-99bc-481c-9a34-3d53a4106708}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBlockMap", "GetFootprintFile", "GetPayloadFile", "GetPayloadFiles", "GetManifest"]

    /**
     * Retrieves the block map object model of the package.
     * @returns {IAppxBlockMapReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxblockmapreader">IAppxBlockMapReader</a>**</b>
     * 
     * The object model of the block map of the package.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxpackagereader-getblockmap
     */
    GetBlockMap() {
        result := ComCall(3, this, "ptr*", &blockMapReader := 0, "HRESULT")
        return IAppxBlockMapReader(blockMapReader)
    }

    /**
     * Retrieves a footprint file from the package.
     * @param {Integer} type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_footprint_file_type">APPX_FOOTPRINT_FILE_TYPE</a></b>
     * 
     * The type of footprint file to be retrieved.
     * @returns {IAppxFile} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfile">IAppxFile</a>**</b>
     * 
     * The file object that corresponds to the footprint file of <i>type</i>.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxpackagereader-getfootprintfile
     */
    GetFootprintFile(type) {
        result := ComCall(4, this, "int", type, "ptr*", &file := 0, "HRESULT")
        return IAppxFile(file)
    }

    /**
     * Retrieves a payload file from the package.
     * @param {PWSTR} fileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the payload file to be retrieved.
     * @returns {IAppxFile} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfile">IAppxFile</a>**</b>
     * 
     * The file object that corresponds to <i>fileName</i>.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxpackagereader-getpayloadfile
     */
    GetPayloadFile(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(5, this, "ptr", fileName, "ptr*", &file := 0, "HRESULT")
        return IAppxFile(file)
    }

    /**
     * Retrieves an enumerator that iterates through the payload files in the package.
     * @returns {IAppxFilesEnumerator} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfilesenumerator">IAppxFilesEnumerator</a>**</b>
     * 
     *  An enumerator over all payload files in the package.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxpackagereader-getpayloadfiles
     */
    GetPayloadFiles() {
        result := ComCall(6, this, "ptr*", &filesEnumerator := 0, "HRESULT")
        return IAppxFilesEnumerator(filesEnumerator)
    }

    /**
     * Retrieves the object model of the app manifest of the package.
     * @returns {IAppxManifestReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestreader">IAppxManifestReader</a>**</b>
     * 
     * The object model of the app manifest.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxpackagereader-getmanifest
     */
    GetManifest() {
        result := ComCall(7, this, "ptr*", &manifestReader := 0, "HRESULT")
        return IAppxManifestReader(manifestReader)
    }
}
