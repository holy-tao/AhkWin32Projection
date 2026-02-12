#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPenDockListener.ahk
#Include .\IPenDockListenerStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PenDockListener.ahk
#Include .\PenDockedEventArgs.ahk
#Include .\PenUndockedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to docking state event notifications from a connected pen device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pendocklistener
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class PenDockListener extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPenDockListener

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPenDockListener.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the default listener for pen dock events.
     * @returns {PenDockListener} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pendocklistener.getdefault
     */
    static GetDefault() {
        if (!PenDockListener.HasProp("__IPenDockListenerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Input.PenDockListener")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPenDockListenerStatics.IID)
            PenDockListener.__IPenDockListenerStatics := IPenDockListenerStatics(factoryPtr)
        }

        return PenDockListener.__IPenDockListenerStatics.GetDefault()
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

        if(this.HasProp("__OnDockedToken")) {
            this.remove_Docked(this.__OnDockedToken)
            this.__OnDocked.iface.Dispose()
        }

        if(this.HasProp("__OnUndockedToken")) {
            this.remove_Undocked(this.__OnUndockedToken)
            this.__OnUndocked.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Retrieves whether pen docking state event notifications are currently supported.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pendocklistener.issupported
     */
    IsSupported() {
        if (!this.HasProp("__IPenDockListener")) {
            if ((queryResult := this.QueryInterface(IPenDockListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenDockListener := IPenDockListener(outPtr)
        }

        return this.__IPenDockListener.IsSupported()
    }

    /**
     * 
     * @param {TypedEventHandler<PenDockListener, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsSupportedChanged(handler) {
        if (!this.HasProp("__IPenDockListener")) {
            if ((queryResult := this.QueryInterface(IPenDockListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenDockListener := IPenDockListener(outPtr)
        }

        return this.__IPenDockListener.add_IsSupportedChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsSupportedChanged(token) {
        if (!this.HasProp("__IPenDockListener")) {
            if ((queryResult := this.QueryInterface(IPenDockListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenDockListener := IPenDockListener(outPtr)
        }

        return this.__IPenDockListener.remove_IsSupportedChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PenDockListener, PenDockedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Docked(handler) {
        if (!this.HasProp("__IPenDockListener")) {
            if ((queryResult := this.QueryInterface(IPenDockListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenDockListener := IPenDockListener(outPtr)
        }

        return this.__IPenDockListener.add_Docked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Docked(token) {
        if (!this.HasProp("__IPenDockListener")) {
            if ((queryResult := this.QueryInterface(IPenDockListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenDockListener := IPenDockListener(outPtr)
        }

        return this.__IPenDockListener.remove_Docked(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PenDockListener, PenUndockedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Undocked(handler) {
        if (!this.HasProp("__IPenDockListener")) {
            if ((queryResult := this.QueryInterface(IPenDockListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenDockListener := IPenDockListener(outPtr)
        }

        return this.__IPenDockListener.add_Undocked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Undocked(token) {
        if (!this.HasProp("__IPenDockListener")) {
            if ((queryResult := this.QueryInterface(IPenDockListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPenDockListener := IPenDockListener(outPtr)
        }

        return this.__IPenDockListener.remove_Undocked(token)
    }

;@endregion Instance Methods
}
