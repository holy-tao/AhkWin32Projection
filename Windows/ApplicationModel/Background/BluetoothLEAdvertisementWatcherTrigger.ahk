#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEAdvertisementWatcherTrigger.ahk
#Include .\IBluetoothLEAdvertisementWatcherTrigger2.ahk
#Include .\IBluetoothLEAdvertisementWatcherTrigger3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that is registered to scan for Bluetooth LE advertisement in the background.
 * @remarks
 * A background task is launched when an advertisement is received.
 * 
 * This trigger works similarly to the [BluetoothAdvertisementWatcher](../windows.devices.bluetooth.advertisement/bluetoothleadvertisementwatcher.md) class, with the exception that it has more restrictions as it allows the app to receive advertisements in the background. Notably, exactly a single filter pattern is accepted in the background (not more, not less).
 * 
 * Once registered, the background watcher is serviced in a best effort manner. A background task will be launched to notify the app when an advertisement matching the filter configured through trigger is received. The app is also notified of failures or interruption of the background watcher through the trigger details provided in the background task context. To stop receiving the advertisements, the background task associated with this trigger must be unregistered.
 * 
 * The following advertisement types are not allowed to be filtered for in the background due to their generic nature
 * 
 * + Flags (0x01)
 * + Class of Device (0x0D)
 * + Security Manager Out-of-Band Flags (0x11)
 * + Appearance (0x19)
 * + LE Role (0x1C)
 * 
 * A background filter for a raw section of type manufacturer specific data (0xFF) that only matches for the second byte of the section with 0x00 will be rejected, as it corresponds to the most significant byte of the company identifier field. All SIG-assigned company identifiers currently have this byte set to 0x00 and performing a partial match with only a single byte can potentially result in an excess of received advertisements when in presence of multiple advertisers. This could significantly impact the battery life of the system.
 * 
 * Use of a BluetoothLEAdvertisementWatcherTrigger is limited by the hardware offload resources available. New Windows devices with [HCI Extensions](/windows-hardware/drivers/ddi/content/index) support in the local Bluetooth radio provide lower power advertisement scanning, improving battery life for long term scenarios such as beacons. The amount of hardware resources available is dependent on the radio and current system-wide usage, and attempts to register for this trigger will return [BluetoothError.ResourceInUse](../windows.devices.bluetooth/bluetootherror.md) when no more resources are available. Apps should use these resources sparingly to provide a focused, power efficient scenario in watching for the unique advertisement data for only the specific remote advertisers which are needed.
 * 
 * While many new Windows devices have HCI Extensions support, some may not, especially in cases of upgrades on older devices from older Windows versions. In these cases, Windows will emulate the hardware filtering in software, providing a maximum of 20 trigger conditions per device, across all apps on the system. When using this software emulation, attempts to register for trigger resources once the maximum has been reached will cause an exception to be thrown, with error **ERROR_NO_SYSTEM_RESOURCES (0x800705AA)**.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.bluetoothleadvertisementwatchertrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class BluetoothLEAdvertisementWatcherTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEAdvertisementWatcherTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEAdvertisementWatcherTrigger.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the minimum sampling interval supported for the [SignalStrengthFilter](bluetoothleadvertisementwatchertrigger_signalstrengthfilter.md) property of this trigger. The minimum sampling interval for the background watcher cannot be zero unlike its foreground counterpart.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.bluetoothleadvertisementwatchertrigger.minsamplinginterval
     * @type {TimeSpan} 
     */
    MinSamplingInterval {
        get => this.get_MinSamplingInterval()
    }

    /**
     * Gets the maximum sampling interval supported for the [SignalStrengthFilter](bluetoothleadvertisementwatchertrigger_signalstrengthfilter.md) property of this trigger. The maximum sampling interval is used to deactivate the sampling filter and only trigger received events based on the device coming in and out of range.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.bluetoothleadvertisementwatchertrigger.maxsamplinginterval
     * @type {TimeSpan} 
     */
    MaxSamplingInterval {
        get => this.get_MaxSamplingInterval()
    }

    /**
     * Gets the minimum out of range timeout supported for the [SignalStrengthFilter](bluetoothleadvertisementwatchertrigger_signalstrengthfilter.md) property of this trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.bluetoothleadvertisementwatchertrigger.minoutofrangetimeout
     * @type {TimeSpan} 
     */
    MinOutOfRangeTimeout {
        get => this.get_MinOutOfRangeTimeout()
    }

    /**
     * Gets the maximum out of range timeout supported for the [SignalStrengthFilter](bluetoothleadvertisementwatchertrigger_signalstrengthfilter.md) property of this trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.bluetoothleadvertisementwatchertrigger.maxoutofrangetimeout
     * @type {TimeSpan} 
     */
    MaxOutOfRangeTimeout {
        get => this.get_MaxOutOfRangeTimeout()
    }

    /**
     * Gets or sets the configuration of Bluetooth LE advertisement filtering that uses signal strength-based filtering.
     * @remarks
     * The SignalStrengthFilter has additional limitations on its properties when used by the [BluetoothLEAdvertisementWatcherTrigger](bluetoothleadvertisementwatchertrigger.md) class. The trigger will fail to register if it contains parameters outside of the valid range. If the properties are left as `NULL`, a default value is selected.
     * 
     * 
     * The additional restrictions and default values are as follows:
     * 
     * + **InRangeThresholdInDBm**: The maximum value for RSSI for Bluetooth LE is +20. The minimum value for RSSI for Bluetooth LE is -127 (default when NULL is -127).
     * + **OutOfRangeThresholdInDBm**: The maximum value for RSSI for Bluetooth LE is +20. The maximim value for RSSI for Bluetooth LE is -127 (default when NULL is -127).
     * + **OutOfRangeTimeout**: Equal or greater than 1 second and less than or equal to 60 seconds (default when NULL is 60 seconds).
     * + **SamplingInterval**: Equal or greater than 1 second. Any sampling interval greater or equal to 25.5 seconds will disable sampling entirely. In that special case, the filtering is trigger-based. For more information about the behavior of the RSSI filtering, refer to [BluetoothSignalStrengthFilter](../windows.devices.bluetooth/bluetoothsignalstrengthfilter.md).
     * 
     * 
     * Additional restrictions are in place such that a filter with **OutOfRangeThresholdInDBm** higher than **InRangeThresholdInDBm** will be rejected for example. Some of these limits are obtainable programmatically through the [MinSamplingInterval](bluetoothleadvertisementwatchertrigger_minsamplinginterval.md), [MaxSamplingInterval](bluetoothleadvertisementwatchertrigger_maxsamplinginterval.md), [MinOutOfRangeTimeout](bluetoothleadvertisementwatchertrigger_minoutofrangetimeout.md) and [MaxOutOfRangeTimeout](bluetoothleadvertisementwatchertrigger_maxoutofrangetimeout.md) properties.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.bluetoothleadvertisementwatchertrigger.signalstrengthfilter
     * @type {BluetoothSignalStrengthFilter} 
     */
    SignalStrengthFilter {
        get => this.get_SignalStrengthFilter()
        set => this.put_SignalStrengthFilter(value)
    }

    /**
     * Gets or sets the configuration of Bluetooth LE advertisement filtering that uses payload section-based filtering.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.bluetoothleadvertisementwatchertrigger.advertisementfilter
     * @type {BluetoothLEAdvertisementFilter} 
     */
    AdvertisementFilter {
        get => this.get_AdvertisementFilter()
        set => this.put_AdvertisementFilter(value)
    }

    /**
     * Enables reception of advertisements using the Extended Advertising format. Defaults to False.
     * @remarks
     * The Extended Advertisement format allows for further customization of the advertising header. See the related APIs for more information.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.bluetoothleadvertisementwatchertrigger.allowextendedadvertisements
     * @type {Boolean} 
     */
    AllowExtendedAdvertisements {
        get => this.get_AllowExtendedAdvertisements()
        set => this.put_AllowExtendedAdvertisements(value)
    }

    /**
     * @type {Boolean} 
     */
    UseUncoded1MPhy {
        get => this.get_UseUncoded1MPhy()
        set => this.put_UseUncoded1MPhy(value)
    }

    /**
     * @type {Boolean} 
     */
    UseCodedPhy {
        get => this.get_UseCodedPhy()
        set => this.put_UseCodedPhy(value)
    }

    /**
     * @type {BluetoothLEAdvertisementScanParameters} 
     */
    ScanParameters {
        get => this.get_ScanParameters()
        set => this.put_ScanParameters(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [BluetoothLEAdvertisementWatcherTrigger](bluetoothleadvertisementwatchertrigger.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BluetoothLEAdvertisementWatcherTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MinSamplingInterval() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTrigger")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTrigger := IBluetoothLEAdvertisementWatcherTrigger(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTrigger.get_MinSamplingInterval()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MaxSamplingInterval() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTrigger")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTrigger := IBluetoothLEAdvertisementWatcherTrigger(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTrigger.get_MaxSamplingInterval()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MinOutOfRangeTimeout() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTrigger")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTrigger := IBluetoothLEAdvertisementWatcherTrigger(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTrigger.get_MinOutOfRangeTimeout()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MaxOutOfRangeTimeout() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTrigger")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTrigger := IBluetoothLEAdvertisementWatcherTrigger(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTrigger.get_MaxOutOfRangeTimeout()
    }

    /**
     * 
     * @returns {BluetoothSignalStrengthFilter} 
     */
    get_SignalStrengthFilter() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTrigger")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTrigger := IBluetoothLEAdvertisementWatcherTrigger(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTrigger.get_SignalStrengthFilter()
    }

    /**
     * 
     * @param {BluetoothSignalStrengthFilter} value 
     * @returns {HRESULT} 
     */
    put_SignalStrengthFilter(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTrigger")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTrigger := IBluetoothLEAdvertisementWatcherTrigger(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTrigger.put_SignalStrengthFilter(value)
    }

    /**
     * 
     * @returns {BluetoothLEAdvertisementFilter} 
     */
    get_AdvertisementFilter() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTrigger")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTrigger := IBluetoothLEAdvertisementWatcherTrigger(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTrigger.get_AdvertisementFilter()
    }

    /**
     * 
     * @param {BluetoothLEAdvertisementFilter} value 
     * @returns {HRESULT} 
     */
    put_AdvertisementFilter(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTrigger")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTrigger := IBluetoothLEAdvertisementWatcherTrigger(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTrigger.put_AdvertisementFilter(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowExtendedAdvertisements() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTrigger2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTrigger2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTrigger2 := IBluetoothLEAdvertisementWatcherTrigger2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTrigger2.get_AllowExtendedAdvertisements()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowExtendedAdvertisements(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTrigger2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTrigger2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTrigger2 := IBluetoothLEAdvertisementWatcherTrigger2(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTrigger2.put_AllowExtendedAdvertisements(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseUncoded1MPhy() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTrigger3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTrigger3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTrigger3 := IBluetoothLEAdvertisementWatcherTrigger3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTrigger3.get_UseUncoded1MPhy()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseUncoded1MPhy(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTrigger3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTrigger3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTrigger3 := IBluetoothLEAdvertisementWatcherTrigger3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTrigger3.put_UseUncoded1MPhy(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseCodedPhy() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTrigger3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTrigger3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTrigger3 := IBluetoothLEAdvertisementWatcherTrigger3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTrigger3.get_UseCodedPhy()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseCodedPhy(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTrigger3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTrigger3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTrigger3 := IBluetoothLEAdvertisementWatcherTrigger3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTrigger3.put_UseCodedPhy(value)
    }

    /**
     * 
     * @returns {BluetoothLEAdvertisementScanParameters} 
     */
    get_ScanParameters() {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTrigger3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTrigger3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTrigger3 := IBluetoothLEAdvertisementWatcherTrigger3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTrigger3.get_ScanParameters()
    }

    /**
     * 
     * @param {BluetoothLEAdvertisementScanParameters} value 
     * @returns {HRESULT} 
     */
    put_ScanParameters(value) {
        if (!this.HasProp("__IBluetoothLEAdvertisementWatcherTrigger3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEAdvertisementWatcherTrigger3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEAdvertisementWatcherTrigger3 := IBluetoothLEAdvertisementWatcherTrigger3(outPtr)
        }

        return this.__IBluetoothLEAdvertisementWatcherTrigger3.put_ScanParameters(value)
    }

;@endregion Instance Methods
}
