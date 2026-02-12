#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICallControl.ahk
#Include .\ICallControlStatics.ahk
#Include .\CallControlEventHandler.ahk
#Include .\CallControl.ahk
#Include .\DialRequestedEventHandler.ahk
#Include .\DialRequestedEventArgs.ahk
#Include .\RedialRequestedEventHandler.ahk
#Include .\RedialRequestedEventArgs.ahk
#Include .\KeypadPressedEventHandler.ahk
#Include .\KeypadPressedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents the properties, commands and events for handling calls on a telephony related device.
 * @remarks
 * This class provides access to events that can be monitored and used for modifying the behavior of your telephony-aware app.  For more information, see [How to manage calls on the default Bluetooth communications device](/previous-versions/windows/apps/hh452727(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.callcontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class CallControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICallControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICallControl.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns a [CallControl](callcontrol.md) class that represents the default audio communications device.
     * @remarks
     * This method may return a NULL pointer if the device doesn't support this functionality.
     * @returns {CallControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.callcontrol.getdefault
     */
    static GetDefault() {
        if (!CallControl.HasProp("__ICallControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.CallControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICallControlStatics.IID)
            CallControl.__ICallControlStatics := ICallControlStatics(factoryPtr)
        }

        return CallControl.__ICallControlStatics.GetDefault()
    }

    /**
     * Returns a [CallControl](callcontrol.md) class that represents the audio communications device specified by the [DeviceInformation ID](../windows.devices.enumeration/deviceinformation_id.md) being passed.
     * @remarks
     * This method may return a NULL pointer if the device doesn't support this functionality.
     * @param {HSTRING} deviceId The [DeviceInformation ID](../windows.devices.enumeration/deviceinformation_id.md) of the specified audio communications device.
     * @returns {CallControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.callcontrol.fromid
     */
    static FromId(deviceId) {
        if (!CallControl.HasProp("__ICallControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.CallControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICallControlStatics.IID)
            CallControl.__ICallControlStatics := ICallControlStatics(factoryPtr)
        }

        return CallControl.__ICallControlStatics.FromId(deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Indicates whether the telephony device has a built-in ringer.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.callcontrol.hasringer
     * @type {Boolean} 
     */
    HasRinger {
        get => this.get_HasRinger()
    }

    /**
     * Occurs when the device receives a request to answer a call.
     * @remarks
     * This class provides access to events that can be monitored and used for modifying the behavior of your telephony-aware app. The following JavaScript code snippet shows how to add event listeners to the **CallControl** class, and then to respond to one of the events, **AnswerRequested**.
     * @type {CallControlEventHandler}
    */
    OnAnswerRequested {
        get {
            if(!this.HasProp("__OnAnswerRequested")){
                this.__OnAnswerRequested := WinRTEventHandler(
                    CallControlEventHandler,
                    CallControlEventHandler.IID,
                    CallControl
                )
                this.__OnAnswerRequestedToken := this.add_AnswerRequested(this.__OnAnswerRequested.iface)
            }
            return this.__OnAnswerRequested
        }
    }

    /**
     * Occurs when the device receives a request to hang up a call.
     * @remarks
     * This class provides access to events that can be monitored and used for modifying the behavior of your telephony-aware app. The following JavaScript code snippet shows how to add event listeners to the **CallControl** class, and then to respond to one of the events, **HangUpRequested**.
     * @type {CallControlEventHandler}
    */
    OnHangUpRequested {
        get {
            if(!this.HasProp("__OnHangUpRequested")){
                this.__OnHangUpRequested := WinRTEventHandler(
                    CallControlEventHandler,
                    CallControlEventHandler.IID,
                    CallControl
                )
                this.__OnHangUpRequestedToken := this.add_HangUpRequested(this.__OnHangUpRequested.iface)
            }
            return this.__OnHangUpRequested
        }
    }

    /**
     * Occurs when a number is dialed from the device.
     * @remarks
     * This class provides access to events that can be monitored and used for modifying the behavior of your telephony-aware app. The following JavaScript code snippet shows how to add event listeners to the **CallControl** class, and then to respond to one of the events, **DialRequested**.
     * @type {DialRequestedEventHandler}
    */
    OnDialRequested {
        get {
            if(!this.HasProp("__OnDialRequested")){
                this.__OnDialRequested := WinRTEventHandler(
                    DialRequestedEventHandler,
                    DialRequestedEventHandler.IID,
                    CallControl,
                    DialRequestedEventArgs
                )
                this.__OnDialRequestedToken := this.add_DialRequested(this.__OnDialRequested.iface)
            }
            return this.__OnDialRequested
        }
    }

    /**
     * Occurs when the device receives a request to redial.
     * @remarks
     * This class provides access to events that can be monitored and used for modifying the behavior of your telephony-aware app. The following JavaScript code snippet shows how to add event listeners to the **CallControl** class, and then to respond to one of the events, **RedialRequested**.
     * @type {RedialRequestedEventHandler}
    */
    OnRedialRequested {
        get {
            if(!this.HasProp("__OnRedialRequested")){
                this.__OnRedialRequested := WinRTEventHandler(
                    RedialRequestedEventHandler,
                    RedialRequestedEventHandler.IID,
                    CallControl,
                    RedialRequestedEventArgs
                )
                this.__OnRedialRequestedToken := this.add_RedialRequested(this.__OnRedialRequested.iface)
            }
            return this.__OnRedialRequested
        }
    }

    /**
     * Occurs when a keypad button on the device has been pressed.
     * @type {KeypadPressedEventHandler}
    */
    OnKeypadPressed {
        get {
            if(!this.HasProp("__OnKeypadPressed")){
                this.__OnKeypadPressed := WinRTEventHandler(
                    KeypadPressedEventHandler,
                    KeypadPressedEventHandler.IID,
                    CallControl,
                    KeypadPressedEventArgs
                )
                this.__OnKeypadPressedToken := this.add_KeypadPressed(this.__OnKeypadPressed.iface)
            }
            return this.__OnKeypadPressed
        }
    }

    /**
     * Occurs when the device receives a request for an audio transfer.
     * @remarks
     * This class provides access to events that can be monitored and used for modifying the behavior of your telephony-aware app. The following JavaScript code snippet shows how to add event listeners to the **CallControl** class, and then to respond to one of the events, **AudioTransferRequested**.
     * @type {CallControlEventHandler}
    */
    OnAudioTransferRequested {
        get {
            if(!this.HasProp("__OnAudioTransferRequested")){
                this.__OnAudioTransferRequested := WinRTEventHandler(
                    CallControlEventHandler,
                    CallControlEventHandler.IID,
                    CallControl
                )
                this.__OnAudioTransferRequestedToken := this.add_AudioTransferRequested(this.__OnAudioTransferRequested.iface)
            }
            return this.__OnAudioTransferRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAnswerRequestedToken")) {
            this.remove_AnswerRequested(this.__OnAnswerRequestedToken)
            this.__OnAnswerRequested.iface.Dispose()
        }

        if(this.HasProp("__OnHangUpRequestedToken")) {
            this.remove_HangUpRequested(this.__OnHangUpRequestedToken)
            this.__OnHangUpRequested.iface.Dispose()
        }

        if(this.HasProp("__OnDialRequestedToken")) {
            this.remove_DialRequested(this.__OnDialRequestedToken)
            this.__OnDialRequested.iface.Dispose()
        }

        if(this.HasProp("__OnRedialRequestedToken")) {
            this.remove_RedialRequested(this.__OnRedialRequestedToken)
            this.__OnRedialRequested.iface.Dispose()
        }

        if(this.HasProp("__OnKeypadPressedToken")) {
            this.remove_KeypadPressed(this.__OnKeypadPressedToken)
            this.__OnKeypadPressed.iface.Dispose()
        }

        if(this.HasProp("__OnAudioTransferRequestedToken")) {
            this.remove_AudioTransferRequested(this.__OnAudioTransferRequestedToken)
            this.__OnAudioTransferRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Informs the device that there is an incoming call.
     * @param {Boolean} enableRinger Specifies whether the device should activate its built-in ringer.
     * @param {HSTRING} callerId A numeric string that specifies the incoming caller ID. This parameter can be null, and often is for many VoIP calls.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.callcontrol.indicatenewincomingcall
     */
    IndicateNewIncomingCall(enableRinger, callerId) {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.IndicateNewIncomingCall(enableRinger, callerId)
    }

    /**
     * Updates device indicators to indicate an outgoing call.
     * @remarks
     * An application should call this method only after the dialing connection is actually initiated, and not before.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.callcontrol.indicatenewoutgoingcall
     */
    IndicateNewOutgoingCall() {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.IndicateNewOutgoingCall()
    }

    /**
     * Indicates that the specified call is now active.
     * @param {Integer} callToken The unique identifier of the specified call.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.callcontrol.indicateactivecall
     */
    IndicateActiveCall(callToken) {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.IndicateActiveCall(callToken)
    }

    /**
     * Ends the specified call.
     * @remarks
     * After this method is called, the *callToken* of the specified call is no longer valid.
     * @param {Integer} callToken The unique identifier of the specified call.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.callcontrol.endcall
     */
    EndCall(callToken) {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.EndCall(callToken)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasRinger() {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.get_HasRinger()
    }

    /**
     * 
     * @param {CallControlEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AnswerRequested(handler) {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.add_AnswerRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AnswerRequested(token) {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.remove_AnswerRequested(token)
    }

    /**
     * 
     * @param {CallControlEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HangUpRequested(handler) {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.add_HangUpRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HangUpRequested(token) {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.remove_HangUpRequested(token)
    }

    /**
     * 
     * @param {DialRequestedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DialRequested(handler) {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.add_DialRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DialRequested(token) {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.remove_DialRequested(token)
    }

    /**
     * 
     * @param {RedialRequestedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RedialRequested(handler) {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.add_RedialRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RedialRequested(token) {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.remove_RedialRequested(token)
    }

    /**
     * 
     * @param {KeypadPressedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeypadPressed(handler) {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.add_KeypadPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_KeypadPressed(token) {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.remove_KeypadPressed(token)
    }

    /**
     * 
     * @param {CallControlEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AudioTransferRequested(handler) {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.add_AudioTransferRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AudioTransferRequested(token) {
        if (!this.HasProp("__ICallControl")) {
            if ((queryResult := this.QueryInterface(ICallControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICallControl := ICallControl(outPtr)
        }

        return this.__ICallControl.remove_AudioTransferRequested(token)
    }

;@endregion Instance Methods
}
