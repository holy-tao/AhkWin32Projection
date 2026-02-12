#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionControlSession.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PerceptionControlSession.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control session on a controllable frame source.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncontrolsession
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionControlSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionControlSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionControlSession.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnControlLostToken")) {
            this.remove_ControlLost(this.__OnControlLostToken)
            this.__OnControlLost.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionControlSession, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ControlLost(handler) {
        if (!this.HasProp("__IPerceptionControlSession")) {
            if ((queryResult := this.QueryInterface(IPerceptionControlSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionControlSession := IPerceptionControlSession(outPtr)
        }

        return this.__IPerceptionControlSession.add_ControlLost(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ControlLost(token) {
        if (!this.HasProp("__IPerceptionControlSession")) {
            if ((queryResult := this.QueryInterface(IPerceptionControlSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionControlSession := IPerceptionControlSession(outPtr)
        }

        return this.__IPerceptionControlSession.remove_ControlLost(token)
    }

    /**
     * Creates a property change request. This request is asynchronously processed, and is not guaranteed to succeed. The property change result should be inspected to determine if the property change was actually accepted and, if it was not, the reason why the property change was not accepted.
     * @param {HSTRING} name The name of the property to change.
     * @param {IInspectable} value The new property value.
     * @returns {IAsyncOperation<PerceptionFrameSourcePropertyChangeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncontrolsession.trysetpropertyasync
     */
    TrySetPropertyAsync(name, value) {
        if (!this.HasProp("__IPerceptionControlSession")) {
            if ((queryResult := this.QueryInterface(IPerceptionControlSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionControlSession := IPerceptionControlSession(outPtr)
        }

        return this.__IPerceptionControlSession.TrySetPropertyAsync(name, value)
    }

    /**
     * Releases system resources that are exposed by a Windows Runtime object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncontrolsession.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
