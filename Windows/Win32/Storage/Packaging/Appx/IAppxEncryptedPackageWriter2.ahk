#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\APPX_PACKAGE_WRITER_PAYLOAD_STREAM.ahk" { APPX_PACKAGE_WRITER_PAYLOAD_STREAM }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a write-only object model for encrypted app packages. (IAppxEncryptedPackageWriter2)
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxencryptedpackagewriter2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxEncryptedPackageWriter2 extends IUnknown {
    /**
     * The interface identifier for IAppxEncryptedPackageWriter2
     * @type {Guid}
     */
    static IID := Guid("{3e475447-3a25-40b5-8ad2-f953ae50c92d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxEncryptedPackageWriter2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddPayloadFilesEncrypted : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxEncryptedPackageWriter2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds one or more payload files to an encrypted app package.
     * @param {Integer} fileCount The number of payload files to be added to the encrypted app package.
     * @param {Pointer<APPX_PACKAGE_WRITER_PAYLOAD_STREAM>} payloadFiles The payload files to be added.
     * @param {Integer} memoryLimit The memory limit in bytes.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptedpackagewriter2-addpayloadfilesencrypted
     */
    AddPayloadFilesEncrypted(fileCount, payloadFiles, memoryLimit) {
        result := ComCall(3, this, "uint", fileCount, APPX_PACKAGE_WRITER_PAYLOAD_STREAM.Ptr, payloadFiles, "uint", memoryLimit, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAppxEncryptedPackageWriter2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddPayloadFilesEncrypted := CallbackCreate(GetMethod(implObj, "AddPayloadFilesEncrypted"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddPayloadFilesEncrypted)
    }
}
