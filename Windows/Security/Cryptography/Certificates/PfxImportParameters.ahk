#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPfxImportParameters.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents PFX import parameters.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.pfximportparameters
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class PfxImportParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPfxImportParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPfxImportParameters.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the export option.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.pfximportparameters.exportable
     * @type {Integer} 
     */
    Exportable {
        get => this.get_Exportable()
        set => this.put_Exportable(value)
    }

    /**
     * Gets or sets the key protection level.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.pfximportparameters.keyprotectionlevel
     * @type {Integer} 
     */
    KeyProtectionLevel {
        get => this.get_KeyProtectionLevel()
        set => this.put_KeyProtectionLevel(value)
    }

    /**
     * Gets or sets the install options.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.pfximportparameters.installoptions
     * @type {Integer} 
     */
    InstallOptions {
        get => this.get_InstallOptions()
        set => this.put_InstallOptions(value)
    }

    /**
     * Gets or sets the friendly name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.pfximportparameters.friendlyname
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
        set => this.put_FriendlyName(value)
    }

    /**
     * Gets or sets the key storage provider name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.pfximportparameters.keystorageprovidername
     * @type {HSTRING} 
     */
    KeyStorageProviderName {
        get => this.get_KeyStorageProviderName()
        set => this.put_KeyStorageProviderName(value)
    }

    /**
     * Gets or sets the container name prefix.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.pfximportparameters.containernameprefix
     * @type {HSTRING} 
     */
    ContainerNamePrefix {
        get => this.get_ContainerNamePrefix()
        set => this.put_ContainerNamePrefix(value)
    }

    /**
     * Gets or sets the reader name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.pfximportparameters.readername
     * @type {HSTRING} 
     */
    ReaderName {
        get => this.get_ReaderName()
        set => this.put_ReaderName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [PfxImportParameters](pfximportparameters.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.PfxImportParameters")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Exportable() {
        if (!this.HasProp("__IPfxImportParameters")) {
            if ((queryResult := this.QueryInterface(IPfxImportParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPfxImportParameters := IPfxImportParameters(outPtr)
        }

        return this.__IPfxImportParameters.get_Exportable()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Exportable(value) {
        if (!this.HasProp("__IPfxImportParameters")) {
            if ((queryResult := this.QueryInterface(IPfxImportParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPfxImportParameters := IPfxImportParameters(outPtr)
        }

        return this.__IPfxImportParameters.put_Exportable(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyProtectionLevel() {
        if (!this.HasProp("__IPfxImportParameters")) {
            if ((queryResult := this.QueryInterface(IPfxImportParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPfxImportParameters := IPfxImportParameters(outPtr)
        }

        return this.__IPfxImportParameters.get_KeyProtectionLevel()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_KeyProtectionLevel(value) {
        if (!this.HasProp("__IPfxImportParameters")) {
            if ((queryResult := this.QueryInterface(IPfxImportParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPfxImportParameters := IPfxImportParameters(outPtr)
        }

        return this.__IPfxImportParameters.put_KeyProtectionLevel(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InstallOptions() {
        if (!this.HasProp("__IPfxImportParameters")) {
            if ((queryResult := this.QueryInterface(IPfxImportParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPfxImportParameters := IPfxImportParameters(outPtr)
        }

        return this.__IPfxImportParameters.get_InstallOptions()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InstallOptions(value) {
        if (!this.HasProp("__IPfxImportParameters")) {
            if ((queryResult := this.QueryInterface(IPfxImportParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPfxImportParameters := IPfxImportParameters(outPtr)
        }

        return this.__IPfxImportParameters.put_InstallOptions(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FriendlyName() {
        if (!this.HasProp("__IPfxImportParameters")) {
            if ((queryResult := this.QueryInterface(IPfxImportParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPfxImportParameters := IPfxImportParameters(outPtr)
        }

        return this.__IPfxImportParameters.get_FriendlyName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_FriendlyName(value) {
        if (!this.HasProp("__IPfxImportParameters")) {
            if ((queryResult := this.QueryInterface(IPfxImportParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPfxImportParameters := IPfxImportParameters(outPtr)
        }

        return this.__IPfxImportParameters.put_FriendlyName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyStorageProviderName() {
        if (!this.HasProp("__IPfxImportParameters")) {
            if ((queryResult := this.QueryInterface(IPfxImportParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPfxImportParameters := IPfxImportParameters(outPtr)
        }

        return this.__IPfxImportParameters.get_KeyStorageProviderName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_KeyStorageProviderName(value) {
        if (!this.HasProp("__IPfxImportParameters")) {
            if ((queryResult := this.QueryInterface(IPfxImportParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPfxImportParameters := IPfxImportParameters(outPtr)
        }

        return this.__IPfxImportParameters.put_KeyStorageProviderName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContainerNamePrefix() {
        if (!this.HasProp("__IPfxImportParameters")) {
            if ((queryResult := this.QueryInterface(IPfxImportParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPfxImportParameters := IPfxImportParameters(outPtr)
        }

        return this.__IPfxImportParameters.get_ContainerNamePrefix()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContainerNamePrefix(value) {
        if (!this.HasProp("__IPfxImportParameters")) {
            if ((queryResult := this.QueryInterface(IPfxImportParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPfxImportParameters := IPfxImportParameters(outPtr)
        }

        return this.__IPfxImportParameters.put_ContainerNamePrefix(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ReaderName() {
        if (!this.HasProp("__IPfxImportParameters")) {
            if ((queryResult := this.QueryInterface(IPfxImportParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPfxImportParameters := IPfxImportParameters(outPtr)
        }

        return this.__IPfxImportParameters.get_ReaderName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ReaderName(value) {
        if (!this.HasProp("__IPfxImportParameters")) {
            if ((queryResult := this.QueryInterface(IPfxImportParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPfxImportParameters := IPfxImportParameters(outPtr)
        }

        return this.__IPfxImportParameters.put_ReaderName(value)
    }

;@endregion Instance Methods
}
