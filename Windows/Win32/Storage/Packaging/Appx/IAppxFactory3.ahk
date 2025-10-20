#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxFactory3 extends IUnknown{
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
     * 
     * @param {Pointer<IStream>} inputStream 
     * @param {PWSTR} expectedDigest 
     * @param {Pointer<IAppxPackageReader>} packageReader 
     * @returns {HRESULT} 
     */
    CreatePackageReader2(inputStream, expectedDigest, packageReader) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(3, this, "ptr", inputStream, "ptr", expectedDigest, "ptr", packageReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} inputStream 
     * @param {PWSTR} expectedDigest 
     * @param {Pointer<IAppxManifestReader>} manifestReader 
     * @returns {HRESULT} 
     */
    CreateManifestReader2(inputStream, expectedDigest, manifestReader) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(4, this, "ptr", inputStream, "ptr", expectedDigest, "ptr", manifestReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} inputStream 
     * @param {PWSTR} expectedDigest 
     * @param {Pointer<IAppxAppInstallerReader>} appInstallerReader 
     * @returns {HRESULT} 
     */
    CreateAppInstallerReader(inputStream, expectedDigest, appInstallerReader) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(5, this, "ptr", inputStream, "ptr", expectedDigest, "ptr", appInstallerReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
