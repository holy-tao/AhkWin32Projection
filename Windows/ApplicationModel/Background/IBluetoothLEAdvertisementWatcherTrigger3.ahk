#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Devices\Bluetooth\Advertisement\BluetoothLEAdvertisementScanParameters.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAdvertisementWatcherTrigger3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAdvertisementWatcherTrigger3
     * @type {Guid}
     */
    static IID => Guid("{da50011a-8261-56a0-ac7b-a8de1624088b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UseUncoded1MPhy", "put_UseUncoded1MPhy", "get_UseCodedPhy", "put_UseCodedPhy", "get_ScanParameters", "put_ScanParameters"]

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
}
