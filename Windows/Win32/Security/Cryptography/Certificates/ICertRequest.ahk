#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides communications between a client or intermediary application and Certificate services.
 * @see https://docs.microsoft.com/windows/win32/api//certcli/nn-certcli-icertrequest
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertRequest extends IDispatch{
    /**
     * The interface identifier for ICertRequest
     * @type {Guid}
     */
    static IID => Guid("{014e4840-5523-11d0-8812-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} Flags 
     * @param {BSTR} strRequest 
     * @param {BSTR} strAttributes 
     * @param {BSTR} strConfig 
     * @param {Pointer<Int32>} pDisposition 
     * @returns {HRESULT} 
     */
    Submit(Flags, strRequest, strAttributes, strConfig, pDisposition) {
        strRequest := strRequest is String ? BSTR.Alloc(strRequest).Value : strRequest
        strAttributes := strAttributes is String ? BSTR.Alloc(strAttributes).Value : strAttributes
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(7, this, "int", Flags, "ptr", strRequest, "ptr", strAttributes, "ptr", strConfig, "int*", pDisposition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} RequestId 
     * @param {BSTR} strConfig 
     * @param {Pointer<Int32>} pDisposition 
     * @returns {HRESULT} 
     */
    RetrievePending(RequestId, strConfig, pDisposition) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(8, this, "int", RequestId, "ptr", strConfig, "int*", pDisposition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    GetLastStatus(pStatus) {
        result := ComCall(9, this, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRequestId 
     * @returns {HRESULT} 
     */
    GetRequestId(pRequestId) {
        result := ComCall(10, this, "int*", pRequestId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrDispositionMessage 
     * @returns {HRESULT} 
     */
    GetDispositionMessage(pstrDispositionMessage) {
        result := ComCall(11, this, "ptr", pstrDispositionMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fExchangeCertificate 
     * @param {BSTR} strConfig 
     * @param {Integer} Flags 
     * @param {Pointer<BSTR>} pstrCertificate 
     * @returns {HRESULT} 
     */
    GetCACertificate(fExchangeCertificate, strConfig, Flags, pstrCertificate) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(12, this, "int", fExchangeCertificate, "ptr", strConfig, "int", Flags, "ptr", pstrCertificate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<BSTR>} pstrCertificate 
     * @returns {HRESULT} 
     */
    GetCertificate(Flags, pstrCertificate) {
        result := ComCall(13, this, "int", Flags, "ptr", pstrCertificate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
