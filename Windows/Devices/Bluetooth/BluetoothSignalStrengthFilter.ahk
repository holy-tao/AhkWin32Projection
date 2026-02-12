#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothSignalStrengthFilter.ahk
#Include ..\..\..\Guid.ahk

/**
 * Groups parameters used to configure received signal strength indicator (RSSI)-based filtering.
 * @remarks
 * The BluetoothSignalStrengthFilter class only accepts a limited range for its properties. However, depending on how this class is used by an app, additional restrictions may apply. For example, the valid range for RSSI values differs between Bluetooth LE and Bluetooth BR/EDR devices.
 * 
 * The valid range for these properties are as follows:
 * 
 * 
 * + [InRangeThresholdInDBm](bluetoothsignalstrengthfilter_inrangethresholdindbm.md) - The minimum threshold for an RSSI event to be considered in range. The valid range is -128 to 127.
 * + [OutOfRangeThresholdInDBm](bluetoothsignalstrengthfilter_outofrangethresholdindbm.md) - The minimum threshold for an RSSI event to be considered out of range. The valid range is -128 to 127.
 * + [OutOfRangeTimeout](bluetoothsignalstrengthfilter_outofrangetimeout.md) - Timeout for an RSSI event to be considered out of range. The valid range is equal or greater than 1 second.
 * + [SamplingInterval](bluetoothsignalstrengthfilter_samplinginterval.md) - The interval at which RSSI events are sampled. The valid range is equal or greater than 0. Any sampling interval greater or equal to 25.5 seconds will disable sampling entirely. In that special case, the filtering is trigger-based.
 * There are two possible states for filtering RSSI values for any device:
 * + In range.
 * + Out of range.
 *  Any RSSI events are propagated if they are considered in range. This includes events with RSSI values lower or equal than [OutOfRangeThresholdInDBm](bluetoothsignalstrengthfilter_outofrangethresholdindbm.md) as long as [OutOfRangeTimeout](bluetoothsignalstrengthfilter_outofrangetimeout.md) has not expired.
 * 
 * This class has additional limitations on its properties when used by the [BluetoothLEAdvertisementWatcher](../windows.devices.bluetooth.advertisement/bluetoothleadvertisementwatcher.md) class. An exception will be thrown when the [BluetoothLEAdvertisementWatcher](../windows.devices.bluetooth.advertisement/bluetoothleadvertisementwatcher.md) is started with parameters outside of the valid range for [BluetoothLEAdvertisementWatcher](../windows.devices.bluetooth.advertisement/bluetoothleadvertisementwatcher.md).
 * 
 * In general, there are three main use cases for this API:
 * 
 * | [InRangeThresholdInDBm](bluetoothsignalstrengthfilter_inrangethresholdindbm.md) | [OutOfRangeThresholdInDBm](bluetoothsignalstrengthfilter_outofrangethresholdindbm.md) | [OutOfRangeTimeout](bluetoothsignalstrengthfilter_outofrangetimeout.md) | [SamplingInterval](bluetoothsignalstrengthfilter_samplinginterval.md) | Behavior |
 * |---|---|---|---|---|
 * | Any | &lt;= [InRangeThresholdInDBm](bluetoothsignalstrengthfilter_inrangethresholdindbm.md) | &gt;= 1 | 0 | Will receive all RSSI events as they arrive as long as they are considered "in range". The events are considered "out of range" if [OutOfRangeTimeout](bluetoothsignalstrengthfilter_outofrangetimeout.md) expires without any events or without any events with RSSI values greater than [OutOfRangeThresholdInDBm](bluetoothsignalstrengthfilter_outofrangethresholdindbm.md). No additional events are generated when [OutOfRangeTimeout](bluetoothsignalstrengthfilter_outofrangetimeout.md) expires. |
 * | Any | &lt;= [InRangeThresholdInDBm](bluetoothsignalstrengthfilter_inrangethresholdindbm.md) | &gt;= 1 | (0, 25.5) | Will receive RSSI events on a regular interval defined by [SamplingInterval](bluetoothsignalstrengthfilter_samplinginterval.md) as long as they are considered "in range". The RSSI value will be an average of the values of events received within a [SamplingInterval](bluetoothsignalstrengthfilter_samplinginterval.md). If no events are received within [SamplingInterval](bluetoothsignalstrengthfilter_samplinginterval.md), no event will be propagated. If [OutOfRangeTimeout](bluetoothsignalstrengthfilter_outofrangetimeout.md) expires without any events or without any events with RSSI values greater than [OutOfRangeThresholdInDBm](bluetoothsignalstrengthfilter_outofrangethresholdindbm.md), the events are considered "out of range" and an event with the last RSSI value received will be generated. If the last RSSI value was above [OutOfRangeThresholdInDBm](bluetoothsignalstrengthfilter_outofrangethresholdindbm.md), it is set to -127 dBm. |
 * | Any | &lt;= [InRangeThresholdInDBm](bluetoothsignalstrengthfilter_inrangethresholdindbm.md) | &gt;= 1 | &gt;=25.5 (disabled) | Will receive a RSSI event when the RSSI events are transitioning to "in range" from "out of range". If [OutOfRangeTimeout](bluetoothsignalstrengthfilter_outofrangetimeout.md) expires without any events or without any events with RSSI values greater than [OutOfRangeThresholdInDBm](bluetoothsignalstrengthfilter_outofrangethresholdindbm.md), the events are considered "out of range" and an event with the last RSSI value received will be generated. If the last RSSI value was above [OutOfRangeThresholdInDBm](bluetoothsignalstrengthfilter_outofrangethresholdindbm.md), it is set to [OutOfRangeThresholdInDBm](bluetoothsignalstrengthfilter_outofrangethresholdindbm.md). |
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothsignalstrengthfilter
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothSignalStrengthFilter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothSignalStrengthFilter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothSignalStrengthFilter.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The minimum received signal strength indicator (RSSI) value in dBm on which RSSI events will be propagated or considered in range if the previous events were considered out of range.
     * @remarks
     * The valid range for this property is between -128 and 127.
     * 
     * This condition still applies if no events were received since the beginning of the filtering process. The initial assumption for any device is always out of range. An event is considered in range if its RSSI value is greater than or equal to InRangeThresholdInDBm or if the previous event was considered in range and the [OutOfRangeTimeout](bluetoothsignalstrengthfilter_outofrangetimeout.md) has not expired.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothsignalstrengthfilter.inrangethresholdindbm
     * @type {IReference<Integer>} 
     */
    InRangeThresholdInDBm {
        get => this.get_InRangeThresholdInDBm()
        set => this.put_InRangeThresholdInDBm(value)
    }

    /**
     * The minimum received signal strength indicator (RSSI) value in dBm on which RSSI events will be considered out of range.
     * @remarks
     * The valid range for this property is between -128 and 127.
     * 
     * RSSI events are considered out of range after their RSSI values are kept lower than or equal to OutOfRangeThresholdInDBm within [OutOfRangeTimeout](bluetoothsignalstrengthfilter_outofrangetimeout.md). RSSI events are also considered out of range if no events are received within [OutOfRangeTimeout](bluetoothsignalstrengthfilter_outofrangetimeout.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothsignalstrengthfilter.outofrangethresholdindbm
     * @type {IReference<Integer>} 
     */
    OutOfRangeThresholdInDBm {
        get => this.get_OutOfRangeThresholdInDBm()
        set => this.put_OutOfRangeThresholdInDBm(value)
    }

    /**
     * The timeout for a received signal strength indicator (RSSI) event to be considered out of range.
     * @remarks
     * The valid range for this property is equal or greater than 1 second.
     * 
     * If the RSSI events are currently considered in range, this is the timeout period during which if the received RSSI events have RSSI values less than or equal to [OutOfRangeThresholdInDBm](bluetoothsignalstrengthfilter_outofrangethresholdindbm.md) or no RSSI events are received, further RSSI events will be considered out of range. This timer is reset if received RSSI values are greater than [OutOfRangeThresholdInDBm](bluetoothsignalstrengthfilter_outofrangethresholdindbm.md). If the events are currently out of range, this property has no effect.
     * 
     * When applied to LE advertisements, an advertisement with the minimum RSSI value (-127) will be generated to indicate that the advertisement went out of range.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothsignalstrengthfilter.outofrangetimeout
     * @type {IReference<TimeSpan>} 
     */
    OutOfRangeTimeout {
        get => this.get_OutOfRangeTimeout()
        set => this.put_OutOfRangeTimeout(value)
    }

    /**
     * The interval at which received signal strength indicator (RSSI) events are sampled.
     * @remarks
     * The valid range for this property is equal or greater than zero.
     * 
     * If the SamplingInterval is zero, every received RSSI event that satisfies the conditions configured through the other [BluetoothSignalStrengthFilter](bluetoothsignalstrengthfilter.md) properties will be propagated. If the sampling interval is greater than or equal to a maximum limit value (currently 25.5 seconds), sampling will be disabled and RSSI events will only be propagated on a triggered basis when they transition between in range and out of range. Otherwise, an aggregated RSSI value (average in most cases) of the RSSI events received within SamplingInterval will be propagated. If no RSSI events have been received within SamplingInterval, no RSSI events are propagated.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothsignalstrengthfilter.samplinginterval
     * @type {IReference<TimeSpan>} 
     */
    SamplingInterval {
        get => this.get_SamplingInterval()
        set => this.put_SamplingInterval(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Create a new [BluetoothSignalStrengthFilter](bluetoothsignalstrengthfilter.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothSignalStrengthFilter")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_InRangeThresholdInDBm() {
        if (!this.HasProp("__IBluetoothSignalStrengthFilter")) {
            if ((queryResult := this.QueryInterface(IBluetoothSignalStrengthFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothSignalStrengthFilter := IBluetoothSignalStrengthFilter(outPtr)
        }

        return this.__IBluetoothSignalStrengthFilter.get_InRangeThresholdInDBm()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_InRangeThresholdInDBm(value) {
        if (!this.HasProp("__IBluetoothSignalStrengthFilter")) {
            if ((queryResult := this.QueryInterface(IBluetoothSignalStrengthFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothSignalStrengthFilter := IBluetoothSignalStrengthFilter(outPtr)
        }

        return this.__IBluetoothSignalStrengthFilter.put_InRangeThresholdInDBm(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_OutOfRangeThresholdInDBm() {
        if (!this.HasProp("__IBluetoothSignalStrengthFilter")) {
            if ((queryResult := this.QueryInterface(IBluetoothSignalStrengthFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothSignalStrengthFilter := IBluetoothSignalStrengthFilter(outPtr)
        }

        return this.__IBluetoothSignalStrengthFilter.get_OutOfRangeThresholdInDBm()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_OutOfRangeThresholdInDBm(value) {
        if (!this.HasProp("__IBluetoothSignalStrengthFilter")) {
            if ((queryResult := this.QueryInterface(IBluetoothSignalStrengthFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothSignalStrengthFilter := IBluetoothSignalStrengthFilter(outPtr)
        }

        return this.__IBluetoothSignalStrengthFilter.put_OutOfRangeThresholdInDBm(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_OutOfRangeTimeout() {
        if (!this.HasProp("__IBluetoothSignalStrengthFilter")) {
            if ((queryResult := this.QueryInterface(IBluetoothSignalStrengthFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothSignalStrengthFilter := IBluetoothSignalStrengthFilter(outPtr)
        }

        return this.__IBluetoothSignalStrengthFilter.get_OutOfRangeTimeout()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_OutOfRangeTimeout(value) {
        if (!this.HasProp("__IBluetoothSignalStrengthFilter")) {
            if ((queryResult := this.QueryInterface(IBluetoothSignalStrengthFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothSignalStrengthFilter := IBluetoothSignalStrengthFilter(outPtr)
        }

        return this.__IBluetoothSignalStrengthFilter.put_OutOfRangeTimeout(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_SamplingInterval() {
        if (!this.HasProp("__IBluetoothSignalStrengthFilter")) {
            if ((queryResult := this.QueryInterface(IBluetoothSignalStrengthFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothSignalStrengthFilter := IBluetoothSignalStrengthFilter(outPtr)
        }

        return this.__IBluetoothSignalStrengthFilter.get_SamplingInterval()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_SamplingInterval(value) {
        if (!this.HasProp("__IBluetoothSignalStrengthFilter")) {
            if ((queryResult := this.QueryInterface(IBluetoothSignalStrengthFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothSignalStrengthFilter := IBluetoothSignalStrengthFilter(outPtr)
        }

        return this.__IBluetoothSignalStrengthFilter.put_SamplingInterval(value)
    }

;@endregion Instance Methods
}
