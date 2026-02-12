#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CustomSystemEventTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ICustomSystemEventTriggerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICustomSystemEventTriggerFactory
     * @type {Guid}
     */
    static IID => Guid("{6bcb16c5-f2dc-41b2-9efd-b96bdcd13ced}")

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
     * @param {HSTRING} triggerId 
     * @param {Integer} recurrence 
     * @returns {CustomSystemEventTrigger} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(triggerId, recurrence) {
        if(triggerId is String) {
            pin := HSTRING.Create(triggerId)
            triggerId := pin.Value
        }
        triggerId := triggerId is Win32Handle ? NumGet(triggerId, "ptr") : triggerId

        result := ComCall(6, this, "ptr", triggerId, "int", recurrence, "ptr*", &trigger := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CustomSystemEventTrigger(trigger)
    }
}
