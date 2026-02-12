#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\GenericAttributeProfile\GattCharacteristic.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class IGattCharacteristicNotificationTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattCharacteristicNotificationTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{9ba03b18-0fec-436a-93b1-f46c697532a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Characteristic", "get_Value"]

    /**
     * @type {GattCharacteristic} 
     */
    Characteristic {
        get => this.get_Characteristic()
    }

    /**
     * @type {IBuffer} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * 
     * @returns {GattCharacteristic} 
     */
    get_Characteristic() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GattCharacteristic(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Value() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
