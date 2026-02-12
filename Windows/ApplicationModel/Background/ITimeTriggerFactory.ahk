#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TimeTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ITimeTriggerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimeTriggerFactory
     * @type {Guid}
     */
    static IID => Guid("{38c682fe-9b54-45e6-b2f3-269b87a6f734}")

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
     * @param {Integer} freshnessTime 
     * @param {Boolean} oneShot 
     * @returns {TimeTrigger} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(freshnessTime, oneShot) {
        result := ComCall(6, this, "uint", freshnessTime, "int", oneShot, "ptr*", &trigger := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimeTrigger(trigger)
    }
}
