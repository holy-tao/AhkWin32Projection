#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyFile.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use the IBackgroundCopyError interface to determine the cause of an error and if the transfer process can proceed.
 * @see https://docs.microsoft.com/windows/win32/api//bits/nn-bits-ibackgroundcopyerror
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyError extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyError
     * @type {Guid}
     */
    static IID => Guid("{19c613a0-fcb8-4f28-81ae-897c3d078f81}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetError", "GetFile", "GetErrorDescription", "GetErrorContextDescription", "GetProtocol"]

    /**
     * Retrieves the error code and identify the context in which the error occurred.
     * @param {Pointer<Integer>} pContext Context in which the error occurred. For a list of context values, see the 
     * [BG_ERROR_CONTEXT](./ne-bits-bg_error_context.md) enumeration.
     * @param {Pointer<HRESULT>} pCode Error code of the error that occurred.
     * @returns {HRESULT} This method returns <b>S_OK</b> on success or one of the standard COM HRESULT values on error.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyerror-geterror
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyerror-getfile
     */
    GetFile() {
        result := ComCall(4, this, "ptr*", &pVal := 0, "HRESULT")
        return IBackgroundCopyFile(pVal)
    }

    /**
     * Retrieves the error text associated with the error.
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyerror-geterrordescription
     */
    GetErrorDescription(LanguageId) {
        result := ComCall(5, this, "uint", LanguageId, "ptr*", &pErrorDescription := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyerror-geterrorcontextdescription
     */
    GetErrorContextDescription(LanguageId) {
        result := ComCall(6, this, "uint", LanguageId, "ptr*", &pContextDescription := 0, "HRESULT")
        return pContextDescription
    }

    /**
     * Retrieves the protocol used to transfer the file. The remote file name identifies the protocol to use to transfer the file.
     * @returns {PWSTR} Null-terminated string that contains the protocol used to transfer the file. The string contains "http" for the HTTP protocol and "file" for the SMB protocol. The <i>ppProtocol</i> parameter is set to <b>NULL</b> if the error is not related to the transfer protocol. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppProtocol</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyerror-getprotocol
     */
    GetProtocol() {
        result := ComCall(7, this, "ptr*", &pProtocol := 0, "HRESULT")
        return pProtocol
    }
}
