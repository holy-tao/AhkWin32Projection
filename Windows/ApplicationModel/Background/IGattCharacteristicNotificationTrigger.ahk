#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Devices\Bluetooth\GenericAttributeProfile\GattCharacteristic.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IGattCharacteristicNotificationTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattCharacteristicNotificationTrigger
     * @type {Guid}
     */
    static IID => Guid("{e25f8fc8-0696-474f-a732-f292b0cebc5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Characteristic"]

    /**
     * @type {GattCharacteristic} 
     */
    Characteristic {
        get => this.get_Characteristic()
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
}
