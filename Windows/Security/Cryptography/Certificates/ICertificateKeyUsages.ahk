#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICertificateKeyUsages extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificateKeyUsages
     * @type {Guid}
     */
    static IID => Guid("{6ac6206f-e1cf-486a-b485-a69c83e46fd1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EncipherOnly", "put_EncipherOnly", "get_CrlSign", "put_CrlSign", "get_KeyCertificateSign", "put_KeyCertificateSign", "get_KeyAgreement", "put_KeyAgreement", "get_DataEncipherment", "put_DataEncipherment", "get_KeyEncipherment", "put_KeyEncipherment", "get_NonRepudiation", "put_NonRepudiation", "get_DigitalSignature", "put_DigitalSignature"]

    /**
     * @type {Boolean} 
     */
    EncipherOnly {
        get => this.get_EncipherOnly()
        set => this.put_EncipherOnly(value)
    }

    /**
     * @type {Boolean} 
     */
    CrlSign {
        get => this.get_CrlSign()
        set => this.put_CrlSign(value)
    }

    /**
     * @type {Boolean} 
     */
    KeyCertificateSign {
        get => this.get_KeyCertificateSign()
        set => this.put_KeyCertificateSign(value)
    }

    /**
     * @type {Boolean} 
     */
    KeyAgreement {
        get => this.get_KeyAgreement()
        set => this.put_KeyAgreement(value)
    }

    /**
     * @type {Boolean} 
     */
    DataEncipherment {
        get => this.get_DataEncipherment()
        set => this.put_DataEncipherment(value)
    }

    /**
     * @type {Boolean} 
     */
    KeyEncipherment {
        get => this.get_KeyEncipherment()
        set => this.put_KeyEncipherment(value)
    }

    /**
     * @type {Boolean} 
     */
    NonRepudiation {
        get => this.get_NonRepudiation()
        set => this.put_NonRepudiation(value)
    }

    /**
     * @type {Boolean} 
     */
    DigitalSignature {
        get => this.get_DigitalSignature()
        set => this.put_DigitalSignature(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EncipherOnly() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_EncipherOnly(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CrlSign() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CrlSign(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_KeyCertificateSign() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_KeyCertificateSign(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_KeyAgreement() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_KeyAgreement(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DataEncipherment() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DataEncipherment(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_KeyEncipherment() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_KeyEncipherment(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_NonRepudiation() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_NonRepudiation(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DigitalSignature() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DigitalSignature(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
