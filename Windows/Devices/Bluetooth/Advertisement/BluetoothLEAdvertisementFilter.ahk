#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAdvertisementFilter.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Groups parameters used to configure payload-based filtering of received Bluetooth LE advertisements.
 * @remarks
 * A Bluetooth LE advertisement filter is applied to an advertisement event packet, and not to the device/source of the advertisement as a whole. The same device can broadcast advertisement packets with different payloads at the same time. For example, it's common for the local name to be in a different advertisement packet from the packet containing the service UUID. So, with a filter set to service UUID, the packet with local name won't be available (only packets with both service UUID and local name will be available in that case).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementfilter
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementFilter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEAdvertisementFilter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEAdvertisementFilter.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A [BluetoothLEAdvertisement](bluetoothleadvertisement.md) object that can be applied as filters to received Bluetooth LE advertisements.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementfilter.advertisement
     * @type {BluetoothLEAdvertisement} 
     */
    Advertisement {
        get => this.get_Advertisement()
        set => this.put_Advertisement(value)
    }

    /**
     * Gets a vector of byte patterns with offsets to match advertisement sections in a received Bluetooth LE advertisement.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.advertisement.bluetoothleadvertisementfilter.bytepatterns
     * @type {IVector<BluetoothLEAdvertisementBytePattern>} 
     */
    BytePatterns {
        get => this.get_BytePatterns()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [BluetoothLEAdvertisementFilter](bluetoothleadvertisementfilter.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Advertisement.BluetoothLEAdvertisementFilter")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {BluetoothLEAdvertisement} 
     */
    get_Advertisement() {
        if (!this.HasProp("__IBluetoothLEAdvertisementFilter")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementFilter := IBluetoothLEAdvertisementFilter(outPtr)
        }

        return this.__IBluetoothLEAdvertisementFilter.get_Advertisement()
    }

    /**
     * 
     * @param {BluetoothLEAdvertisement} value 
     * @returns {HRESULT} 
     */
    put_Advertisement(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementFilter")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementFilter := IBluetoothLEAdvertisementFilter(outPtr)
        }

        return this.__IBluetoothLEAdvertisementFilter.put_Advertisement(value)
    }

    /**
     * 
     * @returns {IVector<BluetoothLEAdvertisementBytePattern>} 
     */
    get_BytePatterns() {
        if (!this.HasProp("__IBluetoothLEAdvertisementFilter")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementFilter := IBluetoothLEAdvertisementFilter(outPtr)
        }

        return this.__IBluetoothLEAdvertisementFilter.get_BytePatterns()
    }

;@endregion Instance Methods
}
