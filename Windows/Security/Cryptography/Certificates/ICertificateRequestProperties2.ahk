#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Certificate.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICertificateRequestProperties2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificateRequestProperties2
     * @type {Guid}
     */
    static IID => Guid("{3da0c954-d73f-4ff3-a0a6-0677c0ada05b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SmartcardReaderName", "put_SmartcardReaderName", "get_SigningCertificate", "put_SigningCertificate", "get_AttestationCredentialCertificate", "put_AttestationCredentialCertificate"]

    /**
     * @type {HSTRING} 
     */
    SmartcardReaderName {
        get => this.get_SmartcardReaderName()
        set => this.put_SmartcardReaderName(value)
    }

    /**
     * @type {Certificate} 
     */
    SigningCertificate {
        get => this.get_SigningCertificate()
        set => this.put_SigningCertificate(value)
    }

    /**
     * @type {Certificate} 
     */
    AttestationCredentialCertificate {
        get => this.get_AttestationCredentialCertificate()
        set => this.put_AttestationCredentialCertificate(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SmartcardReaderName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SmartcardReaderName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_SigningCertificate() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Certificate(value)
    }

    /**
     * 
     * @param {Certificate} value 
     * @returns {HRESULT} 
     */
    put_SigningCertificate(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_AttestationCredentialCertificate() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Certificate(value)
    }

    /**
     * 
     * @param {Certificate} value 
     * @returns {HRESULT} 
     */
    put_AttestationCredentialCertificate(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
