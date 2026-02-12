#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICortanaSettings.ahk
#Include .\ICortanaSettingsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to Cortana settings.
 * @remarks
 * The CortanaSettings class requires the following be added to the Package.appmanifest:
 * 
 * - To \<Package\>
 *   - `IgnorableNamespaces="iot"`
 * - Under \<Capabilities\>
 *   - `<iot:Capability Name="systemManagement"/>`
 * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanasettings
 * @namespace Windows.Services.Cortana
 * @version WindowsRuntime 1.4
 */
class CortanaSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICortanaSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICortanaSettings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves whether Cortana settings are supported.
     * @remarks
     * The [CortanaSettings](cortanasettings.md) class requires the following be added to the Package.appmanifest:
     * 
     * - To \<Package\>
     *   - `IgnorableNamespaces="iot"`
     * - Under \<Capabilities\>
     *   - `<iot:Capability Name="systemManagement"/>`
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanasettings.issupported
     */
    static IsSupported() {
        if (!CortanaSettings.HasProp("__ICortanaSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Cortana.CortanaSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICortanaSettingsStatics.IID)
            CortanaSettings.__ICortanaSettingsStatics := ICortanaSettingsStatics(factoryPtr)
        }

        return CortanaSettings.__ICortanaSettingsStatics.IsSupported()
    }

    /**
     * Retrieves the Cortana settings for the current user.
     * @remarks
     * The [CortanaSettings](cortanasettings.md) class requires the following be added to the Package.appmanifest:
     * 
     * - To \<Package\>
     *   - `IgnorableNamespaces="iot"`
     * - Under \<Capabilities\>
     *   - `<iot:Capability Name="systemManagement"/>`
     * @returns {CortanaSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanasettings.getdefault
     */
    static GetDefault() {
        if (!CortanaSettings.HasProp("__ICortanaSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Cortana.CortanaSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICortanaSettingsStatics.IID)
            CortanaSettings.__ICortanaSettingsStatics := ICortanaSettingsStatics(factoryPtr)
        }

        return CortanaSettings.__ICortanaSettingsStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets whether the user has consented to voice activation.
     * @remarks
     * The [CortanaSettings](cortanasettings.md) class requires the following be added to the Package.appmanifest:
     * 
     * - To \<Package\>
     *   - `IgnorableNamespaces="iot"`
     * - Under \<Capabilities\>
     *   - `<iot:Capability Name="systemManagement"/>`
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanasettings.hasuserconsenttovoiceactivation
     * @type {Boolean} 
     */
    HasUserConsentToVoiceActivation {
        get => this.get_HasUserConsentToVoiceActivation()
    }

    /**
     * Gets or sets whether voice activation is enabled.
     * @remarks
     * The [CortanaSettings](cortanasettings.md) class requires the following be added to the Package.appmanifest:
     * 
     * - To \<Package\>
     *   - `IgnorableNamespaces="iot"`
     * - Under \<Capabilities\>
     *   - `<iot:Capability Name="systemManagement"/>`
     * @see https://learn.microsoft.com/uwp/api/windows.services.cortana.cortanasettings.isvoiceactivationenabled
     * @type {Boolean} 
     */
    IsVoiceActivationEnabled {
        get => this.get_IsVoiceActivationEnabled()
        set => this.put_IsVoiceActivationEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasUserConsentToVoiceActivation() {
        if (!this.HasProp("__ICortanaSettings")) {
            if ((queryResult := this.QueryInterface(ICortanaSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaSettings := ICortanaSettings(outPtr)
        }

        return this.__ICortanaSettings.get_HasUserConsentToVoiceActivation()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVoiceActivationEnabled() {
        if (!this.HasProp("__ICortanaSettings")) {
            if ((queryResult := this.QueryInterface(ICortanaSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaSettings := ICortanaSettings(outPtr)
        }

        return this.__ICortanaSettings.get_IsVoiceActivationEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsVoiceActivationEnabled(value) {
        if (!this.HasProp("__ICortanaSettings")) {
            if ((queryResult := this.QueryInterface(ICortanaSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICortanaSettings := ICortanaSettings(outPtr)
        }

        return this.__ICortanaSettings.put_IsVoiceActivationEnabled(value)
    }

;@endregion Instance Methods
}
