#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a write-only object model for encrypted bundle packages. (IAppxEncryptedBundleWriter3)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxencryptedbundlewriter3
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxEncryptedBundleWriter3 extends IUnknown {
    /**
     * The interface identifier for IAppxEncryptedBundleWriter3
     * @type {Guid}
     */
    static IID := Guid("{0d34deb3-5cae-4dd3-977c-504932a51d31}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxEncryptedBundleWriter3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddPayloadPackageEncrypted  : IntPtr
        AddExternalPackageReference : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxEncryptedBundleWriter3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Encrypts a new payload package to the bundle. (IAppxEncryptedBundleWriter3.AddPayloadPackageEncrypted)
     * @param {PWSTR} fileName The name of the payload file. The file name path must be relative to the root of the package.
     * @param {IStream} packageStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of <i>fileName</i>.
     * @param {BOOL} isDefaultApplicablePackage A flag for whether this package is a default applicable package.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptedbundlewriter3-addpayloadpackageencrypted
     */
    AddPayloadPackageEncrypted(fileName, packageStream, isDefaultApplicablePackage) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(3, this, "ptr", fileName, "ptr", packageStream, BOOL, isDefaultApplicablePackage, "HRESULT")
        return result
    }

    /**
     * Adds a reference within the encrypted package bundle to an external app package. (IAppxEncryptedBundleWriter3.AddExternalPackageReference)
     * @param {PWSTR} fileName The name of the payload file. The file name path must be relative to the root of the package.
     * @param {IStream} inputStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of <i>fileName</i>.
     * @param {BOOL} isDefaultApplicablePackage A flag for whether this package is a default applicable package.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptedbundlewriter3-addexternalpackagereference
     */
    AddExternalPackageReference(fileName, inputStream, isDefaultApplicablePackage) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(4, this, "ptr", fileName, "ptr", inputStream, BOOL, isDefaultApplicablePackage, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAppxEncryptedBundleWriter3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddPayloadPackageEncrypted := CallbackCreate(GetMethod(implObj, "AddPayloadPackageEncrypted"), flags, 4)
        this.vtbl.AddExternalPackageReference := CallbackCreate(GetMethod(implObj, "AddExternalPackageReference"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddPayloadPackageEncrypted)
        CallbackFree(this.vtbl.AddExternalPackageReference)
    }
}
