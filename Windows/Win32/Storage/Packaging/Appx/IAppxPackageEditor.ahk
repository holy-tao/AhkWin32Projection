#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\APPX_KEY_INFO.ahk" { APPX_KEY_INFO }
#Import ".\APPX_ENCRYPTED_PACKAGE_SETTINGS2.ahk" { APPX_ENCRYPTED_PACKAGE_SETTINGS2 }
#Import ".\APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTIONS.ahk" { APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTIONS }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION.ahk" { APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides functionality to edit app packages.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxpackageeditor
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxPackageEditor extends IUnknown {
    /**
     * The interface identifier for IAppxPackageEditor
     * @type {Guid}
     */
    static IID := Guid("{e2adb6dc-5e71-4416-86b6-86e5f5291a6b}")

    /**
     * The class identifier for AppxPackageEditor
     * @type {Guid}
     */
    static CLSID := Guid("{f004f2ca-aebc-4b0d-bf58-e516d5bcc0ab}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxPackageEditor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetWorkingDirectory                     : IntPtr
        CreateDeltaPackage                      : IntPtr
        CreateDeltaPackageUsingBaselineBlockMap : IntPtr
        UpdatePackage                           : IntPtr
        UpdateEncryptedPackage                  : IntPtr
        UpdatePackageManifest                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxPackageEditor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} workingDirectory 
     * @returns {HRESULT} 
     */
    SetWorkingDirectory(workingDirectory) {
        workingDirectory := workingDirectory is String ? StrPtr(workingDirectory) : workingDirectory

        result := ComCall(3, this, "ptr", workingDirectory, "HRESULT")
        return result
    }

    /**
     * Creates a delta package from the differences in the updated package and the baseline package.
     * @param {IStream} updatedPackageStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of the updated app package.
     * @param {IStream} baselinePackageStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of the baseline app package.
     * @param {IStream} deltaPackageStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of the delta (difference) app package.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackageeditor-createdeltapackage
     */
    CreateDeltaPackage(updatedPackageStream, baselinePackageStream, deltaPackageStream) {
        result := ComCall(4, this, "ptr", updatedPackageStream, "ptr", baselinePackageStream, "ptr", deltaPackageStream, "HRESULT")
        return result
    }

    /**
     * Creates a delta package from the differences in the updated package and the baseline block map.
     * @param {IStream} updatedPackageStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of the updated app package.
     * @param {IStream} baselineBlockMapStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of the baseline block map.
     * @param {PWSTR} baselinePackageFullName The full name of the baseline app package.
     * @param {IStream} deltaPackageStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of the delta (difference) app package.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackageeditor-createdeltapackageusingbaselineblockmap
     */
    CreateDeltaPackageUsingBaselineBlockMap(updatedPackageStream, baselineBlockMapStream, baselinePackageFullName, deltaPackageStream) {
        baselinePackageFullName := baselinePackageFullName is String ? StrPtr(baselinePackageFullName) : baselinePackageFullName

        result := ComCall(5, this, "ptr", updatedPackageStream, "ptr", baselineBlockMapStream, "ptr", baselinePackageFullName, "ptr", deltaPackageStream, "HRESULT")
        return result
    }

    /**
     * Updates an app package.
     * @param {IStream} baselinePackageStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of the baseline app package.
     * @param {IStream} deltaPackageStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of the delta (difference) app package.
     * @param {APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION} updateOption The update options.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackageeditor-updatepackage
     */
    UpdatePackage(baselinePackageStream, deltaPackageStream, updateOption) {
        result := ComCall(6, this, "ptr", baselinePackageStream, "ptr", deltaPackageStream, APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION, updateOption, "HRESULT")
        return result
    }

    /**
     * Updates an encrypted app package.
     * @param {IStream} baselineEncryptedPackageStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of the baseline encrypted app package.
     * @param {IStream} deltaPackageStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of the delta (difference) app package.
     * @param {APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION} updateOption The update options.
     * @param {Pointer<APPX_ENCRYPTED_PACKAGE_SETTINGS2>} settings The encrypted app package settings.
     * @param {Pointer<APPX_KEY_INFO>} keyInfo App package key information.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackageeditor-updateencryptedpackage
     */
    UpdateEncryptedPackage(baselineEncryptedPackageStream, deltaPackageStream, updateOption, settings, keyInfo) {
        result := ComCall(7, this, "ptr", baselineEncryptedPackageStream, "ptr", deltaPackageStream, APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_OPTION, updateOption, APPX_ENCRYPTED_PACKAGE_SETTINGS2.Ptr, settings, APPX_KEY_INFO.Ptr, keyInfo, "HRESULT")
        return result
    }

    /**
     * Updates an app package manifest.
     * @param {IStream} packageStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of the app package associated with the manifest to be updated.
     * @param {IStream} updatedManifestStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of the updated app package manifest.
     * @param {BOOL} isPackageEncrypted Flag to specify whether the package is encrypted.
     * @param {APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTIONS} options Options for app package manifest validation.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackageeditor-updatepackagemanifest
     */
    UpdatePackageManifest(packageStream, updatedManifestStream, isPackageEncrypted, options) {
        result := ComCall(8, this, "ptr", packageStream, "ptr", updatedManifestStream, BOOL, isPackageEncrypted, APPX_PACKAGE_EDITOR_UPDATE_PACKAGE_MANIFEST_OPTIONS, options, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAppxPackageEditor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetWorkingDirectory := CallbackCreate(GetMethod(implObj, "SetWorkingDirectory"), flags, 2)
        this.vtbl.CreateDeltaPackage := CallbackCreate(GetMethod(implObj, "CreateDeltaPackage"), flags, 4)
        this.vtbl.CreateDeltaPackageUsingBaselineBlockMap := CallbackCreate(GetMethod(implObj, "CreateDeltaPackageUsingBaselineBlockMap"), flags, 5)
        this.vtbl.UpdatePackage := CallbackCreate(GetMethod(implObj, "UpdatePackage"), flags, 4)
        this.vtbl.UpdateEncryptedPackage := CallbackCreate(GetMethod(implObj, "UpdateEncryptedPackage"), flags, 6)
        this.vtbl.UpdatePackageManifest := CallbackCreate(GetMethod(implObj, "UpdatePackageManifest"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetWorkingDirectory)
        CallbackFree(this.vtbl.CreateDeltaPackage)
        CallbackFree(this.vtbl.CreateDeltaPackageUsingBaselineBlockMap)
        CallbackFree(this.vtbl.UpdatePackage)
        CallbackFree(this.vtbl.UpdateEncryptedPackage)
        CallbackFree(this.vtbl.UpdatePackageManifest)
    }
}
