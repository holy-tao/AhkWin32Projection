#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxPackageReader.ahk
#Include .\IAppxBundleReader.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Creates objects for reading encrypted Windows app packages and bundles.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nn-appxpackaging-iappxencryptionfactory5
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
     * Creates a new instance of IAppxPackageReader for reading encrypted packages, with an optional parameter for specifying the expected digest for the package.
     * @remarks
     * Get the digest string for the *expecteDigest* parameter by calling [IAppxDigestProvider::GetDigest](nf-appxpackaging-iappxdigestprovider-getdigest.md).
     * @param {IStream} inputStream A stream for reading the encrypted package.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for decrypting the package. The base key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @param {PWSTR} expectedDigest An LPCWSTR containing the expected digest, a hashed representation of the package file.
     * @returns {IAppxPackageReader} The created package reader.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxencryptionfactory5-createencryptedpackagereader2
     */
    CreateEncryptedPackageReader2(inputStream, keyInfo, expectedDigest) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(3, this, "ptr", inputStream, "ptr", keyInfo, "ptr", expectedDigest, "ptr*", &packageReader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAppxPackageReader(packageReader)
    }

    /**
     * Creates a read-only bundle object to which encrypted Windows app packages can be added, with an optional parameter for specifying the expected digest for the encrypted bundle.
     * @remarks
     * Get the digest string for the *expecteDigest* parameter by calling [IAppxDigestProvider::GetDigest](nf-appxpackaging-iappxdigestprovider-getdigest.md).
     * @param {IStream} inputStream A stream for reading the encrypted bundle.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for decrypting the bundle. The base key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @param {PWSTR} expectedDigest An LPCWSTR containing the expected digest, a hashed representation of the bundle file.
     * @returns {IAppxBundleReader} The created bundle reader.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxencryptionfactory5-createencryptedbundlereader2
     */
    CreateEncryptedBundleReader2(inputStream, keyInfo, expectedDigest) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(4, this, "ptr", inputStream, "ptr", keyInfo, "ptr", expectedDigest, "ptr*", &bundleReader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAppxBundleReader(bundleReader)
    }
}
