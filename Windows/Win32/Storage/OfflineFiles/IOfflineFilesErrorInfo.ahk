#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\BYTE_BLOB.ahk" { BYTE_BLOB }

/**
 * Provides a text description and raw data block associated with an error.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefileserrorinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesErrorInfo extends IUnknown {
    /**
     * The interface identifier for IOfflineFilesErrorInfo
     * @type {Guid}
     */
    static IID := Guid("{7112fa5f-7571-435a-8eb7-195c7c1429bc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesErrorInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRawData     : IntPtr
        GetDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesErrorInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a block of bytes containing internal data associated with the error.
     * @remarks
     * The BYTE_BLOB structure is defined in Wtypes.h.
     * @returns {Pointer<BYTE_BLOB>} Receives the address of a BYTE_BLOB structure describing the raw data.  The caller must free this memory block by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileserrorinfo-getrawdata
     */
    GetRawData() {
        result := ComCall(3, this, "ptr*", &ppBlob := 0, "HRESULT")
        return ppBlob
    }

    /**
     * Retrieves a text string describing the error.
     * @returns {PWSTR} Receives the address of a text string describing the error.  The caller must free this memory block by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileserrorinfo-getdescription
     */
    GetDescription() {
        result := ComCall(4, this, PWSTR.Ptr, &ppszDescription := 0, "HRESULT")
        return ppszDescription
    }

    Query(iid) {
        if (IOfflineFilesErrorInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRawData := CallbackCreate(GetMethod(implObj, "GetRawData"), flags, 2)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRawData)
        CallbackFree(this.vtbl.GetDescription)
    }
}
