#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRfcommConnectionTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about the Bluetooth device that caused this trigger to fire.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.rfcommconnectiontriggerdetails
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class RfcommConnectionTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRfcommConnectionTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRfcommConnectionTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a reference to the underlying [StreamSocket](../windows.networking.sockets/streamsocket.md) of this connection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.rfcommconnectiontriggerdetails.socket
     * @type {StreamSocket} 
     */
    Socket {
        get => this.get_Socket()
    }

    /**
     * Gets whether this is an incoming connection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.rfcommconnectiontriggerdetails.incoming
     * @type {Boolean} 
     */
    Incoming {
        get => this.get_Incoming()
    }

    /**
     * Gets the [BluetoothDevice](../windows.devices.bluetooth/bluetoothdevice.md) object that represents the remote device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.rfcommconnectiontriggerdetails.remotedevice
     * @type {BluetoothDevice} 
     */
    RemoteDevice {
        get => this.get_RemoteDevice()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {StreamSocket} 
     */
    get_Socket() {
        if (!this.HasProp("__IRfcommConnectionTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IRfcommConnectionTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommConnectionTriggerDetails := IRfcommConnectionTriggerDetails(outPtr)
        }

        return this.__IRfcommConnectionTriggerDetails.get_Socket()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Incoming() {
        if (!this.HasProp("__IRfcommConnectionTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IRfcommConnectionTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommConnectionTriggerDetails := IRfcommConnectionTriggerDetails(outPtr)
        }

        return this.__IRfcommConnectionTriggerDetails.get_Incoming()
    }

    /**
     * 
     * @returns {BluetoothDevice} 
     */
    get_RemoteDevice() {
        if (!this.HasProp("__IRfcommConnectionTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IRfcommConnectionTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommConnectionTriggerDetails := IRfcommConnectionTriggerDetails(outPtr)
        }

        return this.__IRfcommConnectionTriggerDetails.get_RemoteDevice()
    }

;@endregion Instance Methods
}
