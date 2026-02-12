#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardCryptogramStorageKeyInfo.ahk
#Include .\ISmartCardCryptogramStorageKeyInfo2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about the storage key so that apps can register and certify the key information with their service.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramstoragekeyinfo
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramStorageKeyInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardCryptogramStorageKeyInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardCryptogramStorageKeyInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the operation status.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramstoragekeyinfo.operationstatus
     * @type {Integer} 
     */
    OperationStatus {
        get => this.get_OperationStatus()
    }

    /**
     * Gets the type of the public key object. This value reflects the public key blob type requested in the [RequestCryptogramMaterialStorageKeyInfoAsync](smartcardcryptogramgenerator_requestcryptogrammaterialstoragekeyinfoasync_688264229.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramstoragekeyinfo.publickeyblobtype
     * @type {Integer} 
     */
    PublicKeyBlobType {
        get => this.get_PublicKeyBlobType()
    }

    /**
     * Gets the public key.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramstoragekeyinfo.publickey
     * @type {IBuffer} 
     */
    PublicKey {
        get => this.get_PublicKey()
    }

    /**
     * Gets the attestation status.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramstoragekeyinfo.attestationstatus
     * @type {Integer} 
     */
    AttestationStatus {
        get => this.get_AttestationStatus()
    }

    /**
     * Gets the attestation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramstoragekeyinfo.attestation
     * @type {IBuffer} 
     */
    Attestation {
        get => this.get_Attestation()
    }

    /**
     * Gets the attestation certificate chain.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramstoragekeyinfo.attestationcertificatechain
     * @type {IBuffer} 
     */
    AttestationCertificateChain {
        get => this.get_AttestationCertificateChain()
    }

    /**
     * Gets the cryptogram storage key capabilities.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramstoragekeyinfo.capabilities
     * @type {Integer} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * Gets the operational requirements of the storage key.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramstoragekeyinfo.operationalrequirements
     * @type {HSTRING} 
     */
    OperationalRequirements {
        get => this.get_OperationalRequirements()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OperationStatus() {
        if (!this.HasProp("__ISmartCardCryptogramStorageKeyInfo")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramStorageKeyInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramStorageKeyInfo := ISmartCardCryptogramStorageKeyInfo(outPtr)
        }

        return this.__ISmartCardCryptogramStorageKeyInfo.get_OperationStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PublicKeyBlobType() {
        if (!this.HasProp("__ISmartCardCryptogramStorageKeyInfo")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramStorageKeyInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramStorageKeyInfo := ISmartCardCryptogramStorageKeyInfo(outPtr)
        }

        return this.__ISmartCardCryptogramStorageKeyInfo.get_PublicKeyBlobType()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_PublicKey() {
        if (!this.HasProp("__ISmartCardCryptogramStorageKeyInfo")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramStorageKeyInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramStorageKeyInfo := ISmartCardCryptogramStorageKeyInfo(outPtr)
        }

        return this.__ISmartCardCryptogramStorageKeyInfo.get_PublicKey()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttestationStatus() {
        if (!this.HasProp("__ISmartCardCryptogramStorageKeyInfo")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramStorageKeyInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramStorageKeyInfo := ISmartCardCryptogramStorageKeyInfo(outPtr)
        }

        return this.__ISmartCardCryptogramStorageKeyInfo.get_AttestationStatus()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Attestation() {
        if (!this.HasProp("__ISmartCardCryptogramStorageKeyInfo")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramStorageKeyInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramStorageKeyInfo := ISmartCardCryptogramStorageKeyInfo(outPtr)
        }

        return this.__ISmartCardCryptogramStorageKeyInfo.get_Attestation()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_AttestationCertificateChain() {
        if (!this.HasProp("__ISmartCardCryptogramStorageKeyInfo")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramStorageKeyInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramStorageKeyInfo := ISmartCardCryptogramStorageKeyInfo(outPtr)
        }

        return this.__ISmartCardCryptogramStorageKeyInfo.get_AttestationCertificateChain()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Capabilities() {
        if (!this.HasProp("__ISmartCardCryptogramStorageKeyInfo")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramStorageKeyInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramStorageKeyInfo := ISmartCardCryptogramStorageKeyInfo(outPtr)
        }

        return this.__ISmartCardCryptogramStorageKeyInfo.get_Capabilities()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OperationalRequirements() {
        if (!this.HasProp("__ISmartCardCryptogramStorageKeyInfo2")) {
            if ((queryResult := this.QueryInterface(ISmartCardCryptogramStorageKeyInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardCryptogramStorageKeyInfo2 := ISmartCardCryptogramStorageKeyInfo2(outPtr)
        }

        return this.__ISmartCardCryptogramStorageKeyInfo2.get_OperationalRequirements()
    }

;@endregion Instance Methods
}
