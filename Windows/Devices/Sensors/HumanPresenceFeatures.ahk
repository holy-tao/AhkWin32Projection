#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHumanPresenceFeatures.ahk
#Include .\IHumanPresenceFeatures2.ahk
#Include .\IHumanPresenceFeatures3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the system settings supported by a human presence sensor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencefeatures
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class HumanPresenceFeatures extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHumanPresenceFeatures

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHumanPresenceFeatures.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique ID of the human presence sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencefeatures.sensorid
     * @type {HSTRING} 
     */
    SensorId {
        get => this.get_SensorId()
    }

    /**
     * Gets the distances supported by the human presence sensor to wake or lock the PC.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencefeatures.supportedwakeorlockdistancesinmillimeters
     * @type {IVectorView<Integer>} 
     */
    SupportedWakeOrLockDistancesInMillimeters {
        get => this.get_SupportedWakeOrLockDistancesInMillimeters()
    }

    /**
     * Gets whether the human presence sensor can wake the PC on a user's approach.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencefeatures.iswakeonapproachsupported
     * @type {Boolean} 
     */
    IsWakeOnApproachSupported {
        get => this.get_IsWakeOnApproachSupported()
    }

    /**
     * Gets whether the human presence sensor can lock the PC when a user leaves it unattended.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencefeatures.islockonleavesupported
     * @type {Boolean} 
     */
    IsLockOnLeaveSupported {
        get => this.get_IsLockOnLeaveSupported()
    }

    /**
     * This property is obsolete. For more information, see **Remarks**.
     * 
     * Gets whether the human presence sensor can dim the screen of the PC when user interaction is not detected for a period of time.
     * @remarks
     * > **Obsolete as of the May Moment update for Windows 11, Version 22H2, Build 22621.**
     * >
     * > We recommend using the AdaptiveDimming APIs instead of the AttentionAwareDimming APIs ([IsAttentionAwareDimmingSupported](humanpresencefeatures_isattentionawaredimmingsupported.md), [IsAttentionAwareDimmingEnabled](humanpresencesettings_isattentionawaredimmingenabled.md)), which are now obsolete.
     * 
     * The user can specify their preferred dimming behavior in the System settings (see [Launch Windows Settings](/windows/apps/develop/launch/launch-settings#system)).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencefeatures.isattentionawaredimmingsupported
     * @type {Boolean} 
     */
    IsAttentionAwareDimmingSupported {
        get => this.get_IsAttentionAwareDimmingSupported()
    }

    /**
     * Gets whether the human presence sensor can dim the PC screen based on if a user is present, absent, or interacting with their device.
     * @remarks
     * **Introduced in the May Moment update for Windows 11, Version 22H2, Build 22621.**
     * 
     * We recommend using the AdaptiveDimming APIs instead of the AttentionAwareDimming APIs ([IsAttentionAwareDimmingSupported](humanpresencefeatures_isattentionawaredimmingsupported.md), [IsAttentionAwareDimmingEnabled](humanpresencesettings_isattentionawaredimmingenabled.md)), which are now obsolete.
     * 
     * The user can specify their preferred dimming behavior in the System settings (see [Launch Windows Settings](/windows/apps/develop/launch/launch-settings#system)).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencefeatures.isadaptivedimmingsupported
     * @type {Boolean} 
     */
    IsAdaptiveDimmingSupported {
        get => this.get_IsAdaptiveDimmingSupported()
    }

    /**
     * Gets whether the human presence sensor can detect when an onlooker is present.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencefeatures.isonlookerdetectionsupported
     * @type {Boolean} 
     */
    IsOnlookerDetectionSupported {
        get => this.get_IsOnlookerDetectionSupported()
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
        if (!this.HasProp("__IHumanPresenceFeatures")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceFeatures.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceFeatures := IHumanPresenceFeatures(outPtr)
        }

        return this.__IHumanPresenceFeatures.get_SensorId()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedWakeOrLockDistancesInMillimeters() {
        if (!this.HasProp("__IHumanPresenceFeatures")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceFeatures.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceFeatures := IHumanPresenceFeatures(outPtr)
        }

        return this.__IHumanPresenceFeatures.get_SupportedWakeOrLockDistancesInMillimeters()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWakeOnApproachSupported() {
        if (!this.HasProp("__IHumanPresenceFeatures")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceFeatures.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceFeatures := IHumanPresenceFeatures(outPtr)
        }

        return this.__IHumanPresenceFeatures.get_IsWakeOnApproachSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLockOnLeaveSupported() {
        if (!this.HasProp("__IHumanPresenceFeatures")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceFeatures.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceFeatures := IHumanPresenceFeatures(outPtr)
        }

        return this.__IHumanPresenceFeatures.get_IsLockOnLeaveSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAttentionAwareDimmingSupported() {
        if (!this.HasProp("__IHumanPresenceFeatures")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceFeatures.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceFeatures := IHumanPresenceFeatures(outPtr)
        }

        return this.__IHumanPresenceFeatures.get_IsAttentionAwareDimmingSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAdaptiveDimmingSupported() {
        if (!this.HasProp("__IHumanPresenceFeatures2")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceFeatures2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceFeatures2 := IHumanPresenceFeatures2(outPtr)
        }

        return this.__IHumanPresenceFeatures2.get_IsAdaptiveDimmingSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOnlookerDetectionSupported() {
        if (!this.HasProp("__IHumanPresenceFeatures3")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceFeatures3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceFeatures3 := IHumanPresenceFeatures3(outPtr)
        }

        return this.__IHumanPresenceFeatures3.get_IsOnlookerDetectionSupported()
    }

;@endregion Instance Methods
}
