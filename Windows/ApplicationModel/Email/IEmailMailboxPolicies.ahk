#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMailboxPolicies extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMailboxPolicies
     * @type {Guid}
     */
    static IID => Guid("{1f3345c5-1c3b-4dc7-b410-6373783e545d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowedSmimeEncryptionAlgorithmNegotiation", "get_AllowSmimeSoftCertificates", "get_RequiredSmimeEncryptionAlgorithm", "get_RequiredSmimeSigningAlgorithm"]

    /**
     * @type {Integer} 
     */
    AllowedSmimeEncryptionAlgorithmNegotiation {
        get => this.get_AllowedSmimeEncryptionAlgorithmNegotiation()
    }

    /**
     * @type {Boolean} 
     */
    AllowSmimeSoftCertificates {
        get => this.get_AllowSmimeSoftCertificates()
    }

    /**
     * @type {IReference<Integer>} 
     */
    RequiredSmimeEncryptionAlgorithm {
        get => this.get_RequiredSmimeEncryptionAlgorithm()
    }

    /**
     * @type {IReference<Integer>} 
     */
    RequiredSmimeSigningAlgorithm {
        get => this.get_RequiredSmimeSigningAlgorithm()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedSmimeEncryptionAlgorithmNegotiation() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowSmimeSoftCertificates() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_RequiredSmimeEncryptionAlgorithm() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_RequiredSmimeSigningAlgorithm() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
