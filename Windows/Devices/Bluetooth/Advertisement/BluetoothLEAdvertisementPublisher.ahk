#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAdvertisementPublisher.ahk
#Include .\IBluetoothLEAdvertisementPublisher2.ahk
#Include .\IBluetoothLEAdvertisementPublisher3.ahk
#Include .\IBluetoothLEAdvertisementPublisherFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\BluetoothLEAdvertisementPublisher.ahk
#Include .\BluetoothLEAdvertisementPublisherStatusChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * An object to send Bluetooth Low Energy (LE) advertisements.
 * @remarks
 * The BluetoothLEAdvertisementPublisher class allows the configuration and advertising of a Bluetooth LE advertisement packet. The advertising request is serviced on a best effort basis and the advertising parameters are defined by an advertising policy.
 * 
 * The payload of the advertisement is configured when the BluetoothLEAdvertisementPublisher is constructed. The payload can be retrieved by the [Advertisement](bluetoothleadvertisementpublisher_advertisement.md) property of the BluetoothLEAdvertisementPublisher. The [BluetoothLEAdvertisement](bluetoothleadvertisement.md) class must be managed by the caller if used this way. For example, it is not recommended to directly reuse a [BluetoothLEAdvertisement](bluetoothleadvertisement.md) obtained from a [BluetoothLEAdvertisementReceivedEventArgs](bluetoothleadvertisementreceivedeventargs.md) because it contains duplication of actual payload in order to facilitate the access to common data sections. If a received [BluetoothLEAdvertisement](bluetoothleadvertisement.md) needs to be duplicated, only the [DataSections](bluetoothleadvertisement_datasections.md) property should be copied, as they represent the advertisement data sections in their raw form.
 * 
 * The local advertisement resource is limited at the protocol layer. Usage of this resource is best suited for controlled scenarios such as enterprise use cases. Other apps may compete for this limited resource and regular broadcast of advertisements for any specific use case cannot be guaranteed.
 * 
 * The following advertisement types are allowed:
 * 
 * + Manufacturer Specific Information (0xFF)
 * + Any non-standard type not reserved by the system, as shown in the list below. For more information on non-standard types, see the [Assigned numbers and GAP](https://www.bluetooth.com/specifications/assigned-numbers/generic-access-profile/) Bluetooth specification.
 * 
 * The following advertisement types are system-reserved and are not allowed:
 * 
 * + Flags (0x01)
 * + Incomplete List of 16-bit Service UUIDs (0x02)
 * + Complete List of 16-bit Service UUIDs (0x03)
 * + Incomplete List of 32-bit Service UUIDs (0x04)
 * + Complete List of 32-bit Service UUIDs (0x05)
 * + Incomplete List of 128-bit Service UUIDs (0x06)
 * + Complete List of 128-bit Service UUIDs (0x07)
 * + Shortened Local Name (0x08)
 * + Complete Local Name (0x09)
 * + Tx Power Level (0x0A)
 * + Class of Device (0x0D)
 * + Simple Pairing Hash C192 (0x0E)
 * + Simple Pairing Randomizer R192 (0x0F)
 * + Security Manager TK Values (0x10)
 * + Security Manager Out-of-Band Flags (0x11)
 * + Peripheral Connection Interval Range (0x12)
 * + List of 16-bit Service Solicitation UUIDs (0x14)
 * + List of 32-bit Service Solicitation UUIDs (0x1F)
 * + List of 128-bit Service Solicitation UUIDs (0x15)
 * + Service Data 16-bit UUID (0x16)
 * + Service Data 32-bit UUID (0x20)
 * + Service Data 128-bit UUID (0x21)
 * + Public Target Address (0x17)
 * + Random Target Address (0x18)
 * + Appearance (0x19)
 * + Advertising Interval (0x1A)
 * + LE Bluetooth Device Address (0x1B)
 * + LE Role (0x1C)
 * + Simple Pairing Hash C256 (0x1D)
 * + Simple Pairing Randomizer R256 (0x1E)
 * + 3D Information Data (0x3D)
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementpublisher
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementPublisher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEAdvertisementPublisher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEAdvertisementPublisher.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md) object with the Bluetooth LE advertisement to publish.
     * @remarks
     * There are additional policy restrictions on certain system-reserved data types that cannot be advertised through using the [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md). Advertisement containing these data types will be rejected and an exception will be thrown when the [Start](/uwp/api/Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementPublisher.Start) method is called.
     * @param {BluetoothLEAdvertisement} advertisement The Bluetooth LE advertisement to publish.
     * @returns {BluetoothLEAdvertisementPublisher} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementpublisher.#ctor
     */
    static Create(advertisement) {
        if (!BluetoothLEAdvertisementPublisher.HasProp("__IBluetoothLEAdvertisementPublisherFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementPublisher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEAdvertisementPublisherFactory.IID)
            BluetoothLEAdvertisementPublisher.__IBluetoothLEAdvertisementPublisherFactory := IBluetoothLEAdvertisementPublisherFactory(factoryPtr)
        }

        return BluetoothLEAdvertisementPublisher.__IBluetoothLEAdvertisementPublisherFactory.Create(advertisement)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the current status of the [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementpublisher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets a copy of the Bluetooth LE advertisement to publish.
     * 
     * When configuring the publisher object, you can't add restricted section types ([BluetoothLEAdvertisementPublisher.Advertisement.Flags](/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisement.flags) and [BluetoothLEAdvertisementPublisher.Advertisement.LocalName](/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisement.localname)). Trying to set those property values results in a runtime exception. You can still set the manufacturer data section, or any other sections not defined by the list of restrictions.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementpublisher.advertisement
     * @type {BluetoothLEAdvertisement} 
     */
    Advertisement {
        get => this.get_Advertisement()
    }

    /**
     * If specified, requests that the radio use the indicated transmit power level for the advertisement. Defaults to Null.
     * @remarks
     * This API has no effect on radios that do not support the Extended Advertising format.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementpublisher.preferredtransmitpowerlevelindbm
     * @type {IReference<Integer>} 
     */
    PreferredTransmitPowerLevelInDBm {
        get => this.get_PreferredTransmitPowerLevelInDBm()
        set => this.put_PreferredTransmitPowerLevelInDBm(value)
    }

    /**
     * Specifies that the advertisement publisher should use the Extended Advertising format.
     * @remarks
     * Enabling the Extended Advertising format is necessary to enable several other related properties of the [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementpublisher.useextendedadvertisement
     * @type {Boolean} 
     */
    UseExtendedAdvertisement {
        get => this.get_UseExtendedAdvertisement()
        set => this.put_UseExtendedAdvertisement(value)
    }

    /**
     * Specifies whether or not the device address is included in the advertisement header. By default, the address is included.
     * @remarks
     * The advertisement publisher must use the Extended Advertising format to utilize this API.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementpublisher.isanonymous
     * @type {Boolean} 
     */
    IsAnonymous {
        get => this.get_IsAnonymous()
        set => this.put_IsAnonymous(value)
    }

    /**
     * Specifies whether the transmit power level is included in the advertisement header. Defaults to False.
     * @remarks
     * The advertisement publisher must use the Extended Advertising format to utilize this API.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementpublisher.includetransmitpowerlevel
     * @type {Boolean} 
     */
    IncludeTransmitPowerLevel {
        get => this.get_IncludeTransmitPowerLevel()
        set => this.put_IncludeTransmitPowerLevel(value)
    }

    /**
     * @type {Integer} 
     */
    PrimaryPhy {
        get => this.get_PrimaryPhy()
        set => this.put_PrimaryPhy(value)
    }

    /**
     * @type {Integer} 
     */
    SecondaryPhy {
        get => this.get_SecondaryPhy()
        set => this.put_SecondaryPhy(value)
    }

    /**
     * Notification that the status of the [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md) has changed.
     * @type {TypedEventHandler<BluetoothLEAdvertisementPublisher, BluetoothLEAdvertisementPublisherStatusChangedEventArgs>}
    */
    OnStatusChanged {
        get {
            if(!this.HasProp("__OnStatusChanged")){
                this.__OnStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c2ffa4f1-5893-54a8-bd94-aa1198b05d07}"),
                    BluetoothLEAdvertisementPublisher,
                    BluetoothLEAdvertisementPublisherStatusChangedEventArgs
                )
                this.__OnStatusChangedToken := this.add_StatusChanged(this.__OnStatusChanged.iface)
            }
            return this.__OnStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementPublisher")
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
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher := IBluetoothLEAdvertisementPublisher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher.get_Status()
    }

    /**
     * 
     * @returns {BluetoothLEAdvertisement} 
     */
    get_Advertisement() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher := IBluetoothLEAdvertisementPublisher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher.get_Advertisement()
    }

    /**
     * Start advertising a Bluetooth LE advertisement payload.
     * @remarks
     * The status of the [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md) will transition to **Started** or **Waiting** depending on whether the advertisement can be serviced or to the **Aborted** state if the request failed immediately due to error.
     * 
     * If the Start method is called in the **Stopping** state, the request will be pended and the state will remain in the **Stopping** state until the request completes, at which time a new request will be sent and the state will transition into **Started**.
     * 
     * The [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md) will be automatically stopped when an app is suspended.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementpublisher.start
     */
    Start() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher := IBluetoothLEAdvertisementPublisher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher.Start()
    }

    /**
     * Stop the publisher and stop advertising a Bluetooth LE advertisement payload.
     * @remarks
     * The status of the [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md) will transition to the **Stopping** state until the advertising is cancelled in which the state will transition to **Stopped** state. Calling the Stop method in the **Stopped** or **Aborted** state has no effect. Calling the Stop method in the **Stopping** state will overwrite any advertisements in the last [Start](bluetoothleadvertisementpublisher_start_1587696324.md) method call during that state.
     * 
     * The [BluetoothLEAdvertisementPublisher](bluetoothleadvertisementpublisher.md) will be automatically stopped when an app is suspended.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementpublisher.stop
     */
    Stop() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher := IBluetoothLEAdvertisementPublisher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher.Stop()
    }

    /**
     * 
     * @param {TypedEventHandler<BluetoothLEAdvertisementPublisher, BluetoothLEAdvertisementPublisherStatusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusChanged(handler) {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher := IBluetoothLEAdvertisementPublisher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher.add_StatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusChanged(token) {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher := IBluetoothLEAdvertisementPublisher(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher.remove_StatusChanged(token)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PreferredTransmitPowerLevelInDBm() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher2 := IBluetoothLEAdvertisementPublisher2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher2.get_PreferredTransmitPowerLevelInDBm()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_PreferredTransmitPowerLevelInDBm(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher2 := IBluetoothLEAdvertisementPublisher2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher2.put_PreferredTransmitPowerLevelInDBm(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseExtendedAdvertisement() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher2 := IBluetoothLEAdvertisementPublisher2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher2.get_UseExtendedAdvertisement()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseExtendedAdvertisement(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher2 := IBluetoothLEAdvertisementPublisher2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher2.put_UseExtendedAdvertisement(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAnonymous() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher2 := IBluetoothLEAdvertisementPublisher2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher2.get_IsAnonymous()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAnonymous(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher2 := IBluetoothLEAdvertisementPublisher2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher2.put_IsAnonymous(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeTransmitPowerLevel() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher2 := IBluetoothLEAdvertisementPublisher2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher2.get_IncludeTransmitPowerLevel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeTransmitPowerLevel(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher2 := IBluetoothLEAdvertisementPublisher2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher2.put_IncludeTransmitPowerLevel(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrimaryPhy() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher3 := IBluetoothLEAdvertisementPublisher3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher3.get_PrimaryPhy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PrimaryPhy(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher3 := IBluetoothLEAdvertisementPublisher3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher3.put_PrimaryPhy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SecondaryPhy() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher3 := IBluetoothLEAdvertisementPublisher3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher3.get_SecondaryPhy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SecondaryPhy(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisher3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisher3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisher3 := IBluetoothLEAdvertisementPublisher3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisher3.put_SecondaryPhy(value)
    }

;@endregion Instance Methods
}
