#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GattCharacteristicNotificationTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IGattCharacteristicNotificationTriggerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattCharacteristicNotificationTriggerFactory
     * @type {Guid}
     */
    static IID => Guid("{57ba1995-b143-4575-9f6b-fd59d93ace1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {GattCharacteristic} characteristic 
     * @returns {GattCharacteristicNotificationTrigger} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(characteristic) {
        result := ComCall(6, this, "ptr", characteristic, "ptr*", &gattCharacteristicNotificationTrigger_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GattCharacteristicNotificationTrigger(gattCharacteristicNotificationTrigger_)
    }
}
