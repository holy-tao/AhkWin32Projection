#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertRequestD extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertRequestD
     * @type {Guid}
     */
    static IID => Guid("{d99e6e70-fc88-11d0-b498-00a0c90312f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Request", "GetCACert", "Ping"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pwszAuthority 
     * @param {Pointer<Integer>} pdwRequestId 
     * @param {Pointer<Integer>} pdwDisposition 
     * @param {PWSTR} pwszAttributes 
     * @param {Pointer<CERTTRANSBLOB>} pctbRequest 
     * @param {Pointer<CERTTRANSBLOB>} pctbCertChain 
     * @param {Pointer<CERTTRANSBLOB>} pctbEncodedCert 
     * @param {Pointer<CERTTRANSBLOB>} pctbDispositionMessage 
     * @returns {HRESULT} 
     */
    Request(dwFlags, pwszAuthority, pdwRequestId, pdwDisposition, pwszAttributes, pctbRequest, pctbCertChain, pctbEncodedCert, pctbDispositionMessage) {
        pwszAuthority := pwszAuthority is String ? StrPtr(pwszAuthority) : pwszAuthority
        pwszAttributes := pwszAttributes is String ? StrPtr(pwszAttributes) : pwszAttributes

        pdwRequestIdMarshal := pdwRequestId is VarRef ? "uint*" : "ptr"
        pdwDispositionMarshal := pdwDisposition is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwFlags, "ptr", pwszAuthority, pdwRequestIdMarshal, pdwRequestId, pdwDispositionMarshal, pdwDisposition, "ptr", pwszAttributes, "ptr", pctbRequest, "ptr", pctbCertChain, "ptr", pctbEncodedCert, "ptr", pctbDispositionMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fchain 
     * @param {PWSTR} pwszAuthority 
     * @param {Pointer<CERTTRANSBLOB>} pctbOut 
     * @returns {HRESULT} 
     */
    GetCACert(fchain, pwszAuthority, pctbOut) {
        pwszAuthority := pwszAuthority is String ? StrPtr(pwszAuthority) : pwszAuthority

        result := ComCall(4, this, "uint", fchain, "ptr", pwszAuthority, "ptr", pctbOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszAuthority 
     * @returns {HRESULT} 
     */
    Ping(pwszAuthority) {
        pwszAuthority := pwszAuthority is String ? StrPtr(pwszAuthority) : pwszAuthority

        result := ComCall(5, this, "ptr", pwszAuthority, "HRESULT")
        return result
    }
}
