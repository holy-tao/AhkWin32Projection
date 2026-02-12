#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides the property values for a PlayReady-ND transmitter certificate.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indtransmitterproperties
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDTransmitterProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDTransmitterProperties
     * @type {Guid}
     */
    static IID => Guid("{e536af23-ac4f-4adc-8c66-4ff7c2702dd6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CertificateType", "get_PlatformIdentifier", "get_SupportedFeatures", "get_SecurityLevel", "get_SecurityVersion", "get_ExpirationDate", "get_ClientID", "get_ModelDigest", "get_ModelManufacturerName", "get_ModelName", "get_ModelNumber"]

    /**
     * Gets the certificate type for the transmitter.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indtransmitterproperties.certificatetype
     * @type {Integer} 
     */
    CertificateType {
        get => this.get_CertificateType()
    }

    /**
     * Gets the platform identifier from a transmitter certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indtransmitterproperties.platformidentifier
     * @type {Integer} 
     */
    PlatformIdentifier {
        get => this.get_PlatformIdentifier()
    }

    /**
     * Gets the list of supported features from the transmitter certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indtransmitterproperties.supportedfeatures
     */
    SupportedFeatures {
        get => this.get_SupportedFeatures()
    }

    /**
     * Gets the security level from a transmitter certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indtransmitterproperties.securitylevel
     * @type {Integer} 
     */
    SecurityLevel {
        get => this.get_SecurityLevel()
    }

    /**
     * Gets the security version from a transmitter certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indtransmitterproperties.securityversion
     * @type {Integer} 
     */
    SecurityVersion {
        get => this.get_SecurityVersion()
    }

    /**
     * Gets the expiration date and time from the transmitter certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indtransmitterproperties.expirationdate
     * @type {DateTime} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
    }

    /**
     * Gets the client identifier from the transmitter certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indtransmitterproperties.clientid
     */
    ClientID {
        get => this.get_ClientID()
    }

    /**
     * Gets the model digest from a transmitter certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indtransmitterproperties.modeldigest
     */
    ModelDigest {
        get => this.get_ModelDigest()
    }

    /**
     * Gets the model manufacturer name from a transmitter certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indtransmitterproperties.modelmanufacturername
     * @type {HSTRING} 
     */
    ModelManufacturerName {
        get => this.get_ModelManufacturerName()
    }

    /**
     * Gets the model name from a transmitter certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indtransmitterproperties.modelname
     * @type {HSTRING} 
     */
    ModelName {
        get => this.get_ModelName()
    }

    /**
     * Gets the model number from a transmitter certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indtransmitterproperties.modelnumber
     * @type {HSTRING} 
     */
    ModelNumber {
        get => this.get_ModelNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CertificateType() {
        result := ComCall(6, this, "int*", &type := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return type
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlatformIdentifier() {
        result := ComCall(7, this, "int*", &identifier := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return identifier
    }

    /**
     * 
     * @param {Pointer<Pointer>} featureSets 
     * @returns {HRESULT} 
     */
    get_SupportedFeatures(featureSets) {
        result := ComCall(8, this, "ptr", featureSets, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SecurityLevel() {
        result := ComCall(9, this, "uint*", &level := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return level
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SecurityVersion() {
        result := ComCall(10, this, "uint*", &securityVersion := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return securityVersion
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ExpirationDate() {
        expirationDate := DateTime()
        result := ComCall(11, this, "ptr", expirationDate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return expirationDate
    }

    /**
     * 
     * @param {Pointer<Pointer>} clientIDBytes 
     * @returns {HRESULT} 
     */
    get_ClientID(clientIDBytes) {
        result := ComCall(12, this, "ptr", clientIDBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} modelDigestBytes 
     * @returns {HRESULT} 
     */
    get_ModelDigest(modelDigestBytes) {
        result := ComCall(13, this, "ptr", modelDigestBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ModelManufacturerName() {
        modelManufacturerName := HSTRING()
        result := ComCall(14, this, "ptr", modelManufacturerName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return modelManufacturerName
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ModelName() {
        modelName := HSTRING()
        result := ComCall(15, this, "ptr", modelName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return modelName
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ModelNumber() {
        modelNumber := HSTRING()
        result := ComCall(16, this, "ptr", modelNumber, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return modelNumber
    }
}
