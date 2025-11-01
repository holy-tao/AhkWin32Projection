#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} pContext 
     * @param {Pointer<HRESULT>} pCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyerror-geterror
     */
    GetError(pContext, pCode) {
        pContextMarshal := pContext is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pContextMarshal, pContext, "ptr", pCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IBackgroundCopyFile>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyerror-getfile
     */
    GetFile(pVal) {
        result := ComCall(4, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} LanguageId 
     * @param {Pointer<PWSTR>} pErrorDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyerror-geterrordescription
     */
    GetErrorDescription(LanguageId, pErrorDescription) {
        result := ComCall(5, this, "uint", LanguageId, "ptr", pErrorDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} LanguageId 
     * @param {Pointer<PWSTR>} pContextDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyerror-geterrorcontextdescription
     */
    GetErrorContextDescription(LanguageId, pContextDescription) {
        result := ComCall(6, this, "uint", LanguageId, "ptr", pContextDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pProtocol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits/nf-bits-ibackgroundcopyerror-getprotocol
     */
    GetProtocol(pProtocol) {
        result := ComCall(7, this, "ptr", pProtocol, "HRESULT")
        return result
    }
}
