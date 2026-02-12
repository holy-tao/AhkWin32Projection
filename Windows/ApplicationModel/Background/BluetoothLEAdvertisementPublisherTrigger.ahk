#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAdvertisementPublisherTrigger.ahk
#Include .\IBluetoothLEAdvertisementPublisherTrigger2.ahk
#Include .\IBluetoothLEAdvertisementPublisherTrigger3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that is registered to advertise a Bluetooth LE advertisement in the background.
 * @remarks
 * A background task is launched when the status of the background publisher changes.
 * 
 * This trigger works similarly to the BluetoothAdvertisementPublisher class with the exception that it has more restrictions as it allows the app to maintain advertising in the background. Once registered, the background publisher is serviced in a best effort manner. A background task will be launched to notify the App on the status of the publisher. Right after registration, the status is expected to be either Started or Waiting (if the trigger cannot be serviced at the moment). The app is also notified of failures or interruption of the background publisher through the trigger details provided in the background task context. To stop advertising, the background task associated with this trigger must be unregistered.
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
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.bluetoothleadvertisementpublishertrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementPublisherTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEAdvertisementPublisherTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEAdvertisementPublisherTrigger.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Bluetooth LE advertisement to configure and publish in the background.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.bluetoothleadvertisementpublishertrigger.advertisement
     * @type {BluetoothLEAdvertisement} 
     */
    Advertisement {
        get => this.get_Advertisement()
    }

    /**
     * If specified, requests that the radio use the indicated transmit power level for the advertisement. Defaults to Null.
     * @remarks
     * This API has no effect on radios that do not support the Extended Advertising format.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.bluetoothleadvertisementpublishertrigger.preferredtransmitpowerlevelindbm
     * @type {IReference<Integer>} 
     */
    PreferredTransmitPowerLevelInDBm {
        get => this.get_PreferredTransmitPowerLevelInDBm()
        set => this.put_PreferredTransmitPowerLevelInDBm(value)
    }

    /**
     * Specifies that the advertisement publisher should use the Extended Advertising format.
     * @remarks
     * Enabling the Extended Advertising format is necessary to enable several other related properties of the [BluetoothLEAdvertisementPublisherTrigger](bluetoothleadvertisementpublishertrigger.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.bluetoothleadvertisementpublishertrigger.useextendedformat
     * @type {Boolean} 
     */
    UseExtendedFormat {
        get => this.get_UseExtendedFormat()
        set => this.put_UseExtendedFormat(value)
    }

    /**
     * Specifies whether or not the device address is included in the advertisement header. By default, the address is included.
     * @remarks
     * The advertisement publisher must use the Extended Advertising format to utilize this API.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.bluetoothleadvertisementpublishertrigger.isanonymous
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
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.bluetoothleadvertisementpublishertrigger.includetransmitpowerlevel
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

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [BluetoothLEAdvertisementPublisherTrigger](bluetoothleadvertisementpublishertrigger.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BluetoothLEAdvertisementPublisherTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {BluetoothLEAdvertisement} 
     */
    get_Advertisement() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherTrigger")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherTrigger := IBluetoothLEAdvertisementPublisherTrigger(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherTrigger.get_Advertisement()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PreferredTransmitPowerLevelInDBm() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherTrigger2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherTrigger2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherTrigger2 := IBluetoothLEAdvertisementPublisherTrigger2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherTrigger2.get_PreferredTransmitPowerLevelInDBm()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_PreferredTransmitPowerLevelInDBm(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherTrigger2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherTrigger2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherTrigger2 := IBluetoothLEAdvertisementPublisherTrigger2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherTrigger2.put_PreferredTransmitPowerLevelInDBm(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseExtendedFormat() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherTrigger2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherTrigger2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherTrigger2 := IBluetoothLEAdvertisementPublisherTrigger2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherTrigger2.get_UseExtendedFormat()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseExtendedFormat(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherTrigger2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherTrigger2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherTrigger2 := IBluetoothLEAdvertisementPublisherTrigger2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherTrigger2.put_UseExtendedFormat(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAnonymous() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherTrigger2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherTrigger2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherTrigger2 := IBluetoothLEAdvertisementPublisherTrigger2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherTrigger2.get_IsAnonymous()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAnonymous(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherTrigger2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherTrigger2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherTrigger2 := IBluetoothLEAdvertisementPublisherTrigger2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherTrigger2.put_IsAnonymous(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeTransmitPowerLevel() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherTrigger2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherTrigger2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherTrigger2 := IBluetoothLEAdvertisementPublisherTrigger2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherTrigger2.get_IncludeTransmitPowerLevel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeTransmitPowerLevel(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherTrigger2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherTrigger2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherTrigger2 := IBluetoothLEAdvertisementPublisherTrigger2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherTrigger2.put_IncludeTransmitPowerLevel(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrimaryPhy() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherTrigger3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherTrigger3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherTrigger3 := IBluetoothLEAdvertisementPublisherTrigger3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherTrigger3.get_PrimaryPhy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PrimaryPhy(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherTrigger3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherTrigger3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherTrigger3 := IBluetoothLEAdvertisementPublisherTrigger3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherTrigger3.put_PrimaryPhy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SecondaryPhy() {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherTrigger3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherTrigger3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherTrigger3 := IBluetoothLEAdvertisementPublisherTrigger3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherTrigger3.get_SecondaryPhy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SecondaryPhy(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementPublisherTrigger3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementPublisherTrigger3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementPublisherTrigger3 := IBluetoothLEAdvertisementPublisherTrigger3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementPublisherTrigger3.put_SecondaryPhy(value)
    }

;@endregion Instance Methods
}
