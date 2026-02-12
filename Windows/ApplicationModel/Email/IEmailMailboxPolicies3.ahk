#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMailboxPolicies3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMailboxPolicies3
     * @type {Guid}
     */
    static IID => Guid("{bdd4a01f-4867-414a-81a2-803919c44191}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_AllowedSmimeEncryptionAlgorithmNegotiation", "put_AllowSmimeSoftCertificates", "put_RequiredSmimeEncryptionAlgorithm", "put_RequiredSmimeSigningAlgorithm", "put_MustEncryptSmimeMessages", "put_MustSignSmimeMessages"]

    /**
     * @type {HRESULT} 
     */
    AllowedSmimeEncryptionAlgorithmNegotiation {
        set => this.put_AllowedSmimeEncryptionAlgorithmNegotiation(value)
    }

    /**
     * @type {HRESULT} 
     */
    AllowSmimeSoftCertificates {
        set => this.put_AllowSmimeSoftCertificates(value)
    }

    /**
     * @type {HRESULT} 
     */
    RequiredSmimeEncryptionAlgorithm {
        set => this.put_RequiredSmimeEncryptionAlgorithm(value)
    }

    /**
     * @type {HRESULT} 
     */
    RequiredSmimeSigningAlgorithm {
        set => this.put_RequiredSmimeSigningAlgorithm(value)
    }

    /**
     * @type {HRESULT} 
     */
    MustEncryptSmimeMessages {
        set => this.put_MustEncryptSmimeMessages(value)
    }

    /**
     * @type {HRESULT} 
     */
    MustSignSmimeMessages {
        set => this.put_MustSignSmimeMessages(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AllowedSmimeEncryptionAlgorithmNegotiation(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowSmimeSoftCertificates(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_RequiredSmimeEncryptionAlgorithm(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_RequiredSmimeSigningAlgorithm(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MustEncryptSmimeMessages(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MustSignSmimeMessages(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
