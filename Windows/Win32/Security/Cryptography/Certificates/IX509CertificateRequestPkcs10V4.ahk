#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IX509CertificateRequestPkcs10V3.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRequestPkcs10V4 extends IX509CertificateRequestPkcs10V3{
    /**
     * The interface identifier for IX509CertificateRequestPkcs10V4
     * @type {Guid}
     */
    static IID => Guid("{728ab363-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 76

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_ClaimType(pValue) {
        result := ComCall(76, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    put_ClaimType(Value) {
        result := ComCall(77, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_AttestPrivateKeyPreferred(pValue) {
        result := ComCall(78, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_AttestPrivateKeyPreferred(Value) {
        result := ComCall(79, this, "short", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
