#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Devices\Bluetooth\BluetoothSignalStrengthFilter.ahk
#Include ..\..\Devices\Bluetooth\Advertisement\BluetoothLEAdvertisementFilter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAdvertisementWatcherTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAdvertisementWatcherTrigger
     * @type {Guid}
     */
    static IID => Guid("{1aab1819-bce1-48eb-a827-59fb7cee52a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinSamplingInterval", "get_MaxSamplingInterval", "get_MinOutOfRangeTimeout", "get_MaxOutOfRangeTimeout", "get_SignalStrengthFilter", "put_SignalStrengthFilter", "get_AdvertisementFilter", "put_AdvertisementFilter"]

    /**
     * @type {TimeSpan} 
     */
    MinSamplingInterval {
        get => this.get_MinSamplingInterval()
    }

    /**
     * @type {TimeSpan} 
     */
    MaxSamplingInterval {
        get => this.get_MaxSamplingInterval()
    }

    /**
     * @type {TimeSpan} 
     */
    MinOutOfRangeTimeout {
        get => this.get_MinOutOfRangeTimeout()
    }

    /**
     * @type {TimeSpan} 
     */
    MaxOutOfRangeTimeout {
        get => this.get_MaxOutOfRangeTimeout()
    }

    /**
     * @type {BluetoothSignalStrengthFilter} 
     */
    SignalStrengthFilter {
        get => this.get_SignalStrengthFilter()
        set => this.put_SignalStrengthFilter(value)
    }

    /**
     * @type {BluetoothLEAdvertisementFilter} 
     */
    AdvertisementFilter {
        get => this.get_AdvertisementFilter()
        set => this.put_AdvertisementFilter(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MinSamplingInterval() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MaxSamplingInterval() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MinOutOfRangeTimeout() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MaxOutOfRangeTimeout() {
        value := TimeSpan()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {BluetoothSignalStrengthFilter} 
     */
    get_SignalStrengthFilter() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothSignalStrengthFilter(value)
    }

    /**
     * 
     * @param {BluetoothSignalStrengthFilter} value 
     * @returns {HRESULT} 
     */
    put_SignalStrengthFilter(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BluetoothLEAdvertisementFilter} 
     */
    get_AdvertisementFilter() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEAdvertisementFilter(value)
    }

    /**
     * 
     * @param {BluetoothLEAdvertisementFilter} value 
     * @returns {HRESULT} 
     */
    put_AdvertisementFilter(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
