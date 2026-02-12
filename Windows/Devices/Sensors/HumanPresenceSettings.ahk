#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHumanPresenceSettings.ahk
#Include .\IHumanPresenceSettings2.ahk
#Include .\IHumanPresenceSettings3.ahk
#Include .\IHumanPresenceSettingsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the various human presence system settings.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class HumanPresenceSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHumanPresenceSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHumanPresenceSettings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Asynchronously retrieves the current system settings for human presence detection.
     * @returns {IAsyncOperation<HumanPresenceSettings>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.getcurrentsettingsasync
     */
    static GetCurrentSettingsAsync() {
        if (!HumanPresenceSettings.HasProp("__IHumanPresenceSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HumanPresenceSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHumanPresenceSettingsStatics.IID)
            HumanPresenceSettings.__IHumanPresenceSettingsStatics := IHumanPresenceSettingsStatics(factoryPtr)
        }

        return HumanPresenceSettings.__IHumanPresenceSettingsStatics.GetCurrentSettingsAsync()
    }

    /**
     * Retrieves the current system settings for human presence detection.
     * @returns {HumanPresenceSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.getcurrentsettings
     */
    static GetCurrentSettings() {
        if (!HumanPresenceSettings.HasProp("__IHumanPresenceSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HumanPresenceSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHumanPresenceSettingsStatics.IID)
            HumanPresenceSettings.__IHumanPresenceSettingsStatics := IHumanPresenceSettingsStatics(factoryPtr)
        }

        return HumanPresenceSettings.__IHumanPresenceSettingsStatics.GetCurrentSettings()
    }

    /**
     * Asynchronously updates various human presence system settings with the provided values.
     * @param {HumanPresenceSettings} settings The values used to update the human presence system settings.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.updatesettingsasync
     */
    static UpdateSettingsAsync(settings) {
        if (!HumanPresenceSettings.HasProp("__IHumanPresenceSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HumanPresenceSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHumanPresenceSettingsStatics.IID)
            HumanPresenceSettings.__IHumanPresenceSettingsStatics := IHumanPresenceSettingsStatics(factoryPtr)
        }

        return HumanPresenceSettings.__IHumanPresenceSettingsStatics.UpdateSettingsAsync(settings)
    }

    /**
     * Bulk updates various human presence system settings with the provided values.
     * @param {HumanPresenceSettings} settings The values used to update the human presence system settings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.updatesettings
     */
    static UpdateSettings(settings) {
        if (!HumanPresenceSettings.HasProp("__IHumanPresenceSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HumanPresenceSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHumanPresenceSettingsStatics.IID)
            HumanPresenceSettings.__IHumanPresenceSettingsStatics := IHumanPresenceSettingsStatics(factoryPtr)
        }

        return HumanPresenceSettings.__IHumanPresenceSettingsStatics.UpdateSettings(settings)
    }

    /**
     * Asynchronously retrieves the features supported by the specified human presence sensor.
     * @param {HSTRING} sensorId The unique ID of the human presence sensor.
     * @returns {IAsyncOperation<HumanPresenceFeatures>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.getsupportedfeaturesforsensoridasync
     */
    static GetSupportedFeaturesForSensorIdAsync(sensorId) {
        if (!HumanPresenceSettings.HasProp("__IHumanPresenceSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HumanPresenceSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHumanPresenceSettingsStatics.IID)
            HumanPresenceSettings.__IHumanPresenceSettingsStatics := IHumanPresenceSettingsStatics(factoryPtr)
        }

        return HumanPresenceSettings.__IHumanPresenceSettingsStatics.GetSupportedFeaturesForSensorIdAsync(sensorId)
    }

    /**
     * Retrieves the features supported by the specified human presence sensor.
     * @param {HSTRING} sensorId The unique ID of the human presence sensor.
     * @returns {HumanPresenceFeatures} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.getsupportedfeaturesforsensorid
     */
    static GetSupportedFeaturesForSensorId(sensorId) {
        if (!HumanPresenceSettings.HasProp("__IHumanPresenceSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HumanPresenceSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHumanPresenceSettingsStatics.IID)
            HumanPresenceSettings.__IHumanPresenceSettingsStatics := IHumanPresenceSettingsStatics(factoryPtr)
        }

        return HumanPresenceSettings.__IHumanPresenceSettingsStatics.GetSupportedFeaturesForSensorId(sensorId)
    }

    /**
     * Retrieves the collection of intervals (from the system settings) used to specify how much time should pass before locking the PC after a user is no longer detected.
     * @remarks
     * Use [LockOnLeaveTimeout](humanpresencesettings_lockonleavetimeout.md) to get the currently selected interval.
     * @returns {IVectorView<TimeSpan>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.getsupportedlockonleavetimeouts
     */
    static GetSupportedLockOnLeaveTimeouts() {
        if (!HumanPresenceSettings.HasProp("__IHumanPresenceSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HumanPresenceSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHumanPresenceSettingsStatics.IID)
            HumanPresenceSettings.__IHumanPresenceSettingsStatics := IHumanPresenceSettingsStatics(factoryPtr)
        }

        return HumanPresenceSettings.__IHumanPresenceSettingsStatics.GetSupportedLockOnLeaveTimeouts()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_SettingsChanged(handler) {
        if (!HumanPresenceSettings.HasProp("__IHumanPresenceSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HumanPresenceSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHumanPresenceSettingsStatics.IID)
            HumanPresenceSettings.__IHumanPresenceSettingsStatics := IHumanPresenceSettingsStatics(factoryPtr)
        }

        return HumanPresenceSettings.__IHumanPresenceSettingsStatics.add_SettingsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_SettingsChanged(token) {
        if (!HumanPresenceSettings.HasProp("__IHumanPresenceSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HumanPresenceSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHumanPresenceSettingsStatics.IID)
            HumanPresenceSettings.__IHumanPresenceSettingsStatics := IHumanPresenceSettingsStatics(factoryPtr)
        }

        return HumanPresenceSettings.__IHumanPresenceSettingsStatics.remove_SettingsChanged(token)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the unique ID of the human presence sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.sensorid
     * @type {HSTRING} 
     */
    SensorId {
        get => this.get_SensorId()
        set => this.put_SensorId(value)
    }

    /**
     * Gets or sets whether the human presence sensor can wake the PC if it detects the user is approaching.
     * @remarks
     * [HumanPresenceFeatures.IsWakeOnApproachSupported](humanpresencefeatures_iswakeonapproachsupported.md), [HumanPresenceFeatures.SupportedWakeOrLockDistancesInMillimeters](humanpresencefeatures_supportedwakeorlockdistancesinmillimeters.md), [WakeOnApproachDistanceInMillimeters](humanpresencesettings_wakeonapproachdistanceinmillimeters.md)
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.iswakeonapproachenabled
     * @type {Boolean} 
     */
    IsWakeOnApproachEnabled {
        get => this.get_IsWakeOnApproachEnabled()
        set => this.put_IsWakeOnApproachEnabled(value)
    }

    /**
     * Gets or sets the distance a user must be from the human presence sensor for the PC to automatically unlock.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.wakeonapproachdistanceinmillimeters
     * @type {IReference<Integer>} 
     */
    WakeOnApproachDistanceInMillimeters {
        get => this.get_WakeOnApproachDistanceInMillimeters()
        set => this.put_WakeOnApproachDistanceInMillimeters(value)
    }

    /**
     * Gets or sets whether the human presence sensor can lock the PC if it detects the user has left it unattended.
     * @remarks
     * [HumanPresenceFeatures.IsLockOnLeaveSupported](humanpresencefeatures_islockonleavesupported.md), [HumanPresenceFeatures.SupportedWakeOrLockDistancesInMillimeters](humanpresencefeatures_supportedwakeorlockdistancesinmillimeters.md), [GetSupportedLockOnLeaveTimeouts](humanpresencesettings_getsupportedlockonleavetimeouts_1901163210.md), [LockOnLeaveDistanceInMillimeters](humanpresencesettings_lockonleavedistanceinmillimeters.md), [LockOnLeaveTimeout](humanpresencesettings_lockonleavetimeout.md)
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.islockonleaveenabled
     * @type {Boolean} 
     */
    IsLockOnLeaveEnabled {
        get => this.get_IsLockOnLeaveEnabled()
        set => this.put_IsLockOnLeaveEnabled(value)
    }

    /**
     * Gets or sets the distance a user must be from the human presence sensor for the PC to be considered unattended and automatically lock.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.lockonleavedistanceinmillimeters
     * @type {IReference<Integer>} 
     */
    LockOnLeaveDistanceInMillimeters {
        get => this.get_LockOnLeaveDistanceInMillimeters()
        set => this.put_LockOnLeaveDistanceInMillimeters(value)
    }

    /**
     * Gets or sets the time interval a user must go undetected by the human presence sensor before the PC is considered unattended and automatically locked.
     * @remarks
     * Use [GetSupportedLockOnLeaveTimeouts](humanpresencesettings_getsupportedlockonleavetimeouts_1901163210.md) to retrieve the collection of intervals supported by the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.lockonleavetimeout
     * @type {TimeSpan} 
     */
    LockOnLeaveTimeout {
        get => this.get_LockOnLeaveTimeout()
        set => this.put_LockOnLeaveTimeout(value)
    }

    /**
     * This property is obsolete. For more information, see **Remarks**.
     * 
     * Gets or sets whether the human presence sensor can dim the screen of the PC when user interaction is not detected for a period of time.
     * @remarks
     * > **Obsolete as of the May Moment update for Windows 11, Version 22H2, Build 22621.**
     * >
     * > We recommend using the AdaptiveDimming APIs instead of the AttentionAwareDimming APIs ([IsAttentionAwareDimmingSupported](humanpresencefeatures_isattentionawaredimmingsupported.md), [IsAttentionAwareDimmingEnabled](humanpresencesettings_isattentionawaredimmingenabled.md)), which are now obsolete.
     * 
     * The user can specify their preferred dimming behavior in the System settings (see [Launch Windows Settings](/windows/apps/develop/launch/launch-settings#system)).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.isattentionawaredimmingenabled
     * @type {Boolean} 
     */
    IsAttentionAwareDimmingEnabled {
        get => this.get_IsAttentionAwareDimmingEnabled()
        set => this.put_IsAttentionAwareDimmingEnabled(value)
    }

    /**
     * Gets or sets whether adaptive dimming is enabled.
     * @remarks
     * **Introduced in the May Moment update for Windows 11, Version 22H2, Build 22621.**
     * 
     * We recommend using the AdaptiveDimming APIs instead of the AttentionAwareDimming APIs ([IsAttentionAwareDimmingSupported](humanpresencefeatures_isattentionawaredimmingsupported.md), [IsAttentionAwareDimmingEnabled](humanpresencesettings_isattentionawaredimmingenabled.md)), which are now obsolete.
     * 
     * The user can specify their preferred dimming behavior in the System settings (see [Launch Windows Settings](/windows/apps/develop/launch/launch-settings#system)).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.isadaptivedimmingenabled
     * @type {Boolean} 
     */
    IsAdaptiveDimmingEnabled {
        get => this.get_IsAdaptiveDimmingEnabled()
        set => this.put_IsAdaptiveDimmingEnabled(value)
    }

    /**
     * Gets the wake options (whether a user is detected by the human presence sensor) for the human presence sensor.
     * @remarks
     * **Introduced in the May Moment update for Windows 11, Version 22H2, Build 22621.**
     * 
     * The user can specify their preferred wake behavior in the System settings (see [Launch Windows Settings](/windows/apps/develop/launch/launch-settings#system)).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.wakeoptions
     * @type {WakeOnApproachOptions} 
     */
    WakeOptions {
        get => this.get_WakeOptions()
    }

    /**
     * Gets the adaptive dimming options for the human presence sensor.
     * @remarks
     * **Introduced in the May Moment update for Windows 11, Version 22H2, Build 22621.**
     * 
     * The user can specify their preferred dimming behavior in the System settings (see [Launch Windows Settings](/windows/apps/develop/launch/launch-settings#system)).
     * 
     * We recommend using the AdaptiveDimming APIs instead of the AttentionAwareDimming APIs ([IsAttentionAwareDimmingSupported](humanpresencefeatures_isattentionawaredimmingsupported.md), [IsAttentionAwareDimmingEnabled](humanpresencesettings_isattentionawaredimmingenabled.md)).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.dimmingoptions
     * @type {AdaptiveDimmingOptions} 
     */
    DimmingOptions {
        get => this.get_DimmingOptions()
    }

    /**
     * Gets the lock on leave options (whether a user is no longer detected by the human presence sensor) for the human presence sensor.
     * @remarks
     * **Introduced in the May Moment update for Windows 11, Version 22H2, Build 22621.**
     * 
     * The user can specify their preferred lock on leave behavior in the System settings (see [Launch Windows Settings](/windows/apps/develop/launch/launch-settings#system)).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.lockoptions
     * @type {LockOnLeaveOptions} 
     */
    LockOptions {
        get => this.get_LockOptions()
    }

    /**
     * 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.isonlookerdetectionenabled
     * @type {Boolean} 
     */
    IsOnlookerDetectionEnabled {
        get => this.get_IsOnlookerDetectionEnabled()
        set => this.put_IsOnlookerDetectionEnabled(value)
    }

    /**
     * Gets the onlooker detection options for the human presence sensor.
     * @remarks
     * The user can specify their preferred onlooker detection behavior in the System settings (see [Launch Windows Settings](/windows/apps/develop/launch/launch-settings#system)).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesettings.onlookerdetectionoptions
     * @type {OnlookerDetectionOptions} 
     */
    OnlookerDetectionOptions {
        get => this.get_OnlookerDetectionOptions()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SensorId() {
        if (!this.HasProp("__IHumanPresenceSettings")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings := IHumanPresenceSettings(outPtr)
        }

        return this.__IHumanPresenceSettings.get_SensorId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SensorId(value) {
        if (!this.HasProp("__IHumanPresenceSettings")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings := IHumanPresenceSettings(outPtr)
        }

        return this.__IHumanPresenceSettings.put_SensorId(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWakeOnApproachEnabled() {
        if (!this.HasProp("__IHumanPresenceSettings")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings := IHumanPresenceSettings(outPtr)
        }

        return this.__IHumanPresenceSettings.get_IsWakeOnApproachEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsWakeOnApproachEnabled(value) {
        if (!this.HasProp("__IHumanPresenceSettings")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings := IHumanPresenceSettings(outPtr)
        }

        return this.__IHumanPresenceSettings.put_IsWakeOnApproachEnabled(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_WakeOnApproachDistanceInMillimeters() {
        if (!this.HasProp("__IHumanPresenceSettings")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings := IHumanPresenceSettings(outPtr)
        }

        return this.__IHumanPresenceSettings.get_WakeOnApproachDistanceInMillimeters()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_WakeOnApproachDistanceInMillimeters(value) {
        if (!this.HasProp("__IHumanPresenceSettings")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings := IHumanPresenceSettings(outPtr)
        }

        return this.__IHumanPresenceSettings.put_WakeOnApproachDistanceInMillimeters(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLockOnLeaveEnabled() {
        if (!this.HasProp("__IHumanPresenceSettings")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings := IHumanPresenceSettings(outPtr)
        }

        return this.__IHumanPresenceSettings.get_IsLockOnLeaveEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsLockOnLeaveEnabled(value) {
        if (!this.HasProp("__IHumanPresenceSettings")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings := IHumanPresenceSettings(outPtr)
        }

        return this.__IHumanPresenceSettings.put_IsLockOnLeaveEnabled(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_LockOnLeaveDistanceInMillimeters() {
        if (!this.HasProp("__IHumanPresenceSettings")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings := IHumanPresenceSettings(outPtr)
        }

        return this.__IHumanPresenceSettings.get_LockOnLeaveDistanceInMillimeters()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_LockOnLeaveDistanceInMillimeters(value) {
        if (!this.HasProp("__IHumanPresenceSettings")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings := IHumanPresenceSettings(outPtr)
        }

        return this.__IHumanPresenceSettings.put_LockOnLeaveDistanceInMillimeters(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_LockOnLeaveTimeout() {
        if (!this.HasProp("__IHumanPresenceSettings")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings := IHumanPresenceSettings(outPtr)
        }

        return this.__IHumanPresenceSettings.get_LockOnLeaveTimeout()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_LockOnLeaveTimeout(value) {
        if (!this.HasProp("__IHumanPresenceSettings")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings := IHumanPresenceSettings(outPtr)
        }

        return this.__IHumanPresenceSettings.put_LockOnLeaveTimeout(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAttentionAwareDimmingEnabled() {
        if (!this.HasProp("__IHumanPresenceSettings")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings := IHumanPresenceSettings(outPtr)
        }

        return this.__IHumanPresenceSettings.get_IsAttentionAwareDimmingEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAttentionAwareDimmingEnabled(value) {
        if (!this.HasProp("__IHumanPresenceSettings")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings := IHumanPresenceSettings(outPtr)
        }

        return this.__IHumanPresenceSettings.put_IsAttentionAwareDimmingEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAdaptiveDimmingEnabled() {
        if (!this.HasProp("__IHumanPresenceSettings2")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings2 := IHumanPresenceSettings2(outPtr)
        }

        return this.__IHumanPresenceSettings2.get_IsAdaptiveDimmingEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAdaptiveDimmingEnabled(value) {
        if (!this.HasProp("__IHumanPresenceSettings2")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings2 := IHumanPresenceSettings2(outPtr)
        }

        return this.__IHumanPresenceSettings2.put_IsAdaptiveDimmingEnabled(value)
    }

    /**
     * 
     * @returns {WakeOnApproachOptions} 
     */
    get_WakeOptions() {
        if (!this.HasProp("__IHumanPresenceSettings2")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings2 := IHumanPresenceSettings2(outPtr)
        }

        return this.__IHumanPresenceSettings2.get_WakeOptions()
    }

    /**
     * 
     * @returns {AdaptiveDimmingOptions} 
     */
    get_DimmingOptions() {
        if (!this.HasProp("__IHumanPresenceSettings2")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings2 := IHumanPresenceSettings2(outPtr)
        }

        return this.__IHumanPresenceSettings2.get_DimmingOptions()
    }

    /**
     * 
     * @returns {LockOnLeaveOptions} 
     */
    get_LockOptions() {
        if (!this.HasProp("__IHumanPresenceSettings2")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings2 := IHumanPresenceSettings2(outPtr)
        }

        return this.__IHumanPresenceSettings2.get_LockOptions()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOnlookerDetectionEnabled() {
        if (!this.HasProp("__IHumanPresenceSettings3")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings3 := IHumanPresenceSettings3(outPtr)
        }

        return this.__IHumanPresenceSettings3.get_IsOnlookerDetectionEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsOnlookerDetectionEnabled(value) {
        if (!this.HasProp("__IHumanPresenceSettings3")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings3 := IHumanPresenceSettings3(outPtr)
        }

        return this.__IHumanPresenceSettings3.put_IsOnlookerDetectionEnabled(value)
    }

    /**
     * 
     * @returns {OnlookerDetectionOptions} 
     */
    get_OnlookerDetectionOptions() {
        if (!this.HasProp("__IHumanPresenceSettings3")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSettings3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSettings3 := IHumanPresenceSettings3(outPtr)
        }

        return this.__IHumanPresenceSettings3.get_OnlookerDetectionOptions()
    }

;@endregion Instance Methods
}
