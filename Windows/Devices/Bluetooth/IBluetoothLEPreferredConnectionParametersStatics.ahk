#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BluetoothLEPreferredConnectionParameters.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEPreferredConnectionParametersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEPreferredConnectionParametersStatics
     * @type {Guid}
     */
    static IID => Guid("{0e3e8edc-2751-55aa-a838-8faeee818d72}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Balanced", "get_ThroughputOptimized", "get_PowerOptimized"]

    /**
     * @type {BluetoothLEPreferredConnectionParameters} 
     */
    Balanced {
        get => this.get_Balanced()
    }

    /**
     * @type {BluetoothLEPreferredConnectionParameters} 
     */
    ThroughputOptimized {
        get => this.get_ThroughputOptimized()
    }

    /**
     * @type {BluetoothLEPreferredConnectionParameters} 
     */
    PowerOptimized {
        get => this.get_PowerOptimized()
    }

    /**
     * 
     * @returns {BluetoothLEPreferredConnectionParameters} 
     */
    get_Balanced() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEPreferredConnectionParameters(value)
    }

    /**
     * 
     * @returns {BluetoothLEPreferredConnectionParameters} 
     */
    get_ThroughputOptimized() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEPreferredConnectionParameters(value)
    }

    /**
     * 
     * @returns {BluetoothLEPreferredConnectionParameters} 
     */
    get_PowerOptimized() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEPreferredConnectionParameters(value)
    }
}
