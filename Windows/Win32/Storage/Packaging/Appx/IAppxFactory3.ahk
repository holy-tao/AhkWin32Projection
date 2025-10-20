#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxfactory3
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxFactory3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxFactory3
     * @type {Guid}
     */
    static IID => Guid("{776b2c05-e21d-4e24-ba1a-cd529a8bfdbb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePackageReader2", "CreateManifestReader2", "CreateAppInstallerReader"]

    /**
     * 
     * @param {IStream} inputStream 
     * @param {PWSTR} expectedDigest 
     * @param {Pointer<IAppxPackageReader>} packageReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfactory3-createpackagereader2
     */
    CreatePackageReader2(inputStream, expectedDigest, packageReader) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(3, this, "ptr", inputStream, "ptr", expectedDigest, "ptr*", packageReader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} inputStream 
     * @param {PWSTR} expectedDigest 
     * @param {Pointer<IAppxManifestReader>} manifestReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfactory3-createmanifestreader2
     */
    CreateManifestReader2(inputStream, expectedDigest, manifestReader) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(4, this, "ptr", inputStream, "ptr", expectedDigest, "ptr*", manifestReader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} inputStream 
     * @param {PWSTR} expectedDigest 
     * @param {Pointer<IAppxAppInstallerReader>} appInstallerReader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfactory3-createappinstallerreader
     */
    CreateAppInstallerReader(inputStream, expectedDigest, appInstallerReader) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(5, this, "ptr", inputStream, "ptr", expectedDigest, "ptr*", appInstallerReader, "HRESULT")
        return result
    }
}
