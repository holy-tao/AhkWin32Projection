#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CertificateKeyUsages.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SubjectAlternativeNameInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Returns a BasicConstraints object that represents the basic constraints extension of the certificate.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/SecCrypto/certificate-basicconstraints
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICertificate2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificate2
     * @type {Guid}
     */
    static IID => Guid("{17b8374c-8a25-4d96-a492-8fc29ac4fda6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSecurityDeviceBound", "get_KeyUsages", "get_KeyAlgorithmName", "get_SignatureAlgorithmName", "get_SignatureHashAlgorithmName", "get_SubjectAlternativeName"]

    /**
     * @type {Boolean} 
     */
    IsSecurityDeviceBound {
        get => this.get_IsSecurityDeviceBound()
    }

    /**
     * @type {CertificateKeyUsages} 
     */
    KeyUsages {
        get => this.get_KeyUsages()
    }

    /**
     * @type {HSTRING} 
     */
    KeyAlgorithmName {
        get => this.get_KeyAlgorithmName()
    }

    /**
     * @type {HSTRING} 
     */
    SignatureAlgorithmName {
        get => this.get_SignatureAlgorithmName()
    }

    /**
     * @type {HSTRING} 
     */
    SignatureHashAlgorithmName {
        get => this.get_SignatureHashAlgorithmName()
    }

    /**
     * @type {SubjectAlternativeNameInfo} 
     */
    SubjectAlternativeName {
        get => this.get_SubjectAlternativeName()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSecurityDeviceBound() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {CertificateKeyUsages} 
     */
    get_KeyUsages() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CertificateKeyUsages(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyAlgorithmName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SignatureAlgorithmName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SignatureHashAlgorithmName() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SubjectAlternativeNameInfo} 
     */
    get_SubjectAlternativeName() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SubjectAlternativeNameInfo(value)
    }
}
