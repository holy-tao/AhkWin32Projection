#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChainBuildingParameters.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents parameters to use when building a certificate chain.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.chainbuildingparameters
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ChainBuildingParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChainBuildingParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChainBuildingParameters.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a collection of object identifiers (OIDs) for the enhanced key usage extension.
     * @remarks
     * The EnhancedKeyUsages property is read-only. However, the list of object identifiers (OIDs) that is returned is writable and you can add OIDs for enhanced key usage to the list.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.chainbuildingparameters.enhancedkeyusages
     * @type {IVector<HSTRING>} 
     */
    EnhancedKeyUsages {
        get => this.get_EnhancedKeyUsages()
    }

    /**
     * Gets or sets the time stamp used to determine whether the certificate chain was time valid.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.chainbuildingparameters.validationtimestamp
     * @type {DateTime} 
     */
    ValidationTimestamp {
        get => this.get_ValidationTimestamp()
        set => this.put_ValidationTimestamp(value)
    }

    /**
     * Gets or sets a value indicating whether revocation checking is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.chainbuildingparameters.revocationcheckenabled
     * @type {Boolean} 
     */
    RevocationCheckEnabled {
        get => this.get_RevocationCheckEnabled()
        set => this.put_RevocationCheckEnabled(value)
    }

    /**
     * Gets or sets a value indicating whether to request new URLs to use for chain building and revocation checking or to use cached URLs.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.chainbuildingparameters.networkretrievalenabled
     * @type {Boolean} 
     */
    NetworkRetrievalEnabled {
        get => this.get_NetworkRetrievalEnabled()
        set => this.put_NetworkRetrievalEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether Authority Information Access (AIA) is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.chainbuildingparameters.authorityinformationaccessenabled
     * @type {Boolean} 
     */
    AuthorityInformationAccessEnabled {
        get => this.get_AuthorityInformationAccessEnabled()
        set => this.put_AuthorityInformationAccessEnabled(value)
    }

    /**
     * Gets or sets a value indicating that the current time is to be used for the validation timestamp.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.chainbuildingparameters.currenttimevalidationenabled
     * @type {Boolean} 
     */
    CurrentTimeValidationEnabled {
        get => this.get_CurrentTimeValidationEnabled()
        set => this.put_CurrentTimeValidationEnabled(value)
    }

    /**
     * Gets the list of root certificates that will be trusted.
     * @remarks
     * The ExclusiveTrustRoots property is read-only. However, the list of root certificates that is returned is writable and you can add certificates to it that will be used for exclusive trust.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.chainbuildingparameters.exclusivetrustroots
     * @type {IVector<Certificate>} 
     */
    ExclusiveTrustRoots {
        get => this.get_ExclusiveTrustRoots()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [ChainBuildingParameters](chainbuildingparameters.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.ChainBuildingParameters")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_EnhancedKeyUsages() {
        if (!this.HasProp("__IChainBuildingParameters")) {
            if ((queryResult := this.QueryInterface(IChainBuildingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChainBuildingParameters := IChainBuildingParameters(outPtr)
        }

        return this.__IChainBuildingParameters.get_EnhancedKeyUsages()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ValidationTimestamp() {
        if (!this.HasProp("__IChainBuildingParameters")) {
            if ((queryResult := this.QueryInterface(IChainBuildingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChainBuildingParameters := IChainBuildingParameters(outPtr)
        }

        return this.__IChainBuildingParameters.get_ValidationTimestamp()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_ValidationTimestamp(value) {
        if (!this.HasProp("__IChainBuildingParameters")) {
            if ((queryResult := this.QueryInterface(IChainBuildingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChainBuildingParameters := IChainBuildingParameters(outPtr)
        }

        return this.__IChainBuildingParameters.put_ValidationTimestamp(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RevocationCheckEnabled() {
        if (!this.HasProp("__IChainBuildingParameters")) {
            if ((queryResult := this.QueryInterface(IChainBuildingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChainBuildingParameters := IChainBuildingParameters(outPtr)
        }

        return this.__IChainBuildingParameters.get_RevocationCheckEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RevocationCheckEnabled(value) {
        if (!this.HasProp("__IChainBuildingParameters")) {
            if ((queryResult := this.QueryInterface(IChainBuildingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChainBuildingParameters := IChainBuildingParameters(outPtr)
        }

        return this.__IChainBuildingParameters.put_RevocationCheckEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_NetworkRetrievalEnabled() {
        if (!this.HasProp("__IChainBuildingParameters")) {
            if ((queryResult := this.QueryInterface(IChainBuildingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChainBuildingParameters := IChainBuildingParameters(outPtr)
        }

        return this.__IChainBuildingParameters.get_NetworkRetrievalEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_NetworkRetrievalEnabled(value) {
        if (!this.HasProp("__IChainBuildingParameters")) {
            if ((queryResult := this.QueryInterface(IChainBuildingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChainBuildingParameters := IChainBuildingParameters(outPtr)
        }

        return this.__IChainBuildingParameters.put_NetworkRetrievalEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AuthorityInformationAccessEnabled() {
        if (!this.HasProp("__IChainBuildingParameters")) {
            if ((queryResult := this.QueryInterface(IChainBuildingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChainBuildingParameters := IChainBuildingParameters(outPtr)
        }

        return this.__IChainBuildingParameters.get_AuthorityInformationAccessEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AuthorityInformationAccessEnabled(value) {
        if (!this.HasProp("__IChainBuildingParameters")) {
            if ((queryResult := this.QueryInterface(IChainBuildingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChainBuildingParameters := IChainBuildingParameters(outPtr)
        }

        return this.__IChainBuildingParameters.put_AuthorityInformationAccessEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CurrentTimeValidationEnabled() {
        if (!this.HasProp("__IChainBuildingParameters")) {
            if ((queryResult := this.QueryInterface(IChainBuildingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChainBuildingParameters := IChainBuildingParameters(outPtr)
        }

        return this.__IChainBuildingParameters.get_CurrentTimeValidationEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CurrentTimeValidationEnabled(value) {
        if (!this.HasProp("__IChainBuildingParameters")) {
            if ((queryResult := this.QueryInterface(IChainBuildingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChainBuildingParameters := IChainBuildingParameters(outPtr)
        }

        return this.__IChainBuildingParameters.put_CurrentTimeValidationEnabled(value)
    }

    /**
     * 
     * @returns {IVector<Certificate>} 
     */
    get_ExclusiveTrustRoots() {
        if (!this.HasProp("__IChainBuildingParameters")) {
            if ((queryResult := this.QueryInterface(IChainBuildingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChainBuildingParameters := IChainBuildingParameters(outPtr)
        }

        return this.__IChainBuildingParameters.get_ExclusiveTrustRoots()
    }

;@endregion Instance Methods
}
