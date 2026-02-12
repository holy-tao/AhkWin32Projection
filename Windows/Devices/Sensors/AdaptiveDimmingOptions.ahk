#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdaptiveDimmingOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the ability to manage the dimming behavior of the PC screen based on whether a user is detected by the human presence sensor.
 * @remarks
 * **Introduced in the May Moment update for Windows 11, Version 22H2, Build 22621.**
 * 
 * We recommend using the AdaptiveDimming APIs instead of the AttentionAwareDimming APIs ([IsAttentionAwareDimmingSupported](humanpresencefeatures_isattentionawaredimmingsupported.md), [IsAttentionAwareDimmingEnabled](humanpresencesettings_isattentionawaredimmingenabled.md)), which are now obsolete.
 * 
 * The user can specify their preferred dimming behavior in the System settings (see [Launch Windows Settings](/windows/apps/develop/launch/launch-settings#system)).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.adaptivedimmingoptions
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class AdaptiveDimmingOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdaptiveDimmingOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdaptiveDimmingOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets whether screen dimming behavior, based on the user engagement state reported by the human presence sensor, is enabled when a user has connected an external monitor.
     * @remarks
     * **Introduced in the May Moment update for Windows 11, Version 22H2, Build 22621.**
     * 
     * We recommend using the AdaptiveDimming APIs instead of the AttentionAwareDimming APIs ([IsAttentionAwareDimmingSupported](humanpresencefeatures_isattentionawaredimmingsupported.md), [IsAttentionAwareDimmingEnabled](humanpresencesettings_isattentionawaredimmingenabled.md)), which are now obsolete.
     * 
     * The user can specify their preferred dimming behavior in the System settings (see [Launch Windows Settings](/windows/apps/develop/launch/launch-settings#system)).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.adaptivedimmingoptions.allowwhenexternaldisplayconnected
     * @type {Boolean} 
     */
    AllowWhenExternalDisplayConnected {
        get => this.get_AllowWhenExternalDisplayConnected()
        set => this.put_AllowWhenExternalDisplayConnected(value)
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
    get_AllowWhenExternalDisplayConnected() {
        if (!this.HasProp("__IAdaptiveDimmingOptions")) {
            if ((queryResult := this.QueryInterface(IAdaptiveDimmingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveDimmingOptions := IAdaptiveDimmingOptions(outPtr)
        }

        return this.__IAdaptiveDimmingOptions.get_AllowWhenExternalDisplayConnected()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowWhenExternalDisplayConnected(value) {
        if (!this.HasProp("__IAdaptiveDimmingOptions")) {
            if ((queryResult := this.QueryInterface(IAdaptiveDimmingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveDimmingOptions := IAdaptiveDimmingOptions(outPtr)
        }

        return this.__IAdaptiveDimmingOptions.put_AllowWhenExternalDisplayConnected(value)
    }

;@endregion Instance Methods
}
