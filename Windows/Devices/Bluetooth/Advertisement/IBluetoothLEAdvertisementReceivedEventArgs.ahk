#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include .\BluetoothLEAdvertisement.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAdvertisementReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAdvertisementReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{27987ddf-e596-41be-8d43-9e6731d4a913}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RawSignalStrengthInDBm", "get_BluetoothAddress", "get_AdvertisementType", "get_Timestamp", "get_Advertisement"]

    /**
     * @type {Integer} 
     */
    RawSignalStrengthInDBm {
        get => this.get_RawSignalStrengthInDBm()
    }

    /**
     * @type {Integer} 
     */
    BluetoothAddress {
        get => this.get_BluetoothAddress()
    }

    /**
     * @type {Integer} 
     */
    AdvertisementType {
        get => this.get_AdvertisementType()
    }

    /**
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * @type {BluetoothLEAdvertisement} 
     */
    Advertisement {
        get => this.get_Advertisement()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RawSignalStrengthInDBm() {
        result := ComCall(6, this, "short*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BluetoothAddress() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AdvertisementType() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        value := DateTime()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {BluetoothLEAdvertisement} 
     */
    get_Advertisement() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEAdvertisement(value)
    }
}
