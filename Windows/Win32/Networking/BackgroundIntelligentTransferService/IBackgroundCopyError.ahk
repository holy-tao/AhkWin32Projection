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
     * 
     * @param {Pointer<Int32>} pContext 
     * @param {Pointer<HRESULT>} pCode 
     * @returns {HRESULT} 
     */
    GetError(pContext, pCode) {
        result := ComCall(3, this, "int*", pContext, "ptr", pCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBackgroundCopyFile>} pVal 
     * @returns {HRESULT} 
     */
    GetFile(pVal) {
        result := ComCall(4, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LanguageId 
     * @param {Pointer<PWSTR>} pErrorDescription 
     * @returns {HRESULT} 
     */
    GetErrorDescription(LanguageId, pErrorDescription) {
        result := ComCall(5, this, "uint", LanguageId, "ptr", pErrorDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LanguageId 
     * @param {Pointer<PWSTR>} pContextDescription 
     * @returns {HRESULT} 
     */
    GetErrorContextDescription(LanguageId, pContextDescription) {
        result := ComCall(6, this, "uint", LanguageId, "ptr", pContextDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pProtocol 
     * @returns {HRESULT} 
     */
    GetProtocol(pProtocol) {
        result := ComCall(7, this, "ptr", pProtocol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
