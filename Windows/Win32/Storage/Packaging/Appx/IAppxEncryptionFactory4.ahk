#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\APPX_KEY_INFO.ahk" { APPX_KEY_INFO }
#Import ".\APPX_ENCRYPTED_PACKAGE_SETTINGS2.ahk" { APPX_ENCRYPTED_PACKAGE_SETTINGS2 }
#Import ".\APPX_ENCRYPTED_EXEMPTIONS.ahk" { APPX_ENCRYPTED_EXEMPTIONS }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Creates objects for encrypting Windows app packages and bundles.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxencryptionfactory4
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxEncryptionFactory4 extends IUnknown {
    /**
     * The interface identifier for IAppxEncryptionFactory4
     * @type {Guid}
     */
    static IID := Guid("{a879611f-12fd-41fe-85d5-06ae779bbaf5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxEncryptionFactory4 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EncryptPackage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxEncryptionFactory4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an encrypted Windows app package from an unencrypted one. (IAppxEncryptionFactory4.EncryptPackage)
     * @param {IStream} inputStream A readable stream from the app bundle to encrypt.
     * @param {IStream} outputStream A writable stream for writing the resulting encrypted app bundle.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS2>} settings Settings for creating the bundle.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo Key info containing the base encryption key and key ID for encrypting the bundle. The base encryption key is used to derive the per file encryption keys. If this parameter is null, the global test key and key ID are used.
     * @param {Pointer<APPX_ENCRYPTED_EXEMPTIONS>} exemptedFiles Files exempted from the package writer.
     * @param {Integer} memoryLimit The memory limit in bytes.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptionfactory4-encryptpackage
     */
    EncryptPackage(inputStream, outputStream, settings, keyInfo, exemptedFiles, memoryLimit) {
        result := ComCall(3, this, "ptr", inputStream, "ptr", outputStream, APPX_ENCRYPTED_PACKAGE_SETTINGS2.Ptr, settings, APPX_KEY_INFO.Ptr, keyInfo, APPX_ENCRYPTED_EXEMPTIONS.Ptr, exemptedFiles, "uint", memoryLimit, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAppxEncryptionFactory4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EncryptPackage := CallbackCreate(GetMethod(implObj, "EncryptPackage"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EncryptPackage)
    }
}
