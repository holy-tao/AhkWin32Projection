#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GattCharacteristicNotificationTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IGattCharacteristicNotificationTriggerFactory2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattCharacteristicNotificationTriggerFactory2
     * @type {Guid}
     */
    static IID => Guid("{5998e91f-8a53-4e9f-a32c-23cd33664cee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithEventTriggeringMode"]

    /**
     * Create Extended Stored Procedures
     * @param {GattCharacteristic} characteristic 
     * @param {Integer} eventTriggeringMode 
     * @returns {GattCharacteristicNotificationTrigger} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    CreateWithEventTriggeringMode(characteristic, eventTriggeringMode) {
        result := ComCall(6, this, "ptr", characteristic, "int", eventTriggeringMode, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GattCharacteristicNotificationTrigger(result_)
    }
}
