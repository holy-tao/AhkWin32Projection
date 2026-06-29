#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\APPX_KEY_INFO.ahk" { APPX_KEY_INFO }
#Import ".\APPX_ENCRYPTED_PACKAGE_SETTINGS.ahk" { APPX_ENCRYPTED_PACKAGE_SETTINGS }
#Import ".\APPX_ENCRYPTED_EXEMPTIONS.ahk" { APPX_ENCRYPTED_EXEMPTIONS }
#Import ".\IAppxEncryptedPackageWriter.ahk" { IAppxEncryptedPackageWriter }
#Import ".\IAppxBundleReader.ahk" { IAppxBundleReader }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import ".\IAppxPackageReader.ahk" { IAppxPackageReader }
#Import ".\IAppxEncryptedBundleWriter.ahk" { IAppxEncryptedBundleWriter }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Creates objects for encrypting, decrypting, reading, and writing packages and bundles.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxencryptionfactory
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxEncryptionFactory extends IUnknown {
    /**
     * The interface identifier for IAppxEncryptionFactory
     * @type {Guid}
     */
    static IID := Guid("{80e8e04d-8c88-44ae-a011-7cadf6fb2e72}")

    /**
     * The class identifier for AppxEncryptionFactory
     * @type {Guid}
     */
    static CLSID := Guid("{dc664fdd-d868-46ee-8780-8d196cb739f7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxEncryptionFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EncryptPackage               : IntPtr
        DecryptPackage               : IntPtr
        CreateEncryptedPackageWriter : IntPtr
        CreateEncryptedPackageReader : IntPtr
        EncryptBundle                : IntPtr
        DecryptBundle                : IntPtr
        CreateEncryptedBundleWriter  : IntPtr
        CreateEncryptedBundleReader  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxEncryptionFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an encrypted Windows app package from an unencrypted one. (IAppxEncryptionFactory.EncryptPackage)
     * @param {IStream} inputStream A readable stream from the app package to be encrypted.
     * @param {IStream} outputStream A writable stream for writing the resulting encrypted app package.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings Settings for creating the package.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key information containing the base encryption key and key ID. The base key is used to derive the per file encryption keys. If the base key is null, the global test key and key Id are used.
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles The list of files to be exempted from encryption.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory-encryptpackage
     */
    EncryptPackage(inputStream, outputStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(3, this, "ptr", inputStream, "ptr", outputStream, APPX_ENCRYPTED_PACKAGE_SETTINGS.Ptr, settings, APPX_KEY_INFO.Ptr, keyInfo, APPX_ENCRYPTED_EXEMPTIONS.Ptr, exemptedFiles, "HRESULT")
        return result
    }

    /**
     * Creates an unencrypted Windows app package from an encrypted one.
     * @param {IStream} inputStream A readable stream from the app package to be decrypted.
     * @param {IStream} outputStream A writable stream for writing the resulting decrypted app package.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for decrypting the package. The base encryption key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory-decryptpackage
     */
    DecryptPackage(inputStream, outputStream, keyInfo) {
        result := ComCall(4, this, "ptr", inputStream, "ptr", outputStream, APPX_KEY_INFO.Ptr, keyInfo, "HRESULT")
        return result
    }

    /**
     * Creates a new instance of an IAppxEncryptedPackageWriter. (IAppxEncryptionFactory.CreateEncryptedPackageWriter)
     * @param {IStream} outputStream A writable stream for sending bytes produced by the app package.
     * @param {IStream} manifestStream A readable stream that defines the package for the  AppxManifest.xml.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings Settings for creating the package.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for encrypting the package. The base encryption key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles The list of files to be exempted from encryption.
     * @returns {IAppxEncryptedPackageWriter} The package writer object created.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory-createencryptedpackagewriter
     */
    CreateEncryptedPackageWriter(outputStream, manifestStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(5, this, "ptr", outputStream, "ptr", manifestStream, APPX_ENCRYPTED_PACKAGE_SETTINGS.Ptr, settings, APPX_KEY_INFO.Ptr, keyInfo, APPX_ENCRYPTED_EXEMPTIONS.Ptr, exemptedFiles, "ptr*", &packageWriter := 0, "HRESULT")
        return IAppxEncryptedPackageWriter(packageWriter)
    }

    /**
     * Creates a new instance of IAppxPackageReader for reading encrypted packages.
     * @param {IStream} inputStream A readable stream from the app package.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for encrypting the package. The base encryption key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @returns {IAppxPackageReader} The package reader object created.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory-createencryptedpackagereader
     */
    CreateEncryptedPackageReader(inputStream, keyInfo) {
        result := ComCall(6, this, "ptr", inputStream, APPX_KEY_INFO.Ptr, keyInfo, "ptr*", &packageReader := 0, "HRESULT")
        return IAppxPackageReader(packageReader)
    }

    /**
     * Creates an encrypted Windows app bundle from an unencrypted one. (IAppxEncryptionFactory.EncryptBundle)
     * @param {IStream} inputStream A readable stream from the app bundle to encrypt.
     * @param {IStream} outputStream A writable stream for writing the resulting encrypted app bundle.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings Settings for creating the bundle.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for encrypting the bundle. The base encryption key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles The list of files to be exempted from encryption.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory-encryptbundle
     */
    EncryptBundle(inputStream, outputStream, settings, keyInfo, exemptedFiles) {
        result := ComCall(7, this, "ptr", inputStream, "ptr", outputStream, APPX_ENCRYPTED_PACKAGE_SETTINGS.Ptr, settings, APPX_KEY_INFO.Ptr, keyInfo, APPX_ENCRYPTED_EXEMPTIONS.Ptr, exemptedFiles, "HRESULT")
        return result
    }

    /**
     * Creates an unencrypted Windows app bundle from an encrypted one.
     * @param {IStream} inputStream A readable stream from the app bundle to be decrypted.
     * @param {IStream} outputStream A validation stream for writing the resulting decrypted app bundle.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for decrypting the bundle. The base key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory-decryptbundle
     */
    DecryptBundle(inputStream, outputStream, keyInfo) {
        result := ComCall(8, this, "ptr", inputStream, "ptr", outputStream, APPX_KEY_INFO.Ptr, keyInfo, "HRESULT")
        return result
    }

    /**
     * Creates a write-only bundle object to which encrypted Windows app packages can be added. (IAppxEncryptionFactory.CreateEncryptedBundleWriter)
     * @param {IStream} outputStream A writable stream for writing the resulting encrypted app bundle.
     * @param {Integer} bundleVersion The version number of the bundle. If the bundle version is 0, a default version based on the current system time will be generated.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS>} settings Settings for creating the package.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for decrypting the bundle. The base key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles The list of files to be exempted from encryption.
     * @returns {IAppxEncryptedBundleWriter} The bundle writer object created.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory-createencryptedbundlewriter
     */
    CreateEncryptedBundleWriter(outputStream, bundleVersion, settings, keyInfo, exemptedFiles) {
        result := ComCall(9, this, "ptr", outputStream, "uint", bundleVersion, APPX_ENCRYPTED_PACKAGE_SETTINGS.Ptr, settings, APPX_KEY_INFO.Ptr, keyInfo, APPX_ENCRYPTED_EXEMPTIONS.Ptr, exemptedFiles, "ptr*", &bundleWriter := 0, "HRESULT")
        return IAppxEncryptedBundleWriter(bundleWriter)
    }

    /**
     * Creates a read-only bundle object to which encrypted Windows app packages can be added.
     * @param {IStream} inputStream A stream for reading the encrypted bundle.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for decrypting the bundle. The base key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @returns {IAppxBundleReader} The bundle reader object created.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory-createencryptedbundlereader
     */
    CreateEncryptedBundleReader(inputStream, keyInfo) {
        result := ComCall(10, this, "ptr", inputStream, APPX_KEY_INFO.Ptr, keyInfo, "ptr*", &bundleReader := 0, "HRESULT")
        return IAppxBundleReader(bundleReader)
    }

    Query(iid) {
        if (IAppxEncryptionFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EncryptPackage := CallbackCreate(GetMethod(implObj, "EncryptPackage"), flags, 6)
        this.vtbl.DecryptPackage := CallbackCreate(GetMethod(implObj, "DecryptPackage"), flags, 4)
        this.vtbl.CreateEncryptedPackageWriter := CallbackCreate(GetMethod(implObj, "CreateEncryptedPackageWriter"), flags, 7)
        this.vtbl.CreateEncryptedPackageReader := CallbackCreate(GetMethod(implObj, "CreateEncryptedPackageReader"), flags, 4)
        this.vtbl.EncryptBundle := CallbackCreate(GetMethod(implObj, "EncryptBundle"), flags, 6)
        this.vtbl.DecryptBundle := CallbackCreate(GetMethod(implObj, "DecryptBundle"), flags, 4)
        this.vtbl.CreateEncryptedBundleWriter := CallbackCreate(GetMethod(implObj, "CreateEncryptedBundleWriter"), flags, 7)
        this.vtbl.CreateEncryptedBundleReader := CallbackCreate(GetMethod(implObj, "CreateEncryptedBundleReader"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EncryptPackage)
        CallbackFree(this.vtbl.DecryptPackage)
        CallbackFree(this.vtbl.CreateEncryptedPackageWriter)
        CallbackFree(this.vtbl.CreateEncryptedPackageReader)
        CallbackFree(this.vtbl.EncryptBundle)
        CallbackFree(this.vtbl.DecryptBundle)
        CallbackFree(this.vtbl.CreateEncryptedBundleWriter)
        CallbackFree(this.vtbl.CreateEncryptedBundleReader)
    }
}
