#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRfcommOutboundConnectionInformation.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information for RFCOMM outbound connections. If an app wants the system to create outbound connections on its behalf, the app must create this object and attach it to the [RfcommConnectionTrigger](../windows.applicationmodel.background/rfcommconnectiontrigger.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.rfcommoutboundconnectioninformation
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class RfcommOutboundConnectionInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRfcommOutboundConnectionInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRfcommOutboundConnectionInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the service UUID of the remote service to which the system will connect on behalf of the app.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.rfcommoutboundconnectioninformation.remoteserviceid
     * @type {RfcommServiceId} 
     */
    RemoteServiceId {
        get => this.get_RemoteServiceId()
        set => this.put_RemoteServiceId(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    get_RemoteServiceId() {
        if (!this.HasProp("__IRfcommOutboundConnectionInformation")) {
            if ((queryResult := this.QueryInterface(IRfcommOutboundConnectionInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommOutboundConnectionInformation := IRfcommOutboundConnectionInformation(outPtr)
        }

        return this.__IRfcommOutboundConnectionInformation.get_RemoteServiceId()
    }

    /**
     * 
     * @param {RfcommServiceId} value 
     * @returns {HRESULT} 
     */
    put_RemoteServiceId(value) {
        if (!this.HasProp("__IRfcommOutboundConnectionInformation")) {
            if ((queryResult := this.QueryInterface(IRfcommOutboundConnectionInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommOutboundConnectionInformation := IRfcommOutboundConnectionInformation(outPtr)
        }

        return this.__IRfcommOutboundConnectionInformation.put_RemoteServiceId(value)
    }

;@endregion Instance Methods
}
