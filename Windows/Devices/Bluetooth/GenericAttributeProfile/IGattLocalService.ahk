#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GattLocalCharacteristicResult.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\GattLocalCharacteristic.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattLocalService extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattLocalService
     * @type {Guid}
     */
    static IID => Guid("{f513e258-f7f7-4902-b803-57fcc7d6fe83}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Uuid", "CreateCharacteristicAsync", "get_Characteristics"]

    /**
     * @type {Guid} 
     */
    Uuid {
        get => this.get_Uuid()
    }

    /**
     * @type {IVectorView<GattLocalCharacteristic>} 
     */
    Characteristics {
        get => this.get_Characteristics()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Uuid() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Guid} characteristicUuid 
     * @param {GattLocalCharacteristicParameters} parameters 
     * @returns {IAsyncOperation<GattLocalCharacteristicResult>} 
     */
    CreateCharacteristicAsync(characteristicUuid, parameters) {
        result := ComCall(7, this, "ptr", characteristicUuid, "ptr", parameters, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattLocalCharacteristicResult, operation)
    }

    /**
     * 
     * @returns {IVectorView<GattLocalCharacteristic>} 
     */
    get_Characteristics() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GattLocalCharacteristic, value)
    }
}
