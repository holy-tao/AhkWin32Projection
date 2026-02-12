#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialAudioDeviceConfiguration.ahk
#Include .\ISpatialAudioDeviceConfigurationStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SpatialAudioDeviceConfiguration.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a audio device, providing information and control for its current spatial audio setup.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudiodeviceconfiguration
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class SpatialAudioDeviceConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialAudioDeviceConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialAudioDeviceConfiguration.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a SpatialAudioDeviceConfiguration for the given device ID.
     * @param {HSTRING} deviceId The device ID of the device to represent.
     * @returns {SpatialAudioDeviceConfiguration} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudiodeviceconfiguration.getfordeviceid
     */
    static GetForDeviceId(deviceId) {
        if (!SpatialAudioDeviceConfiguration.HasProp("__ISpatialAudioDeviceConfigurationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.SpatialAudioDeviceConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAudioDeviceConfigurationStatics.IID)
            SpatialAudioDeviceConfiguration.__ISpatialAudioDeviceConfigurationStatics := ISpatialAudioDeviceConfigurationStatics(factoryPtr)
        }

        return SpatialAudioDeviceConfiguration.__ISpatialAudioDeviceConfigurationStatics.GetForDeviceId(deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The ID of the device this object represents.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudiodeviceconfiguration.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Specifies whether this device can support any form of spatial audio.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudiodeviceconfiguration.isspatialaudiosupported
     * @type {Boolean} 
     */
    IsSpatialAudioSupported {
        get => this.get_IsSpatialAudioSupported()
    }

    /**
     * Provides the currently active spatial audio format for this device. This could have been changed by the system and therefore may not be the same as the default.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudiodeviceconfiguration.activespatialaudioformat
     * @type {HSTRING} 
     */
    ActiveSpatialAudioFormat {
        get => this.get_ActiveSpatialAudioFormat()
    }

    /**
     * Provides the default spatial audio format for this device. This is the format the user has selected.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudiodeviceconfiguration.defaultspatialaudioformat
     * @type {HSTRING} 
     */
    DefaultSpatialAudioFormat {
        get => this.get_DefaultSpatialAudioFormat()
    }

    /**
     * Occurs when the spatial audio state of the device has changed.
     * @type {TypedEventHandler<SpatialAudioDeviceConfiguration, IInspectable>}
    */
    OnConfigurationChanged {
        get {
            if(!this.HasProp("__OnConfigurationChanged")){
                this.__OnConfigurationChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{34cb725d-d620-5c8d-97f6-a3ebdff1f964}"),
                    SpatialAudioDeviceConfiguration,
                    IInspectable
                )
                this.__OnConfigurationChangedToken := this.add_ConfigurationChanged(this.__OnConfigurationChanged.iface)
            }
            return this.__OnConfigurationChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnConfigurationChangedToken")) {
            this.remove_ConfigurationChanged(this.__OnConfigurationChangedToken)
            this.__OnConfigurationChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ISpatialAudioDeviceConfiguration")) {
            if ((queryResult := this.QueryInterface(ISpatialAudioDeviceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAudioDeviceConfiguration := ISpatialAudioDeviceConfiguration(outPtr)
        }

        return this.__ISpatialAudioDeviceConfiguration.get_DeviceId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSpatialAudioSupported() {
        if (!this.HasProp("__ISpatialAudioDeviceConfiguration")) {
            if ((queryResult := this.QueryInterface(ISpatialAudioDeviceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAudioDeviceConfiguration := ISpatialAudioDeviceConfiguration(outPtr)
        }

        return this.__ISpatialAudioDeviceConfiguration.get_IsSpatialAudioSupported()
    }

    /**
     * Specifies whether this device can support the given spatial audio format.
     * @param {HSTRING} subtype A string of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the spatial audo format to check. SpatialAudioFormatSubtype enum will return the neccesary strings.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudiodeviceconfiguration.isspatialaudioformatsupported
     */
    IsSpatialAudioFormatSupported(subtype) {
        if (!this.HasProp("__ISpatialAudioDeviceConfiguration")) {
            if ((queryResult := this.QueryInterface(ISpatialAudioDeviceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAudioDeviceConfiguration := ISpatialAudioDeviceConfiguration(outPtr)
        }

        return this.__ISpatialAudioDeviceConfiguration.IsSpatialAudioFormatSupported(subtype)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ActiveSpatialAudioFormat() {
        if (!this.HasProp("__ISpatialAudioDeviceConfiguration")) {
            if ((queryResult := this.QueryInterface(ISpatialAudioDeviceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAudioDeviceConfiguration := ISpatialAudioDeviceConfiguration(outPtr)
        }

        return this.__ISpatialAudioDeviceConfiguration.get_ActiveSpatialAudioFormat()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DefaultSpatialAudioFormat() {
        if (!this.HasProp("__ISpatialAudioDeviceConfiguration")) {
            if ((queryResult := this.QueryInterface(ISpatialAudioDeviceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAudioDeviceConfiguration := ISpatialAudioDeviceConfiguration(outPtr)
        }

        return this.__ISpatialAudioDeviceConfiguration.get_DefaultSpatialAudioFormat()
    }

    /**
     * Tries to set the specified spatial audio format for this device. The caller must be the app that owns this spatial audio format.
     * @param {HSTRING} subtype A string of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the spatial audio format to set. SpatialAudioFormatSubtype enum will return the neccesary string.
     * @returns {IAsyncOperation<SetDefaultSpatialAudioFormatResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudiodeviceconfiguration.setdefaultspatialaudioformatasync
     */
    SetDefaultSpatialAudioFormatAsync(subtype) {
        if (!this.HasProp("__ISpatialAudioDeviceConfiguration")) {
            if ((queryResult := this.QueryInterface(ISpatialAudioDeviceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAudioDeviceConfiguration := ISpatialAudioDeviceConfiguration(outPtr)
        }

        return this.__ISpatialAudioDeviceConfiguration.SetDefaultSpatialAudioFormatAsync(subtype)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialAudioDeviceConfiguration, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ConfigurationChanged(handler) {
        if (!this.HasProp("__ISpatialAudioDeviceConfiguration")) {
            if ((queryResult := this.QueryInterface(ISpatialAudioDeviceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAudioDeviceConfiguration := ISpatialAudioDeviceConfiguration(outPtr)
        }

        return this.__ISpatialAudioDeviceConfiguration.add_ConfigurationChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ConfigurationChanged(token) {
        if (!this.HasProp("__ISpatialAudioDeviceConfiguration")) {
            if ((queryResult := this.QueryInterface(ISpatialAudioDeviceConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAudioDeviceConfiguration := ISpatialAudioDeviceConfiguration(outPtr)
        }

        return this.__ISpatialAudioDeviceConfiguration.remove_ConfigurationChanged(token)
    }

;@endregion Instance Methods
}
