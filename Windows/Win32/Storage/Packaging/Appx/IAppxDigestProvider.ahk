#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides APIs for retrieving the digest string representation of an app packaging object.
 * @remarks
 * The **IAppxDigestProvider** interface can be obtained by calling **QueryInterface** on the objects returned by the following factory interfaces, as well as the corresponding methods in different versions of the factory interfaces, such as [IAppxFactory::CreatePackageReader](nf-appxpackaging-iappxfactory-createpackagereader.md): 
 * 
 * - [IAppxEncryptionFactory5](nn-appxpackaging-iappxencryptionfactory4.md)
 * - [IAppxBundleFactory2](nn-appxpackaging-iappxbundlefactory2.md)
 * - [IAppxFactory3](nn-appxpackaging-iappxfactory3.md)
 * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nn-appxpackaging-iappxdigestprovider
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxDigestProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxDigestProvider
     * @type {Guid}
     */
    static IID => Guid("{9fe2702b-7640-4659-8e6c-349e43c4cdbd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDigest"]

    /**
     * Receives a pointer to an LPWSTR containing the digest representation of the app packaging object object managed by the associated interface.
     * @remarks
     * A digest string is a hashed representation of the contents of the associated object that can be used to verify that the contents of the object haven't changed between operations.
     * 
     * The **IAppxDigestProvider** interface can be obtained by calling **QueryInterface** on the objects returned by the following factory interfaces, as well as the corresponding methods in different versions of the factory interfaces, such as [IAppxFactory::CreatePackageReader](nf-appxpackaging-iappxfactory-createpackagereader.md): 
     * 
     * - [IAppxEncryptionFactory5](nn-appxpackaging-iappxencryptionfactory4.md)
     * - [IAppxBundleFactory2](nn-appxpackaging-iappxbundlefactory2.md)
     * - [IAppxFactory3](nn-appxpackaging-iappxfactory3.md)
     * @returns {PWSTR} Receives a pointer to an LPWSTR containing the digest representation of the app packaging object object managed by the associated interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxdigestprovider-getdigest
     */
    GetDigest() {
        result := ComCall(3, this, "ptr*", &digest := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return digest
    }
}
