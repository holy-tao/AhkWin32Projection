#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioEffectsPackConfiguration.ahk
#Include .\IAudioEffectsPackConfigurationStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AudioEffectsPackConfiguration.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a single effects pack on a single audio endpoint.
 * @remarks
 * This class can be used by OEM Hardware Support Application (HSA) applications to query for their effects pack’s status on a given audio endpoint. Using this class, OEM's can only query for the status of their own effects packs, specified with an OEM-defined ID. The API does not allow for the setting of effects packs.
 * 
 * Get an instance of this class by calling [AudioEffectsPackConfiguration.GetForEffectsPackOnDeviceId](xref:Windows.Media.Audio.AudioEffectsPackConfiguration.GetForEffectsPackOnDeviceId(System.String,System.String)).
 * 
 * A given **AudioEffectsPackConfiguration** object represents a single effects pack on a single endpoint. Applications must create an **AudioEffectsPackConfiguration** instance for each effects pack, audio endpoint pair they want to query.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioeffectspackconfiguration
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioEffectsPackConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioEffectsPackConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioEffectsPackConfiguration.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an instance of the [AudioEffectsPackConfiguration](xref:Windows.Media.Audio.AudioEffectsPackConfiguration) class for the specified audio effects pack and audio endpoint.
     * @remarks
     * A given **AudioEffectsPackConfiguration** object represents a single effects pack on a single endpoint. Applications must create an **AudioEffectsPackConfiguration** instance for each effects pack, audio endpoint pair they want to query.
     * @param {HSTRING} effectsPackId The OEM-specified audio effects pack ID associated with the new **AudioEffectsPackConfiguration** object.
     * @param {HSTRING} deviceId The device ID associated with the new **AudioEffectsPackConfiguration** object.
     * @returns {AudioEffectsPackConfiguration} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioeffectspackconfiguration.getfordeviceid
     */
    static GetForDeviceId(effectsPackId, deviceId) {
        if (!AudioEffectsPackConfiguration.HasProp("__IAudioEffectsPackConfigurationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioEffectsPackConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioEffectsPackConfigurationStatics.IID)
            AudioEffectsPackConfiguration.__IAudioEffectsPackConfigurationStatics := IAudioEffectsPackConfigurationStatics(factoryPtr)
        }

        return AudioEffectsPackConfiguration.__IAudioEffectsPackConfigurationStatics.GetForDeviceId(effectsPackId, deviceId)
    }

    /**
     * Gets a boolean value indicating if the supplied audio effects pack ID is applicable to audio endpoint with the specified device ID.
     * @param {HSTRING} effectsPackId The OEM-specified ID of the audio effects pack for the query.
     * @param {HSTRING} deviceId The device ID of the audio endpoint for the query.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioeffectspackconfiguration.isdeviceidsupported
     */
    static IsDeviceIdSupported(effectsPackId, deviceId) {
        if (!AudioEffectsPackConfiguration.HasProp("__IAudioEffectsPackConfigurationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioEffectsPackConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioEffectsPackConfigurationStatics.IID)
            AudioEffectsPackConfiguration.__IAudioEffectsPackConfigurationStatics := IAudioEffectsPackConfigurationStatics(factoryPtr)
        }

        return AudioEffectsPackConfiguration.__IAudioEffectsPackConfigurationStatics.IsDeviceIdSupported(effectsPackId, deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the audio endpoint ID of the audio effects pack associated with the [AudioEffectsPackConfiguration](xref:Windows.Media.Audio.AudioEffectsPackConfiguration) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioeffectspackconfiguration.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the OEM-specified ID of the audio effects pack associated with the [AudioEffectsPackConfiguration](xref:Windows.Media.Audio.AudioEffectsPackConfiguration) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioeffectspackconfiguration.effectspackid
     * @type {HSTRING} 
     */
    EffectsPackId {
        get => this.get_EffectsPackId()
    }

    /**
     * Gets a value from the [AudioEffectsPackStatus](xref:Windows.Media.Audio.AudioEffectsPackStatus) enumeration specifying whether the associated audio effects pack is supported and whether it is currently enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioeffectspackconfiguration.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Raised when the status of the audio effects pack associated with the [AudioEffectsPackConfiguration](xref:Windows.Media.Audio.AudioEffectsPackConfiguration) object changes.
     * @type {TypedEventHandler<AudioEffectsPackConfiguration, IInspectable>}
    */
    OnStatusChanged {
        get {
            if(!this.HasProp("__OnStatusChanged")){
                this.__OnStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{41cdcf69-8822-5062-af8b-68e32ef9884d}"),
                    AudioEffectsPackConfiguration,
                    IInspectable
                )
                this.__OnStatusChangedToken := this.add_StatusChanged(this.__OnStatusChanged.iface)
            }
            return this.__OnStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStatusChangedToken")) {
            this.remove_StatusChanged(this.__OnStatusChangedToken)
            this.__OnStatusChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IAudioEffectsPackConfiguration")) {
            if ((queryResult := this.QueryInterface(IAudioEffectsPackConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEffectsPackConfiguration := IAudioEffectsPackConfiguration(outPtr)
        }

        return this.__IAudioEffectsPackConfiguration.get_DeviceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EffectsPackId() {
        if (!this.HasProp("__IAudioEffectsPackConfiguration")) {
            if ((queryResult := this.QueryInterface(IAudioEffectsPackConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEffectsPackConfiguration := IAudioEffectsPackConfiguration(outPtr)
        }

        return this.__IAudioEffectsPackConfiguration.get_EffectsPackId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IAudioEffectsPackConfiguration")) {
            if ((queryResult := this.QueryInterface(IAudioEffectsPackConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEffectsPackConfiguration := IAudioEffectsPackConfiguration(outPtr)
        }

        return this.__IAudioEffectsPackConfiguration.get_Status()
    }

    /**
     * 
     * @param {TypedEventHandler<AudioEffectsPackConfiguration, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusChanged(handler) {
        if (!this.HasProp("__IAudioEffectsPackConfiguration")) {
            if ((queryResult := this.QueryInterface(IAudioEffectsPackConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEffectsPackConfiguration := IAudioEffectsPackConfiguration(outPtr)
        }

        return this.__IAudioEffectsPackConfiguration.add_StatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusChanged(token) {
        if (!this.HasProp("__IAudioEffectsPackConfiguration")) {
            if ((queryResult := this.QueryInterface(IAudioEffectsPackConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioEffectsPackConfiguration := IAudioEffectsPackConfiguration(outPtr)
        }

        return this.__IAudioEffectsPackConfiguration.remove_StatusChanged(token)
    }

;@endregion Instance Methods
}
