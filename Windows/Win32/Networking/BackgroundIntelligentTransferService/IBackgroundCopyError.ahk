#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IBackgroundCopyFile.ahk" { IBackgroundCopyFile }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\BG_ERROR_CONTEXT.ahk" { BG_ERROR_CONTEXT }

/**
 * Use the IBackgroundCopyError interface to determine the cause of an error and if the transfer process can proceed.
 * @see https://learn.microsoft.com/windows/win32/api/bits/nn-bits-ibackgroundcopyerror
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBackgroundCopyError extends IUnknown {
    /**
     * The interface identifier for IBackgroundCopyError
     * @type {Guid}
     */
    static IID := Guid("{19c613a0-fcb8-4f28-81ae-897c3d078f81}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBackgroundCopyError interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetError                   : IntPtr
        GetFile                    : IntPtr
        GetErrorDescription        : IntPtr
        GetErrorContextDescription : IntPtr
        GetProtocol                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBackgroundCopyError.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the error code and identify the context in which the error occurred.
     * @param {Pointer<BG_ERROR_CONTEXT>} pContext Context in which the error occurred. For a list of context values, see the 
     * [BG_ERROR_CONTEXT](./ne-bits-bg_error_context.md) enumeration.
     * @param {Pointer<HRESULT>} pCode Error code of the error that occurred.
     * @returns {HRESULT} This method returns <b>S_OK</b> on success or one of the standard COM HRESULT values on error.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyerror-geterror
     */
    GetError(pContext, pCode) {
        pContextMarshal := pContext is VarRef ? "int*" : "ptr"
        pCodeMarshal := pCode is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pContextMarshal, pContext, pCodeMarshal, pCode, "HRESULT")
        return result
    }

    /**
     * Retrieves an interface pointer to the file object associated with the error.
     * @returns {IBackgroundCopyFile} An <a href="https://docs.microsoft.com/windows/desktop/api/bits/nn-bits-ibackgroundcopyfile">IBackgroundCopyFile</a> interface pointer whose methods you use to determine the local and remote file names associated with the error. The <i>ppFile</i> parameter is set to <b>NULL</b> if the error is not associated with the local or remote file. When done, release <i>ppFile</i>.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyerror-getfile
     */
    GetFile() {
        result := ComCall(4, this, "ptr*", &pVal := 0, "HRESULT")
        return IBackgroundCopyFile(pVal)
    }

    /**
     * Retrieves the error text associated with the error.
     * @remarks
     * You can also call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/nf-bits-ibackgroundcopymanager-geterrordescription">IBackgroundCopyManager::GetErrorDescription</a> method to retrieve the error text associated with an error code.
     * 
     * Descriptions for HTTP errors are  localized.
     * 
     * <b>Windows XP/2000:  </b>Descriptions for HTTP errors are not localized.
     * @param {Integer} LanguageId Identifies the locale to use to generate the description. To create the language identifier, use the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/nf-winnt-makelangid">MAKELANGID</a> macro. For example, to specify U.S. English, use the following code sample. 
     * 
     * 
     * 
     * 
     * <c>MAKELANGID(LANG_ENGLISH, SUBLANG_ENGLISH_US)</c>
     * 
     * To retrieve the system's default user language identifier, use the following calls.
     * 
     * <c>LANGIDFROMLCID(GetThreadLocale())</c>
     * @returns {PWSTR} Null-terminated string that contains the error text associated with the error. Call the 
     * <a href="https://docs.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppErrorDescription</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyerror-geterrordescription
     */
    GetErrorDescription(LanguageId) {
        result := ComCall(5, this, "uint", LanguageId, PWSTR.Ptr, &pErrorDescription := 0, "HRESULT")
        return pErrorDescription
    }

    /**
     * Retrieves the description of the context in which the error occurred.
     * @param {Integer} LanguageId Identifies the locale to use to generate the description. To create the language identifier, use the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/nf-winnt-makelangid">MAKELANGID</a> macro. For example, to specify U.S. English, use the following code sample. 
     * 
     * 
     * 
     * 
     * <c>MAKELANGID(LANG_ENGLISH, SUBLANG_ENGLISH_US)</c>
     * 
     * To retrieve the system's default user language identifier, use the following calls.
     * 
     * <c>LANGIDFROMLCID(GetThreadLocale())</c>
     * @returns {PWSTR} Null-terminated string that contains the description of the context in which the error occurred. Call the 
     * <a href="https://docs.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppContextDescription</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyerror-geterrorcontextdescription
     */
    GetErrorContextDescription(LanguageId) {
        result := ComCall(6, this, "uint", LanguageId, PWSTR.Ptr, &pContextDescription := 0, "HRESULT")
        return pContextDescription
    }

    /**
     * Retrieves the protocol used to transfer the file. The remote file name identifies the protocol to use to transfer the file.
     * @returns {PWSTR} Null-terminated string that contains the protocol used to transfer the file. The string contains "http" for the HTTP protocol and "file" for the SMB protocol. The <i>ppProtocol</i> parameter is set to <b>NULL</b> if the error is not related to the transfer protocol. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppProtocol</i> when done.
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyerror-getprotocol
     */
    GetProtocol() {
        result := ComCall(7, this, PWSTR.Ptr, &pProtocol := 0, "HRESULT")
        return pProtocol
    }

    Query(iid) {
        if (IBackgroundCopyError.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetError := CallbackCreate(GetMethod(implObj, "GetError"), flags, 3)
        this.vtbl.GetFile := CallbackCreate(GetMethod(implObj, "GetFile"), flags, 2)
        this.vtbl.GetErrorDescription := CallbackCreate(GetMethod(implObj, "GetErrorDescription"), flags, 3)
        this.vtbl.GetErrorContextDescription := CallbackCreate(GetMethod(implObj, "GetErrorContextDescription"), flags, 3)
        this.vtbl.GetProtocol := CallbackCreate(GetMethod(implObj, "GetProtocol"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetError)
        CallbackFree(this.vtbl.GetFile)
        CallbackFree(this.vtbl.GetErrorDescription)
        CallbackFree(this.vtbl.GetErrorContextDescription)
        CallbackFree(this.vtbl.GetProtocol)
    }
}
