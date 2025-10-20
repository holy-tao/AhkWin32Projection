#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IAppxBlockMapReader>} blockMapReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackagereader-getblockmap
     */
    GetBlockMap(blockMapReader) {
        result := ComCall(3, this, "ptr*", blockMapReader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<IAppxFile>} file 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackagereader-getfootprintfile
     */
    GetFootprintFile(type, file) {
        result := ComCall(4, this, "int", type, "ptr*", file, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {Pointer<IAppxFile>} file 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackagereader-getpayloadfile
     */
    GetPayloadFile(fileName, file) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(5, this, "ptr", fileName, "ptr*", file, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAppxFilesEnumerator>} filesEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackagereader-getpayloadfiles
     */
    GetPayloadFiles(filesEnumerator) {
        result := ComCall(6, this, "ptr*", filesEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAppxManifestReader>} manifestReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackagereader-getmanifest
     */
    GetManifest(manifestReader) {
        result := ComCall(7, this, "ptr*", manifestReader, "HRESULT")
        return result
    }
}
