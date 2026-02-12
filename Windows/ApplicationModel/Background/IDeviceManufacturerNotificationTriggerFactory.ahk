#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DeviceManufacturerNotificationTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IDeviceManufacturerNotificationTriggerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceManufacturerNotificationTriggerFactory
     * @type {Guid}
     */
    static IID => Guid("{7955de75-25bb-4153-a1a2-3029fcabb652}")

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
     * @param {HSTRING} triggerQualifier 
     * @param {Boolean} oneShot 
     * @returns {DeviceManufacturerNotificationTrigger} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(triggerQualifier, oneShot) {
        if(triggerQualifier is String) {
            pin := HSTRING.Create(triggerQualifier)
            triggerQualifier := pin.Value
        }
        triggerQualifier := triggerQualifier is Win32Handle ? NumGet(triggerQualifier, "ptr") : triggerQualifier

        result := ComCall(6, this, "ptr", triggerQualifier, "int", oneShot, "ptr*", &trigger := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceManufacturerNotificationTrigger(trigger)
    }
}
