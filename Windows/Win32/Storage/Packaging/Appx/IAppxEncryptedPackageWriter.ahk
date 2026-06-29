#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\APPX_COMPRESSION_OPTION.ahk" { APPX_COMPRESSION_OPTION }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a write-only object model for encrypted app packages. (IAppxEncryptedPackageWriter)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxencryptedpackagewriter
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxEncryptedPackageWriter extends IUnknown {
    /**
     * The interface identifier for IAppxEncryptedPackageWriter
     * @type {Guid}
     */
    static IID := Guid("{f43d0b0b-1379-40e2-9b29-682ea2bf42af}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxEncryptedPackageWriter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddPayloadFileEncrypted : IntPtr
        Close                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxEncryptedPackageWriter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a new encrypted payload file to the appx package.
     * @param {PWSTR} fileName The name of the payload file. The file name path must be relative to the root of the package.
     * @param {APPX_COMPRESSION_OPTION} compressionOption The type of compression to use  to store <i>fileName</i> in the package.
     * @param {IStream} inputStream An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> providing the contents of <i>fileName</i>.
     *           The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptedpackagewriter-addpayloadfileencrypted
     */
    AddPayloadFileEncrypted(fileName, compressionOption, inputStream) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(3, this, "ptr", fileName, APPX_COMPRESSION_OPTION, compressionOption, "ptr", inputStream, "HRESULT")
        return result
    }

    /**
     * Closes and finalizes the written package stream.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptedpackagewriter-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAppxEncryptedPackageWriter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddPayloadFileEncrypted := CallbackCreate(GetMethod(implObj, "AddPayloadFileEncrypted"), flags, 4)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddPayloadFileEncrypted)
        CallbackFree(this.vtbl.Close)
    }
}
