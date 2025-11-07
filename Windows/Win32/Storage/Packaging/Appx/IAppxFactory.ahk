#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxPackageWriter.ahk
#Include .\IAppxPackageReader.ahk
#Include .\IAppxManifestReader.ahk
#Include .\IAppxBlockMapReader.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Creates objects for reading and writing app packages.
 * @remarks
 * 
 * The <b>IAppxFactory</b> interface provides factory methods to create readers and writers of app packages as well as methods to create readers for block maps and manifests outside of a package.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxfactory
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxFactory
     * @type {Guid}
     */
    static IID => Guid("{beb94909-e451-438b-b5a7-d79e767b75d8}")

    /**
     * The class identifier for AppxFactory
     * @type {Guid}
     */
    static CLSID => Guid("{5842a140-ff9f-4166-8f5c-62f5b7b0c781}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePackageWriter", "CreatePackageReader", "CreateManifestReader", "CreateBlockMapReader", "CreateValidatedBlockMapReader"]

    /**
     * 
     * @param {IStream} outputStream 
     * @param {Pointer<APPX_PACKAGE_SETTINGS>} settings 
     * @returns {IAppxPackageWriter} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfactory-createpackagewriter
     */
    CreatePackageWriter(outputStream, settings) {
        result := ComCall(3, this, "ptr", outputStream, "ptr", settings, "ptr*", &packageWriter := 0, "HRESULT")
        return IAppxPackageWriter(packageWriter)
    }

    /**
     * 
     * @param {IStream} inputStream 
     * @returns {IAppxPackageReader} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfactory-createpackagereader
     */
    CreatePackageReader(inputStream) {
        result := ComCall(4, this, "ptr", inputStream, "ptr*", &packageReader := 0, "HRESULT")
        return IAppxPackageReader(packageReader)
    }

    /**
     * 
     * @param {IStream} inputStream 
     * @returns {IAppxManifestReader} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfactory-createmanifestreader
     */
    CreateManifestReader(inputStream) {
        result := ComCall(5, this, "ptr", inputStream, "ptr*", &manifestReader := 0, "HRESULT")
        return IAppxManifestReader(manifestReader)
    }

    /**
     * 
     * @param {IStream} inputStream 
     * @returns {IAppxBlockMapReader} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfactory-createblockmapreader
     */
    CreateBlockMapReader(inputStream) {
        result := ComCall(6, this, "ptr", inputStream, "ptr*", &blockMapReader := 0, "HRESULT")
        return IAppxBlockMapReader(blockMapReader)
    }

    /**
     * 
     * @param {IStream} blockMapStream 
     * @param {PWSTR} signatureFileName 
     * @returns {IAppxBlockMapReader} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfactory-createvalidatedblockmapreader
     */
    CreateValidatedBlockMapReader(blockMapStream, signatureFileName) {
        signatureFileName := signatureFileName is String ? StrPtr(signatureFileName) : signatureFileName

        result := ComCall(7, this, "ptr", blockMapStream, "ptr", signatureFileName, "ptr*", &blockMapReader := 0, "HRESULT")
        return IAppxBlockMapReader(blockMapReader)
    }
}
