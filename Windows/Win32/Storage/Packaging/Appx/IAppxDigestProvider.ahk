#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides APIs for retrieving the digest string representation of an app packaging object.
 * @remarks
 * The **IAppxDigestProvider** interface can be obtained by calling **QueryInterface** on the objects returned by the following factory interfaces, as well as the corresponding methods in different versions of the factory interfaces, such as [IAppxFactory::CreatePackageReader](nf-appxpackaging-iappxfactory-createpackagereader.md): 
 * 
 * - [IAppxEncryptionFactory5](nn-appxpackaging-iappxencryptionfactory4.md)
 * - [IAppxBundleFactory2](nn-appxpackaging-iappxbundlefactory2.md)
 * - [IAppxFactory3](nn-appxpackaging-iappxfactory3.md)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxdigestprovider
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxDigestProvider extends IUnknown {
    /**
     * The interface identifier for IAppxDigestProvider
     * @type {Guid}
     */
    static IID := Guid("{9fe2702b-7640-4659-8e6c-349e43c4cdbd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxDigestProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDigest : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxDigestProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxdigestprovider-getdigest
     */
    GetDigest() {
        result := ComCall(3, this, PWSTR.Ptr, &digest := 0, "HRESULT")
        return digest
    }

    Query(iid) {
        if (IAppxDigestProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDigest := CallbackCreate(GetMethod(implObj, "GetDigest"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDigest)
    }
}
