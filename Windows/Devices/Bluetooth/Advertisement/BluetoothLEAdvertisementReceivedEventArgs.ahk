#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAdvertisementReceivedEventArgs.ahk
#Include .\IBluetoothLEAdvertisementReceivedEventArgs2.ahk
#Include .\IBluetoothLEAdvertisementReceivedEventArgs3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for a [Received](bluetoothleadvertisementwatcher_received.md) event on a [BluetoothLEAdvertisementWatcher](bluetoothleadvertisementwatcher.md). A BluetoothLEAdvertisementReceivedEventArgs instance is created when the [Received](bluetoothleadvertisementwatcher_received.md) event occurs on a [BluetoothLEAdvertisementWatcher](bluetoothleadvertisementwatcher.md) object.
 * @remarks
 * Per [BluetoothSignalStrengthFilter](../windows.devices.bluetooth/bluetoothsignalstrengthfilter.md), when the device signal goes out of range, an "out of range" event will be sent, containing the advertisement data last seen, with the [RawSignalStrengthInDBm](bluetoothleadvertisementreceivedeventargs_rawsignalstrengthindbm.md) value set to -127.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementreceivedeventargs
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEAdvertisementReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEAdvertisementReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the received signal strength indicator (RSSI) value, in dBm, for this received Bluetooth LE advertisement event. This value could be the raw RSSI or a filtered RSSI depending on filtering settings configured through [BluetoothSignalStrengthFilter](../windows.devices.bluetooth/bluetoothsignalstrengthfilter.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementreceivedeventargs.rawsignalstrengthindbm
     * @type {Integer} 
     */
    RawSignalStrengthInDBm {
        get => this.get_RawSignalStrengthInDBm()
    }

    /**
     * Gets the Bluetooth address of the device sending the Bluetooth LE advertisement.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementreceivedeventargs.bluetoothaddress
     * @type {Integer} 
     */
    BluetoothAddress {
        get => this.get_BluetoothAddress()
    }

    /**
     * Gets the type of the received Bluetooth LE advertisement packet.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementreceivedeventargs.advertisementtype
     * @type {Integer} 
     */
    AdvertisementType {
        get => this.get_AdvertisementType()
    }

    /**
     * Gets the timestamp when the [Received](bluetoothleadvertisementwatcher_received.md) event occurred.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementreceivedeventargs.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the Bluetooth LE advertisement payload data received.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementreceivedeventargs.advertisement
     * @type {BluetoothLEAdvertisement} 
     */
    Advertisement {
        get => this.get_Advertisement()
    }

    /**
     * Retrieves the Bluetooth Address Type of the received advertisement.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementreceivedeventargs.bluetoothaddresstype
     * @type {Integer} 
     */
    BluetoothAddressType {
        get => this.get_BluetoothAddressType()
    }

    /**
     * Represents the received transmit power of the advertisement.
     * @remarks
     * The transmit power may be present in the advertisement data, or it may be included using the Extended Advertising format.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementreceivedeventargs.transmitpowerlevelindbm
     * @type {IReference<Integer>} 
     */
    TransmitPowerLevelInDBm {
        get => this.get_TransmitPowerLevelInDBm()
    }

    /**
     * Indicates whether a Bluetooth Address was omitted from the received advertisement.
     * @remarks
     * A result of True indicates that a Bluetooth Address was omitted, and that the advertisement was anonymous. A result of False indicates an address was included.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementreceivedeventargs.isanonymous
     * @type {Boolean} 
     */
    IsAnonymous {
        get => this.get_IsAnonymous()
    }

    /**
     * Indicates whether the received advertisement is connectable.
     * @remarks
     * This property is intended to be used on extended advertisements, which are not necessarily connectable.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementreceivedeventargs.isconnectable
     * @type {Boolean} 
     */
    IsConnectable {
        get => this.get_IsConnectable()
    }

    /**
     * Indicates whether the received advertisement is scannable.
     * @remarks
     * This property is intended to be used on extended advertisements, which are not necessarily scannable.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementreceivedeventargs.isscannable
     * @type {Boolean} 
     */
    IsScannable {
        get => this.get_IsScannable()
    }

    /**
     * Indicates whether the received advertisement is directed.
     * @remarks
     * This property is intended to be used on extended advertisements, which are not necessarily directed or undirected.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementreceivedeventargs.isdirected
     * @type {Boolean} 
     */
    IsDirected {
        get => this.get_IsDirected()
    }

    /**
     * Indicates whether the received advertisement is a scan response.
     * @remarks
     * This property is intended to be used on extended advertisements, which may or may not be scan responses.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementreceivedeventargs.isscanresponse
     * @type {Boolean} 
     */
    IsScanResponse {
        get => this.get_IsScanResponse()
    }

    /**
     * @type {Integer} 
     */
    PrimaryPhy {
        get => this.get_PrimaryPhy()
    }

    /**
     * @type {Integer} 
     */
    SecondaryPhy {
        get => this.get_SecondaryPhy()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RawSignalStrengthInDBm() {
        if (!this.HasProp("__IBluetoothLEAdvertisementReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementReceivedEventArgs := IBluetoothLEAdvertisementReceivedEventArgs(outPtr)
        }

        return this.__IBluetoothLEAdvertisementReceivedEventArgs.get_RawSignalStrengthInDBm()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BluetoothAddress() {
        if (!this.HasProp("__IBluetoothLEAdvertisementReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementReceivedEventArgs := IBluetoothLEAdvertisementReceivedEventArgs(outPtr)
        }

        return this.__IBluetoothLEAdvertisementReceivedEventArgs.get_BluetoothAddress()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AdvertisementType() {
        if (!this.HasProp("__IBluetoothLEAdvertisementReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementReceivedEventArgs := IBluetoothLEAdvertisementReceivedEventArgs(outPtr)
        }

        return this.__IBluetoothLEAdvertisementReceivedEventArgs.get_AdvertisementType()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IBluetoothLEAdvertisementReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementReceivedEventArgs := IBluetoothLEAdvertisementReceivedEventArgs(outPtr)
        }

        return this.__IBluetoothLEAdvertisementReceivedEventArgs.get_Timestamp()
    }

    /**
     * 
     * @returns {BluetoothLEAdvertisement} 
     */
    get_Advertisement() {
        if (!this.HasProp("__IBluetoothLEAdvertisementReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementReceivedEventArgs := IBluetoothLEAdvertisementReceivedEventArgs(outPtr)
        }

        return this.__IBluetoothLEAdvertisementReceivedEventArgs.get_Advertisement()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BluetoothAddressType() {
        if (!this.HasProp("__IBluetoothLEAdvertisementReceivedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementReceivedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementReceivedEventArgs2 := IBluetoothLEAdvertisementReceivedEventArgs2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementReceivedEventArgs2.get_BluetoothAddressType()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_TransmitPowerLevelInDBm() {
        if (!this.HasProp("__IBluetoothLEAdvertisementReceivedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementReceivedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementReceivedEventArgs2 := IBluetoothLEAdvertisementReceivedEventArgs2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementReceivedEventArgs2.get_TransmitPowerLevelInDBm()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAnonymous() {
        if (!this.HasProp("__IBluetoothLEAdvertisementReceivedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementReceivedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementReceivedEventArgs2 := IBluetoothLEAdvertisementReceivedEventArgs2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementReceivedEventArgs2.get_IsAnonymous()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConnectable() {
        if (!this.HasProp("__IBluetoothLEAdvertisementReceivedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementReceivedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementReceivedEventArgs2 := IBluetoothLEAdvertisementReceivedEventArgs2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementReceivedEventArgs2.get_IsConnectable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScannable() {
        if (!this.HasProp("__IBluetoothLEAdvertisementReceivedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementReceivedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementReceivedEventArgs2 := IBluetoothLEAdvertisementReceivedEventArgs2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementReceivedEventArgs2.get_IsScannable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDirected() {
        if (!this.HasProp("__IBluetoothLEAdvertisementReceivedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementReceivedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementReceivedEventArgs2 := IBluetoothLEAdvertisementReceivedEventArgs2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementReceivedEventArgs2.get_IsDirected()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScanResponse() {
        if (!this.HasProp("__IBluetoothLEAdvertisementReceivedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementReceivedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementReceivedEventArgs2 := IBluetoothLEAdvertisementReceivedEventArgs2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementReceivedEventArgs2.get_IsScanResponse()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrimaryPhy() {
        if (!this.HasProp("__IBluetoothLEAdvertisementReceivedEventArgs3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementReceivedEventArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementReceivedEventArgs3 := IBluetoothLEAdvertisementReceivedEventArgs3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementReceivedEventArgs3.get_PrimaryPhy()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SecondaryPhy() {
        if (!this.HasProp("__IBluetoothLEAdvertisementReceivedEventArgs3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementReceivedEventArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementReceivedEventArgs3 := IBluetoothLEAdvertisementReceivedEventArgs3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementReceivedEventArgs3.get_SecondaryPhy()
    }

;@endregion Instance Methods
}
