#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LocationTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ILocationTriggerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILocationTriggerFactory
     * @type {Guid}
     */
    static IID => Guid("{1106bb07-ff69-4e09-aa8b-1384ea475e98}")

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
     * @param {Integer} triggerType 
     * @returns {LocationTrigger} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(triggerType) {
        result := ComCall(6, this, "int", triggerType, "ptr*", &locationTrigger_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LocationTrigger(locationTrigger_)
    }
}
