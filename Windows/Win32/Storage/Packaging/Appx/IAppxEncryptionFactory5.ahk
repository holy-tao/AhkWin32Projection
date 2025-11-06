#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxPackageReader.ahk
#Include .\IAppxBundleReader.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxencryptionfactory5
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxEncryptionFactory5 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxEncryptionFactory5
     * @type {Guid}
     */
    static IID => Guid("{68d6e77a-f446-480f-b0f0-d91a24c60746}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateEncryptedPackageReader2", "CreateEncryptedBundleReader2"]

    /**
     * 
     * @param {IStream} inputStream 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {PWSTR} expectedDigest 
     * @returns {IAppxPackageReader} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory5-createencryptedpackagereader2
     */
    CreateEncryptedPackageReader2(inputStream, keyInfo, expectedDigest) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(3, this, "ptr", inputStream, "ptr", keyInfo, "ptr", expectedDigest, "ptr*", &packageReader := 0, "HRESULT")
        return IAppxPackageReader(packageReader)
    }

    /**
     * 
     * @param {IStream} inputStream 
     * @param {Pointer<APPX_KEY_INFO>} keyInfo 
     * @param {PWSTR} expectedDigest 
     * @returns {IAppxBundleReader} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory5-createencryptedbundlereader2
     */
    CreateEncryptedBundleReader2(inputStream, keyInfo, expectedDigest) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(4, this, "ptr", inputStream, "ptr", keyInfo, "ptr", expectedDigest, "ptr*", &bundleReader := 0, "HRESULT")
        return IAppxBundleReader(bundleReader)
    }
}
