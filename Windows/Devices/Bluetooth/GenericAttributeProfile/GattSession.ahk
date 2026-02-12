#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattSession.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IGattSessionStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\GattSession.ahk
#Include .\GattSessionStatusChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a Generic Attribute Profile (GATT) session.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsession
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattSession.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new GattSession object from the specified deviceId.
     * @param {BluetoothDeviceId} deviceId The deviceId.
     * @returns {IAsyncOperation<GattSession>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsession.fromdeviceidasync
     */
    static FromDeviceIdAsync(deviceId) {
        if (!GattSession.HasProp("__IGattSessionStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattSession")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattSessionStatics.IID)
            GattSession.__IGattSessionStatics := IGattSessionStatics(factoryPtr)
        }

        return GattSession.__IGattSessionStatics.FromDeviceIdAsync(deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the device ID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsession.deviceid
     * @type {BluetoothDeviceId} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets a Boolean value that indicates whether the connection can be maintained.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsession.canmaintainconnection
     * @type {Boolean} 
     */
    CanMaintainConnection {
        get => this.get_CanMaintainConnection()
    }

    /**
     * Gets or sets a Boolean value that indicates whether the connection should be maintained.
     * @remarks
     * If **GattSession.MaintainConnection** is set to `true`, then the system waits indefinitely for a connection, and it will connect when the device is available. There's nothing for your application to wait on, since **GattSession.MaintainConnection** is a property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsession.maintainconnection
     * @type {Boolean} 
     */
    MaintainConnection {
        get => this.get_MaintainConnection()
        set => this.put_MaintainConnection(value)
    }

    /**
     * Gets the maximum protocol data unit (PDU) size. This metric is also known as the *maximum transmission unit (MTU)* size.
     * 
     * Also see the [GattSession.MaxPduSizeChanged](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsession.maxpdusizechanged) event.
     * @remarks
     * The Windows operating system automatically fragments down larger protocol data unit (PDU) sizes sent to a remote device (wherever supported by the Bluetooth GATT/ATT spec). So under normal circumstances, there's no need for you to know the maximum transmission unit (MTU) size at the application layer if your application's goal is just to send data efficiently.
     * 
     * You can send large amounts of data, and it will be fragmented automatically by the OS using the MTU. Your application is not limited by the MTU size as to the data transfer of each packet.
     * 
     * If you want your application to customize the data sent based on the MTU (for example, encoding/codec), or to communicate the MTU size information out-of-band, then you can access the the MTU value using **MaxPduSize** and [GattSession.MaxPduSizeChanged](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsession.maxpdusizechanged).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsession.maxpdusize
     * @type {Integer} 
     */
    MaxPduSize {
        get => this.get_MaxPduSize()
    }

    /**
     * Gets the session status.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsession.sessionstatus
     * @type {Integer} 
     */
    SessionStatus {
        get => this.get_SessionStatus()
    }

    /**
     * An event that is raised when the maximum protocol data unit (PDU) size changes. The PDU is also known as the *maximum transmission unit (MTU)*.
     * 
     * **MaxPduSizeChanged** is raised whenever the negotiated MTU for the Attribute Protocol (ATT) is changed. And that can be changed or negotiated by a remote Bluetooth peripheral. As a developer, you can't change the value used by Windows itself, since that's fully managed by the operating system.
     * 
     * Also see the [GattSession.MaxPduSize](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsession.maxpdusize) property which, as mentioned, is read-only.
     * @remarks
     * > [!IMPORTANT]
     * > See the **Remarks** in the [GattSession.MaxPduSize](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsession.maxpdusize) property topic.
     * @type {TypedEventHandler<GattSession, IInspectable>}
    */
    OnMaxPduSizeChanged {
        get {
            if(!this.HasProp("__OnMaxPduSizeChanged")){
                this.__OnMaxPduSizeChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6c7ec2ec-9f00-5ea0-9a08-60e5070bcf03}"),
                    GattSession,
                    IInspectable
                )
                this.__OnMaxPduSizeChangedToken := this.add_MaxPduSizeChanged(this.__OnMaxPduSizeChanged.iface)
            }
            return this.__OnMaxPduSizeChanged
        }
    }

    /**
     * An event that is triggered when the GATT session status has changed.
     * @type {TypedEventHandler<GattSession, GattSessionStatusChangedEventArgs>}
    */
    OnSessionStatusChanged {
        get {
            if(!this.HasProp("__OnSessionStatusChanged")){
                this.__OnSessionStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0e1210f2-7b6f-543e-8adb-a61d34ab535d}"),
                    GattSession,
                    GattSessionStatusChangedEventArgs
                )
                this.__OnSessionStatusChangedToken := this.add_SessionStatusChanged(this.__OnSessionStatusChanged.iface)
            }
            return this.__OnSessionStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMaxPduSizeChangedToken")) {
            this.remove_MaxPduSizeChanged(this.__OnMaxPduSizeChangedToken)
            this.__OnMaxPduSizeChanged.iface.Dispose()
        }

        if(this.HasProp("__OnSessionStatusChangedToken")) {
            this.remove_SessionStatusChanged(this.__OnSessionStatusChangedToken)
            this.__OnSessionStatusChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {BluetoothDeviceId} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IGattSession")) {
            if ((queryResult := this.QueryInterface(IGattSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattSession := IGattSession(outPtr)
        }

        return this.__IGattSession.get_DeviceId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanMaintainConnection() {
        if (!this.HasProp("__IGattSession")) {
            if ((queryResult := this.QueryInterface(IGattSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattSession := IGattSession(outPtr)
        }

        return this.__IGattSession.get_CanMaintainConnection()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MaintainConnection(value) {
        if (!this.HasProp("__IGattSession")) {
            if ((queryResult := this.QueryInterface(IGattSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattSession := IGattSession(outPtr)
        }

        return this.__IGattSession.put_MaintainConnection(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MaintainConnection() {
        if (!this.HasProp("__IGattSession")) {
            if ((queryResult := this.QueryInterface(IGattSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattSession := IGattSession(outPtr)
        }

        return this.__IGattSession.get_MaintainConnection()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPduSize() {
        if (!this.HasProp("__IGattSession")) {
            if ((queryResult := this.QueryInterface(IGattSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattSession := IGattSession(outPtr)
        }

        return this.__IGattSession.get_MaxPduSize()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SessionStatus() {
        if (!this.HasProp("__IGattSession")) {
            if ((queryResult := this.QueryInterface(IGattSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattSession := IGattSession(outPtr)
        }

        return this.__IGattSession.get_SessionStatus()
    }

    /**
     * 
     * @param {TypedEventHandler<GattSession, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MaxPduSizeChanged(handler) {
        if (!this.HasProp("__IGattSession")) {
            if ((queryResult := this.QueryInterface(IGattSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattSession := IGattSession(outPtr)
        }

        return this.__IGattSession.add_MaxPduSizeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MaxPduSizeChanged(token) {
        if (!this.HasProp("__IGattSession")) {
            if ((queryResult := this.QueryInterface(IGattSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattSession := IGattSession(outPtr)
        }

        return this.__IGattSession.remove_MaxPduSizeChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GattSession, GattSessionStatusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SessionStatusChanged(handler) {
        if (!this.HasProp("__IGattSession")) {
            if ((queryResult := this.QueryInterface(IGattSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattSession := IGattSession(outPtr)
        }

        return this.__IGattSession.add_SessionStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SessionStatusChanged(token) {
        if (!this.HasProp("__IGattSession")) {
            if ((queryResult := this.QueryInterface(IGattSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattSession := IGattSession(outPtr)
        }

        return this.__IGattSession.remove_SessionStatusChanged(token)
    }

    /**
     * Closes the GattSession.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsession.close
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
