#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICEnroll.ahk

/**
 * The ICEnroll2 interface is one of several interfaces that represent the Certificate Enrollment Control.
 * @see https://docs.microsoft.com/windows/win32/api//xenroll/nn-xenroll-icenroll2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICEnroll2 extends ICEnroll{
    /**
     * The interface identifier for ICEnroll2
     * @type {Guid}
     */
    static IID => Guid("{704ca730-c90b-11d1-9bec-00c04fc295e1}")

    /**
     * The class identifier for CEnroll2
     * @type {Guid}
     */
    static CLSID => Guid("{127698e4-e730-4e5c-a2b1-21490a70c8a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 63

    /**
     * 
     * @param {BSTR} CertType 
     * @returns {HRESULT} 
     */
    addCertTypeToRequest(CertType) {
        CertType := CertType is String ? BSTR.Alloc(CertType).Value : CertType

        result := ComCall(63, this, "ptr", CertType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    addNameValuePairToSignature(Name, Value) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(64, this, "ptr", Name, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fBool 
     * @returns {HRESULT} 
     */
    get_WriteCertToUserDS(fBool) {
        result := ComCall(65, this, "ptr", fBool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     */
    put_WriteCertToUserDS(fBool) {
        result := ComCall(66, this, "int", fBool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} fBool 
     * @returns {HRESULT} 
     */
    get_EnableT61DNEncoding(fBool) {
        result := ComCall(67, this, "ptr", fBool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     */
    put_EnableT61DNEncoding(fBool) {
        result := ComCall(68, this, "int", fBool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
