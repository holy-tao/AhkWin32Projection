#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRfcommConnectionTrigger.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that launches a background task when an RFCOMM inbound or outbound connections are established.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.rfcommconnectiontrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class RfcommConnectionTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRfcommConnectionTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRfcommConnectionTrigger.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the [RfcommInboundConnectionInformation](../windows.devices.bluetooth.background/rfcomminboundconnectioninformation.md) object that describes how the system will advertise and listen for inbound connections on behalf of the app.
     * @remarks
     * If this property is null, the system will not listen for incoming connections.
     * 
     * At least one of the InboundConnection and [OutboundConnection](rfcommconnectiontrigger_outboundconnection.md) properties must be non-null.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.rfcommconnectiontrigger.inboundconnection
     * @type {RfcommInboundConnectionInformation} 
     */
    InboundConnection {
        get => this.get_InboundConnection()
    }

    /**
     * Gets or sets the [RfcommOutboundConnectionInformation](../windows.devices.bluetooth.background/rfcommoutboundconnectioninformation.md) object that describes how the system will create outgoing connections on behalf of the app.
     * @remarks
     * If this property is null, the system will not create outgoing connections.
     * 
     * At least one of the [InboundConnection](rfcommconnectiontrigger_inboundconnection.md) and OutboundConnection properties must be non-null.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.rfcommconnectiontrigger.outboundconnection
     * @type {RfcommOutboundConnectionInformation} 
     */
    OutboundConnection {
        get => this.get_OutboundConnection()
    }

    /**
     * Gets or sets whether the app wants to handle multiple connections at a time.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.rfcommconnectiontrigger.allowmultipleconnections
     * @type {Boolean} 
     */
    AllowMultipleConnections {
        get => this.get_AllowMultipleConnections()
        set => this.put_AllowMultipleConnections(value)
    }

    /**
     * Gets or sets the minimum protection level required for connections that are created or accepted on behalf of the app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.rfcommconnectiontrigger.protectionlevel
     * @type {Integer} 
     */
    ProtectionLevel {
        get => this.get_ProtectionLevel()
        set => this.put_ProtectionLevel(value)
    }

    /**
     * Gets or sets specific remote Bluetooth device the system will connect to, or accept connections from, on behalf of the app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.rfcommconnectiontrigger.remotehostname
     * @type {HostName} 
     */
    RemoteHostName {
        get => this.get_RemoteHostName()
        set => this.put_RemoteHostName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the RfcommConnectionTrigger class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.RfcommConnectionTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {RfcommInboundConnectionInformation} 
     */
    get_InboundConnection() {
        if (!this.HasProp("__IRfcommConnectionTrigger")) {
            if ((queryResult := this.QueryInterface(IRfcommConnectionTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommConnectionTrigger := IRfcommConnectionTrigger(outPtr)
        }

        return this.__IRfcommConnectionTrigger.get_InboundConnection()
    }

    /**
     * 
     * @returns {RfcommOutboundConnectionInformation} 
     */
    get_OutboundConnection() {
        if (!this.HasProp("__IRfcommConnectionTrigger")) {
            if ((queryResult := this.QueryInterface(IRfcommConnectionTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommConnectionTrigger := IRfcommConnectionTrigger(outPtr)
        }

        return this.__IRfcommConnectionTrigger.get_OutboundConnection()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowMultipleConnections() {
        if (!this.HasProp("__IRfcommConnectionTrigger")) {
            if ((queryResult := this.QueryInterface(IRfcommConnectionTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommConnectionTrigger := IRfcommConnectionTrigger(outPtr)
        }

        return this.__IRfcommConnectionTrigger.get_AllowMultipleConnections()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowMultipleConnections(value) {
        if (!this.HasProp("__IRfcommConnectionTrigger")) {
            if ((queryResult := this.QueryInterface(IRfcommConnectionTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommConnectionTrigger := IRfcommConnectionTrigger(outPtr)
        }

        return this.__IRfcommConnectionTrigger.put_AllowMultipleConnections(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionLevel() {
        if (!this.HasProp("__IRfcommConnectionTrigger")) {
            if ((queryResult := this.QueryInterface(IRfcommConnectionTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommConnectionTrigger := IRfcommConnectionTrigger(outPtr)
        }

        return this.__IRfcommConnectionTrigger.get_ProtectionLevel()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ProtectionLevel(value) {
        if (!this.HasProp("__IRfcommConnectionTrigger")) {
            if ((queryResult := this.QueryInterface(IRfcommConnectionTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommConnectionTrigger := IRfcommConnectionTrigger(outPtr)
        }

        return this.__IRfcommConnectionTrigger.put_ProtectionLevel(value)
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_RemoteHostName() {
        if (!this.HasProp("__IRfcommConnectionTrigger")) {
            if ((queryResult := this.QueryInterface(IRfcommConnectionTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommConnectionTrigger := IRfcommConnectionTrigger(outPtr)
        }

        return this.__IRfcommConnectionTrigger.get_RemoteHostName()
    }

    /**
     * 
     * @param {HostName} value 
     * @returns {HRESULT} 
     */
    put_RemoteHostName(value) {
        if (!this.HasProp("__IRfcommConnectionTrigger")) {
            if ((queryResult := this.QueryInterface(IRfcommConnectionTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommConnectionTrigger := IRfcommConnectionTrigger(outPtr)
        }

        return this.__IRfcommConnectionTrigger.put_RemoteHostName(value)
    }

;@endregion Instance Methods
}
