#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GattLocalCharacteristic.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattLocalCharacteristicResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattLocalCharacteristicResult
     * @type {Guid}
     */
    static IID => Guid("{7975de9b-0170-4397-9666-92f863f12ee6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Characteristic", "get_Error"]

    /**
     * @type {GattLocalCharacteristic} 
     */
    Characteristic {
        get => this.get_Characteristic()
    }

    /**
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * 
     * @returns {GattLocalCharacteristic} 
     */
    get_Characteristic() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GattLocalCharacteristic(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Error() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
