#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\APPX_KEY_INFO.ahk" { APPX_KEY_INFO }
#Import ".\APPX_ENCRYPTED_PACKAGE_SETTINGS2.ahk" { APPX_ENCRYPTED_PACKAGE_SETTINGS2 }
#Import ".\APPX_ENCRYPTED_EXEMPTIONS.ahk" { APPX_ENCRYPTED_EXEMPTIONS }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAppxEncryptedPackageWriter.ahk" { IAppxEncryptedPackageWriter }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IAppxEncryptedBundleWriter.ahk" { IAppxEncryptedBundleWriter }

/**
 * Creates objects for encrypting, decrypting, reading, and writing Windows app packages and bundles. (IAppxEncryptionFactory3)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxencryptionfactory3
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxEncryptionFactory3 extends IUnknown {
    /**
     * The interface identifier for IAppxEncryptionFactory3
     * @type {Guid}
     */
    static IID := Guid("{09edca37-cd64-47d6-b7e8-1cb11d4f7e05}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxEncryptionFactory3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EncryptPackage               : IntPtr
        CreateEncryptedPackageWriter : IntPtr
        EncryptBundle                : IntPtr
        CreateEncryptedBundleWriter  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxEncryptionFactory3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an encrypted Windows app package from an unencrypted one. (IAppxEncryptionFactory3.EncryptPackage)
     * @param {IStream} inputStream A readable stream from the app bundle to encrypt.
     * @param {IStream} outputStream A writable stream for writing the resulting encrypted app bundle.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS2>} settings Settings for creating the bundle.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for encrypting the bundle. The base encryption key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles Files exempted from the package writer.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory3-encryptpackage
     */
    EncryptPackage(inputStream, outputStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(3, this, "ptr", inputStream, "ptr", outputStream, APPX_ENCRYPTED_PACKAGE_SETTINGS2.Ptr, settings, APPX_KEY_INFO.Ptr, keyInfo, APPX_ENCRYPTED_EXEMPTIONS.Ptr, exemptedFiles, "HRESULT")
        return result
    }

    /**
     * Creates a new instance of an IAppxEncryptedPackageWriter. (IAppxEncryptionFactory3.CreateEncryptedPackageWriter)
     * @param {IStream} outputStream A writable stream for sending bytes produced by the app package.
     * @param {IStream} manifestStream A readable stream that defines the package for the  AppxManifest.xml.
     * @param {IStream} contentGroupMapStream A stream that defines the content group map.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS2>} settings Settings for creating the package.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for encrypting the package. The base encryption key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles Files exempted from the package writer.
     * @returns {IAppxEncryptedPackageWriter} The package writer object created.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory3-createencryptedpackagewriter
     */
    CreateEncryptedPackageWriter(outputStream, manifestStream, contentGroupMapStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(4, this, "ptr", outputStream, "ptr", manifestStream, "ptr", contentGroupMapStream, APPX_ENCRYPTED_PACKAGE_SETTINGS2.Ptr, settings, APPX_KEY_INFO.Ptr, keyInfo, APPX_ENCRYPTED_EXEMPTIONS.Ptr, exemptedFiles, "ptr*", &packageWriter := 0, "HRESULT")
        return IAppxEncryptedPackageWriter(packageWriter)
    }

    /**
     * Creates an encrypted Windows app bundle from an unencrypted one. (IAppxEncryptionFactory3.EncryptBundle)
     * @param {IStream} inputStream A readable stream from the app bundle to encrypt.
     * @param {IStream} outputStream A writable stream for writing the resulting encrypted app bundle.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS2>} settings Settings for creating the bundle.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for encrypting the bundle. The base encryption key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles Files exempted from the bundle writer.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory3-encryptbundle
     */
    EncryptBundle(inputStream, outputStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(5, this, "ptr", inputStream, "ptr", outputStream, APPX_ENCRYPTED_PACKAGE_SETTINGS2.Ptr, settings, APPX_KEY_INFO.Ptr, keyInfo, APPX_ENCRYPTED_EXEMPTIONS.Ptr, exemptedFiles, "HRESULT")
        return result
    }

    /**
     * Creates a write-only bundle object to which encrypted Windows app packages can be added. (IAppxEncryptionFactory3.CreateEncryptedBundleWriter)
     * @param {IStream} outputStream A writable stream for writing the resulting encrypted app bundle.
     * @param {Integer} bundleVersion The version number of the bundle. If the bundle version is 0, a default version based on the current system time will be generated.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS2>} settings Settings for creating the package.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for decrypting the bundle. The base key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles Files exempted from the bundle writer.
     * @returns {IAppxEncryptedBundleWriter} The bundle writer object created.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory3-createencryptedbundlewriter
     */
    CreateEncryptedBundleWriter(outputStream, bundleVersion, settings, keyInfo, exemptedFiles) {
        result := ComCall(6, this, "ptr", outputStream, "uint", bundleVersion, APPX_ENCRYPTED_PACKAGE_SETTINGS2.Ptr, settings, APPX_KEY_INFO.Ptr, keyInfo, APPX_ENCRYPTED_EXEMPTIONS.Ptr, exemptedFiles, "ptr*", &bundleWriter := 0, "HRESULT")
        return IAppxEncryptedBundleWriter(bundleWriter)
    }

    Query(iid) {
        if (IAppxEncryptionFactory3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EncryptPackage := CallbackCreate(GetMethod(implObj, "EncryptPackage"), flags, 6)
        this.vtbl.CreateEncryptedPackageWriter := CallbackCreate(GetMethod(implObj, "CreateEncryptedPackageWriter"), flags, 8)
        this.vtbl.EncryptBundle := CallbackCreate(GetMethod(implObj, "EncryptBundle"), flags, 6)
        this.vtbl.CreateEncryptedBundleWriter := CallbackCreate(GetMethod(implObj, "CreateEncryptedBundleWriter"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EncryptPackage)
        CallbackFree(this.vtbl.CreateEncryptedPackageWriter)
        CallbackFree(this.vtbl.EncryptBundle)
        CallbackFree(this.vtbl.CreateEncryptedBundleWriter)
    }
}
