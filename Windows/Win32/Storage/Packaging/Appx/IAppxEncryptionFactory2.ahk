#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\APPX_KEY_INFO.ahk" { APPX_KEY_INFO }
#Import ".\APPX_ENCRYPTED_EXEMPTIONS.ahk" { APPX_ENCRYPTED_EXEMPTIONS }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import ".\APPX_ENCRYPTED_PACKAGE_SETTINGS.ahk" { APPX_ENCRYPTED_PACKAGE_SETTINGS }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxEncryptedPackageWriter.ahk" { IAppxEncryptedPackageWriter }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Creates objects for encrypting, decrypting, reading, and writing Windows app packages and bundles. (IAppxEncryptionFactory2)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxencryptionfactory2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxEncryptionFactory2 extends IUnknown {
    /**
     * The interface identifier for IAppxEncryptionFactory2
     * @type {Guid}
     */
    static IID := Guid("{c1b11eee-c4ba-4ab2-a55d-d015fe8ff64f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxEncryptionFactory2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateEncryptedPackageWriter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxEncryptionFactory2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new instance of an IAppxEncryptedPackageWriter. (IAppxEncryptionFactory2.CreateEncryptedPackageWriter)
     * @param {IStream} outputStream A writable stream for sending bytes produced by the app package.
     * @param {IStream} manifestStream A readable stream that defines the package for the  AppxManifest.xml.
     * @param {IStream} contentGroupMapStream A stream that defines the content group map.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings Settings for creating the package.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for encrypting the package. The base encryption key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles Files exempted from the package writer.
     * @returns {IAppxEncryptedPackageWriter} The package writer object created.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory2-createencryptedpackagewriter
     */
    CreateEncryptedPackageWriter(outputStream, manifestStream, contentGroupMapStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(3, this, "ptr", outputStream, "ptr", manifestStream, "ptr", contentGroupMapStream, APPX_ENCRYPTED_PACKAGE_SETTINGS.Ptr, settings, APPX_KEY_INFO.Ptr, keyInfo, APPX_ENCRYPTED_EXEMPTIONS.Ptr, exemptedFiles, "ptr*", &packageWriter := 0, "HRESULT")
        return IAppxEncryptedPackageWriter(packageWriter)
    }

    Query(iid) {
        if (IAppxEncryptionFactory2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateEncryptedPackageWriter := CallbackCreate(GetMethod(implObj, "CreateEncryptedPackageWriter"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateEncryptedPackageWriter)
    }
}
