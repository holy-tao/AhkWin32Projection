#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiverSettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * An object with configuration settings for the [MiracastReceiver](miracastreceiver.md).
 * @remarks
 * Use [MiracastReceiver.GetDefaultSettings](miracastreceiver_getdefaultsettings_874665079.md) to get a MiracastReceiverSettings object with default settings filled in, and replace the default settings as desired.
 * Use [DisconnectAllAndApplySettings](miracastreceiver_disconnectallandapplysettings_1413841516.md) or [DisconnectAllAndApplySettingsAsync](miracastreceiver_disconnectallandapplysettingsasync_404771925.md) to apply the settings.
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiversettings
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiverSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiverSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies the friendly name of the [MiracastReceiver](miracastreceiver.md).
     * @remarks
     * This is the name that the Miracast Transmitter sees. Specifying a unique and easy to recognize name is important to ensure that the Miracast Transmitter connects to the correct Receiver in an environment where multiple Miracast Receivers are present.
     * All Miracast Receiver instances on the same device share the same friendly name.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiversettings.friendlyname
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
        set => this.put_FriendlyName(value)
    }

    /**
     * A human-readable string that specifies the model name of the Miracast Receiver app.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiversettings.modelname
     * @type {HSTRING} 
     */
    ModelName {
        get => this.get_ModelName()
        set => this.put_ModelName(value)
    }

    /**
     * A human-readable string that specifies the model number or other version information of the Miracast Receiver app.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiversettings.modelnumber
     * @type {HSTRING} 
     */
    ModelNumber {
        get => this.get_ModelNumber()
        set => this.put_ModelNumber(value)
    }

    /**
     * Specifies the desired authorization method for incoming Miracast connections.
     * @remarks
     * By default, the authorization method is only used the first time a Miracast Transmitter connects. This behavior can be changed by [RequireAuthorizationFromKnownTransmitters](miracastreceiversettings_requireauthorizationfromknowntransmitters.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiversettings.authorizationmethod
     * @type {Integer} 
     */
    AuthorizationMethod {
        get => this.get_AuthorizationMethod()
        set => this.put_AuthorizationMethod(value)
    }

    /**
     * Specifies if authorization should be required by Miracast Transmitters that are already known to the Miracast Receiver.
     * @remarks
     * The authorization method is configured through [AuthorizationMethod](miracastreceiversettings_authorizationmethod.md). 
     * A Miracast Transmitter becomes known if a Miracast connection was received previously, and was not rejected.
     * Use [MiracastReceiver.RemoveKnownTransmitter](miracastreceiver_removeknowntransmitter_1355701555.md) and [MiracastReceiver.ClearKnownTransmitters](miracastreceiver_clearknowntransmitters_1513662921.md) to manage the list of known Miracast Transmitters.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiversettings.requireauthorizationfromknowntransmitters
     * @type {Boolean} 
     */
    RequireAuthorizationFromKnownTransmitters {
        get => this.get_RequireAuthorizationFromKnownTransmitters()
        set => this.put_RequireAuthorizationFromKnownTransmitters(value)
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
    get_FriendlyName() {
        if (!this.HasProp("__IMiracastReceiverSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSettings := IMiracastReceiverSettings(outPtr)
        }

        return this.__IMiracastReceiverSettings.get_FriendlyName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_FriendlyName(value) {
        if (!this.HasProp("__IMiracastReceiverSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSettings := IMiracastReceiverSettings(outPtr)
        }

        return this.__IMiracastReceiverSettings.put_FriendlyName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ModelName() {
        if (!this.HasProp("__IMiracastReceiverSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSettings := IMiracastReceiverSettings(outPtr)
        }

        return this.__IMiracastReceiverSettings.get_ModelName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ModelName(value) {
        if (!this.HasProp("__IMiracastReceiverSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSettings := IMiracastReceiverSettings(outPtr)
        }

        return this.__IMiracastReceiverSettings.put_ModelName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ModelNumber() {
        if (!this.HasProp("__IMiracastReceiverSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSettings := IMiracastReceiverSettings(outPtr)
        }

        return this.__IMiracastReceiverSettings.get_ModelNumber()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ModelNumber(value) {
        if (!this.HasProp("__IMiracastReceiverSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSettings := IMiracastReceiverSettings(outPtr)
        }

        return this.__IMiracastReceiverSettings.put_ModelNumber(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthorizationMethod() {
        if (!this.HasProp("__IMiracastReceiverSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSettings := IMiracastReceiverSettings(outPtr)
        }

        return this.__IMiracastReceiverSettings.get_AuthorizationMethod()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AuthorizationMethod(value) {
        if (!this.HasProp("__IMiracastReceiverSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSettings := IMiracastReceiverSettings(outPtr)
        }

        return this.__IMiracastReceiverSettings.put_AuthorizationMethod(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RequireAuthorizationFromKnownTransmitters() {
        if (!this.HasProp("__IMiracastReceiverSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSettings := IMiracastReceiverSettings(outPtr)
        }

        return this.__IMiracastReceiverSettings.get_RequireAuthorizationFromKnownTransmitters()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RequireAuthorizationFromKnownTransmitters(value) {
        if (!this.HasProp("__IMiracastReceiverSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverSettings := IMiracastReceiverSettings(outPtr)
        }

        return this.__IMiracastReceiverSettings.put_RequireAuthorizationFromKnownTransmitters(value)
    }

;@endregion Instance Methods
}
