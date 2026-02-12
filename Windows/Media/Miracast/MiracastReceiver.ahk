#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiver.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MiracastReceiver.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * An object that allows an app to implement a Miracast Receiver (Sink) and receive incoming Miracast connections.
 * @remarks
 * Miracast requires the device to support Wi-Fi Direct.
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiver
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiver extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiver

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiver.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Creates a new instance of a [MiracastReceiver](miracastreceiver.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Miracast.MiracastReceiver")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

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
     * Returns default settings for the [MiracastReceiver](miracastreceiver.md).
     * @remarks
     * Apps can invoke **GetDefaultSettings** to receive a [MiracastReceiverSettings](miracastreceiversettings.md) object populated with the default settings.
     * Apps can then modify the values from the defaults and then pass the settings object as a parameter to the [DisconnectAllAndApplySettingsAsync](miracastreceiver_disconnectallandapplysettingsasync_404771925.md) call.
     * @returns {MiracastReceiverSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiver.getdefaultsettings
     */
    GetDefaultSettings() {
        if (!this.HasProp("__IMiracastReceiver")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiver := IMiracastReceiver(outPtr)
        }

        return this.__IMiracastReceiver.GetDefaultSettings()
    }

    /**
     * Returns the settings currently used by the [MiracastReceiver](miracastreceiver.md).
     * @remarks
     * Because this method may block for a noticeable period of time, you should not call it from the UI thread or from a single-threaded apartment. Instead, use the asyncronous method [GetCurrentSettingsAsync](miracastreceiver_getcurrentsettingsasync_189471090.md).
     * @returns {MiracastReceiverSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiver.getcurrentsettings
     */
    GetCurrentSettings() {
        if (!this.HasProp("__IMiracastReceiver")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiver := IMiracastReceiver(outPtr)
        }

        return this.__IMiracastReceiver.GetCurrentSettings()
    }

    /**
     * Returns the settings currently used by the [MiracastReceiver](miracastreceiver.md).
     * @returns {IAsyncOperation<MiracastReceiverSettings>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiver.getcurrentsettingsasync
     */
    GetCurrentSettingsAsync() {
        if (!this.HasProp("__IMiracastReceiver")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiver := IMiracastReceiver(outPtr)
        }

        return this.__IMiracastReceiver.GetCurrentSettingsAsync()
    }

    /**
     * Disconnects all currently connected Miracast connections and applies the specified settings on the [MiracastReceiver](miracastreceiver.md).
     * @remarks
     * Because this method may block for a noticeable period of time, you should not call it from the UI thread or from a single-threaded apartment. Instead, use the asyncronous method [DisconnectAllAndApplySettingsAsync](miracastreceiver_disconnectallandapplysettingsasync_404771925.md).
     * 
     * Check the [MiracastReceiverApplySettingsResult](miracastreceiverapplysettingsresult.md) return parameter to confirm that the settings were successfully applied. If Miracast has been enabled by the operating system, such as through Windows Settings, changes to the settings will not be allowed and the **MiracastReceiverApplySettingsResult** return value will indicate that access was denied.
     * @param {MiracastReceiverSettings} settings The settings that will be applied.
     * @returns {MiracastReceiverApplySettingsResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiver.disconnectallandapplysettings
     */
    DisconnectAllAndApplySettings(settings) {
        if (!this.HasProp("__IMiracastReceiver")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiver := IMiracastReceiver(outPtr)
        }

        return this.__IMiracastReceiver.DisconnectAllAndApplySettings(settings)
    }

    /**
     * Asynchronously disconnects all currently connected Miracast connections and applies the specified settings on the [MiracastReceiver](miracastreceiver.md).
     * @remarks
     * Check the [MiracastReceiverApplySettingsResult](miracastreceiverapplysettingsresult.md) return parameter to confirm that the settings were successfully applied. If Miracast has been enabled by the operating system, such as through Windows Settings, changes to the settings will not be allowed and the **MiracastReceiverApplySettingsResult** return value will indicate that access was denied.
     * @param {MiracastReceiverSettings} settings The settings that will be applied.
     * @returns {IAsyncOperation<MiracastReceiverApplySettingsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiver.disconnectallandapplysettingsasync
     */
    DisconnectAllAndApplySettingsAsync(settings) {
        if (!this.HasProp("__IMiracastReceiver")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiver := IMiracastReceiver(outPtr)
        }

        return this.__IMiracastReceiver.DisconnectAllAndApplySettingsAsync(settings)
    }

    /**
     * Retrieves the current status of the [MiracastReceiver](miracastreceiver.md).
     * @remarks
     * Because this method may block for a noticeable period of time, you should not call it from the UI thread or from a single-threaded apartment. Instead, use the asyncronous method [GetStatusAsync](miracastreceiver_getstatusasync_240032933.md).
     * @returns {MiracastReceiverStatus} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiver.getstatus
     */
    GetStatus() {
        if (!this.HasProp("__IMiracastReceiver")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiver := IMiracastReceiver(outPtr)
        }

        return this.__IMiracastReceiver.GetStatus()
    }

    /**
     * Asynchronously retrieves the current status of the [MiracastReceiver](miracastreceiver.md).
     * @returns {IAsyncOperation<MiracastReceiverStatus>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiver.getstatusasync
     */
    GetStatusAsync() {
        if (!this.HasProp("__IMiracastReceiver")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiver := IMiracastReceiver(outPtr)
        }

        return this.__IMiracastReceiver.GetStatusAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<MiracastReceiver, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusChanged(handler) {
        if (!this.HasProp("__IMiracastReceiver")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiver := IMiracastReceiver(outPtr)
        }

        return this.__IMiracastReceiver.add_StatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusChanged(token) {
        if (!this.HasProp("__IMiracastReceiver")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiver := IMiracastReceiver(outPtr)
        }

        return this.__IMiracastReceiver.remove_StatusChanged(token)
    }

    /**
     * Creates a new [MiracastReceiverSession](miracastreceiversession.md) object, needed to receive Miracast connections.
     * @remarks
     * Because this method may block for a noticeable period of time, you should not call it from the UI thread or from a single-threaded apartment. Instead, use the asyncronous method [CreateSessionAsync](miracastreceiver_createsessionasync_1751251082.md).
     * @param {CoreApplicationView} view_ The [CoreApplicationView](../windows.applicationmodel.core/coreapplicationview.md) used by the app when displaying the Miracast video stream.
     * @returns {MiracastReceiverSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiver.createsession
     */
    CreateSession(view_) {
        if (!this.HasProp("__IMiracastReceiver")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiver := IMiracastReceiver(outPtr)
        }

        return this.__IMiracastReceiver.CreateSession(view_)
    }

    /**
     * Asynchronously creates a new [MiracastReceiverSession](miracastreceiversession.md) object, needed to receive Miracast connections.
     * @param {CoreApplicationView} view_ The [CoreApplicationView](/uwp/api/Windows.ApplicationModel.Core.CoreApplicationView) used by the app when displaying the Miracast video stream.
     * @returns {IAsyncOperation<MiracastReceiverSession>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiver.createsessionasync
     */
    CreateSessionAsync(view_) {
        if (!this.HasProp("__IMiracastReceiver")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiver := IMiracastReceiver(outPtr)
        }

        return this.__IMiracastReceiver.CreateSessionAsync(view_)
    }

    /**
     * Empties the collection of known [MiracastTransmitter](miracasttransmitter.md) objects.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiver.clearknowntransmitters
     */
    ClearKnownTransmitters() {
        if (!this.HasProp("__IMiracastReceiver")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiver := IMiracastReceiver(outPtr)
        }

        return this.__IMiracastReceiver.ClearKnownTransmitters()
    }

    /**
     * Remove a specified [MiracastTransmitter](miracasttransmitter.md) from the collection of known [MiracastTransmitter](miracasttransmitter.md) objects .
     * @param {MiracastTransmitter} transmitter The **MiracastTransmitter** to be removed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiver.removeknowntransmitter
     */
    RemoveKnownTransmitter(transmitter) {
        if (!this.HasProp("__IMiracastReceiver")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiver := IMiracastReceiver(outPtr)
        }

        return this.__IMiracastReceiver.RemoveKnownTransmitter(transmitter)
    }

;@endregion Instance Methods
}
