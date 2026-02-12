#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\BluetoothLEAdvertisementScanParameters.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAdvertisementWatcher3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAdvertisementWatcher3
     * @type {Guid}
     */
    static IID => Guid("{14d980be-4002-5dbe-8519-ffca6ca389f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UseUncoded1MPhy", "put_UseUncoded1MPhy", "get_UseCodedPhy", "put_UseCodedPhy", "get_ScanParameters", "put_ScanParameters", "get_UseHardwareFilter", "put_UseHardwareFilter"]

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

    /**
     * @type {Boolean} 
     */
    UseHardwareFilter {
        get => this.get_UseHardwareFilter()
        set => this.put_UseHardwareFilter(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseUncoded1MPhy() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseUncoded1MPhy(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseCodedPhy() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseCodedPhy(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BluetoothLEAdvertisementScanParameters} 
     */
    get_ScanParameters() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEAdvertisementScanParameters(value)
    }

    /**
     * 
     * @param {BluetoothLEAdvertisementScanParameters} value 
     * @returns {HRESULT} 
     */
    put_ScanParameters(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseHardwareFilter() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseHardwareFilter(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
