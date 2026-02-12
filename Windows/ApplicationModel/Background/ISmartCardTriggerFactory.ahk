#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SmartCardTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ISmartCardTriggerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardTriggerFactory
     * @type {Guid}
     */
    static IID => Guid("{63bf54c3-89c1-4e00-a9d3-97c629269dad}")

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
     * @returns {SmartCardTrigger} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(triggerType) {
        result := ComCall(6, this, "int", triggerType, "ptr*", &trigger := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmartCardTrigger(trigger)
    }
}
