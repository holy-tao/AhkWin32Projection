#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a write-only object model for encrypted bundle packages. (IAppxEncryptedBundleWriter)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxencryptedbundlewriter
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxEncryptedBundleWriter extends IUnknown {
    /**
     * The interface identifier for IAppxEncryptedBundleWriter
     * @type {Guid}
     */
    static IID := Guid("{80b0902f-7bf0-4117-b8c6-4279ef81ee77}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxEncryptedBundleWriter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddPayloadPackageEncrypted : IntPtr
        Close                      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxEncryptedBundleWriter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Encrypts a new payload package to the bundle. (IAppxEncryptedBundleWriter.AddPayloadPackageEncrypted)
     * @param {PWSTR} fileName The name of the payload file. The file name path must be relative to the root of the package.
     * @param {IStream} packageStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of <i>fileName</i>.
     *           The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptedbundlewriter-addpayloadpackageencrypted
     */
    AddPayloadPackageEncrypted(fileName, packageStream) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(3, this, "ptr", fileName, "ptr", packageStream, "HRESULT")
        return result
    }

    /**
     * Writes the bundle manifest and blockmap footprint files to the bundle.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptedbundlewriter-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAppxEncryptedBundleWriter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddPayloadPackageEncrypted := CallbackCreate(GetMethod(implObj, "AddPayloadPackageEncrypted"), flags, 3)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddPayloadPackageEncrypted)
        CallbackFree(this.vtbl.Close)
    }
}
