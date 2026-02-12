#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPenButtonListener.ahk
#Include .\IPenButtonListenerStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PenButtonListener.ahk
#Include .\PenTailButtonClickedEventArgs.ahk
#Include .\PenTailButtonDoubleClickedEventArgs.ahk
#Include .\PenTailButtonLongPressedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to button action event notifications from a connected pen device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.penbuttonlistener
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class PenButtonListener extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPenButtonListener

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPenButtonListener.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the default listener for pen button events.
     * @returns {PenButtonListener} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.penbuttonlistener.getdefault
     */
    static GetDefault() {
        if (!PenButtonListener.HasProp("__IPenButtonListenerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Input.PenButtonListener")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPenButtonListenerStatics.IID)
            PenButtonListener.__IPenButtonListenerStatics := IPenButtonListenerStatics(factoryPtr)
        }

        return PenButtonListener.__IPenButtonListenerStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnIsSupportedChangedToken")) {
            this.remove_IsSupportedChanged(this.__OnIsSupportedChangedToken)
            this.__OnIsSupportedChanged.iface.Dispose()
        }

        if(this.HasProp("__OnTailButtonClickedToken")) {
            this.remove_TailButtonClicked(this.__OnTailButtonClickedToken)
            this.__OnTailButtonClicked.iface.Dispose()
        }

        if(this.HasProp("__OnTailButtonDoubleClickedToken")) {
            this.remove_TailButtonDoubleClicked(this.__OnTailButtonDoubleClickedToken)
            this.__OnTailButtonDoubleClicked.iface.Dispose()
        }

        if(this.HasProp("__OnTailButtonLongPressedToken")) {
            this.remove_TailButtonLongPressed(this.__OnTailButtonLongPressedToken)
            this.__OnTailButtonLongPressed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Retrieves whether pen button action event notifications are currently supported.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.penbuttonlistener.issupported
     */
    IsSupported() {
        if (!this.HasProp("__IPenButtonListener")) {
            if ((queryResult := this.QueryInterface(IPenButtonListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenButtonListener := IPenButtonListener(outPtr)
        }

        return this.__IPenButtonListener.IsSupported()
    }

    /**
     * 
     * @param {TypedEventHandler<PenButtonListener, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsSupportedChanged(handler) {
        if (!this.HasProp("__IPenButtonListener")) {
            if ((queryResult := this.QueryInterface(IPenButtonListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenButtonListener := IPenButtonListener(outPtr)
        }

        return this.__IPenButtonListener.add_IsSupportedChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsSupportedChanged(token) {
        if (!this.HasProp("__IPenButtonListener")) {
            if ((queryResult := this.QueryInterface(IPenButtonListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenButtonListener := IPenButtonListener(outPtr)
        }

        return this.__IPenButtonListener.remove_IsSupportedChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PenButtonListener, PenTailButtonClickedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TailButtonClicked(handler) {
        if (!this.HasProp("__IPenButtonListener")) {
            if ((queryResult := this.QueryInterface(IPenButtonListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenButtonListener := IPenButtonListener(outPtr)
        }

        return this.__IPenButtonListener.add_TailButtonClicked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TailButtonClicked(token) {
        if (!this.HasProp("__IPenButtonListener")) {
            if ((queryResult := this.QueryInterface(IPenButtonListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenButtonListener := IPenButtonListener(outPtr)
        }

        return this.__IPenButtonListener.remove_TailButtonClicked(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PenButtonListener, PenTailButtonDoubleClickedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TailButtonDoubleClicked(handler) {
        if (!this.HasProp("__IPenButtonListener")) {
            if ((queryResult := this.QueryInterface(IPenButtonListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenButtonListener := IPenButtonListener(outPtr)
        }

        return this.__IPenButtonListener.add_TailButtonDoubleClicked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TailButtonDoubleClicked(token) {
        if (!this.HasProp("__IPenButtonListener")) {
            if ((queryResult := this.QueryInterface(IPenButtonListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenButtonListener := IPenButtonListener(outPtr)
        }

        return this.__IPenButtonListener.remove_TailButtonDoubleClicked(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PenButtonListener, PenTailButtonLongPressedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TailButtonLongPressed(handler) {
        if (!this.HasProp("__IPenButtonListener")) {
            if ((queryResult := this.QueryInterface(IPenButtonListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenButtonListener := IPenButtonListener(outPtr)
        }

        return this.__IPenButtonListener.add_TailButtonLongPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TailButtonLongPressed(token) {
        if (!this.HasProp("__IPenButtonListener")) {
            if ((queryResult := this.QueryInterface(IPenButtonListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenButtonListener := IPenButtonListener(outPtr)
        }

        return this.__IPenButtonListener.remove_TailButtonLongPressed(token)
    }

;@endregion Instance Methods
}
