#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxFile.ahk
#Include .\IAppxBlockMapReader.ahk
#Include .\IAppxBundleManifestReader.ahk
#Include .\IAppxFilesEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a read-only object model for bundle packages.
 * @remarks
 * 
 * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxbundlefactory-createbundlereader">CreateBundleReader</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxbundlefactory">IAppxBundleFactory</a> interface to retrieve the <b>IAppxBundleReader</b> object. 
 * 
 * Through <b>IAppxBundleReader</b>, you can retrieve both footprint files, such as the bundle’s manifest, block map, and signature, and app packages that are contained in the bundle.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxbundlereader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleReader
     * @type {Guid}
     */
    static IID => Guid("{dd75b8c0-ba76-43b0-ae0f-68656a1dc5c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFootprintFile", "GetBlockMap", "GetManifest", "GetPayloadPackages", "GetPayloadPackage"]

    /**
     * Retrieves the specified type of footprint file from the bundle.
     * @param {Integer} fileType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_bundle_footprint_file_type">APPX_BUNDLE_FOOTPRINT_FILE_TYPE</a></b>
     * 
     * The type of footprint file to be retrieved.
     * @returns {IAppxFile} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfile">IAppxFile</a>**</b>
     * 
     * The file object that corresponds to the footprint file of <i>fileType</i>.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlereader-getfootprintfile
     */
    GetFootprintFile(fileType) {
        result := ComCall(3, this, "int", fileType, "ptr*", &footprintFile := 0, "HRESULT")
        return IAppxFile(footprintFile)
    }

    /**
     * Retrieves a read-only block map object from the bundle.
     * @returns {IAppxBlockMapReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxblockmapreader">IAppxBlockMapReader</a>**</b>
     * 
     * The object model of the block map of a package in the bundle.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlereader-getblockmap
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
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlereader-getmanifest
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
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlereader-getpayloadpackages
     */
    GetPayloadPackages() {
        result := ComCall(6, this, "ptr*", &payloadPackages := 0, "HRESULT")
        return IAppxFilesEnumerator(payloadPackages)
    }

    /**
     * Retrieves an appx file object for the payload package with the specified file name.
     * @param {PWSTR} fileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the payload file to be retrieved.
     * @returns {IAppxFile} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfile">IAppxFile</a>**</b>
     * 
     * The payload file object the that corresponds to <i>fileName</i>.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlereader-getpayloadpackage
     */
    GetPayloadPackage(fileName) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(7, this, "ptr", fileName, "ptr*", &payloadPackage := 0, "HRESULT")
        return IAppxFile(payloadPackage)
    }
}
