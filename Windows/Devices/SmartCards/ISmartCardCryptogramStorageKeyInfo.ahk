#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardCryptogramStorageKeyInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardCryptogramStorageKeyInfo
     * @type {Guid}
     */
    static IID => Guid("{77b0f00d-b097-4f61-a26a-9561639c9c3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OperationStatus", "get_PublicKeyBlobType", "get_PublicKey", "get_AttestationStatus", "get_Attestation", "get_AttestationCertificateChain", "get_Capabilities"]

    /**
     * @type {Integer} 
     */
    OperationStatus {
        get => this.get_OperationStatus()
    }

    /**
     * @type {Integer} 
     */
    PublicKeyBlobType {
        get => this.get_PublicKeyBlobType()
    }

    /**
     * @type {IBuffer} 
     */
    PublicKey {
        get => this.get_PublicKey()
    }

    /**
     * @type {Integer} 
     */
    AttestationStatus {
        get => this.get_AttestationStatus()
    }

    /**
     * @type {IBuffer} 
     */
    Attestation {
        get => this.get_Attestation()
    }

    /**
     * @type {IBuffer} 
     */
    AttestationCertificateChain {
        get => this.get_AttestationCertificateChain()
    }

    /**
     * @type {Integer} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OperationStatus() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PublicKeyBlobType() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_PublicKey() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttestationStatus() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Attestation() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_AttestationCertificateChain() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Capabilities() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
