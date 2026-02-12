#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PerceptionControlGroup.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class IPerceptionControlGroupFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionControlGroupFactory
     * @type {Guid}
     */
    static IID => Guid("{2f1af2e0-baf1-453b-bed4-cd9d4619154c}")

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
     * @param {IIterable<HSTRING>} ids 
     * @returns {PerceptionControlGroup} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(ids) {
        result := ComCall(6, this, "ptr", ids, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionControlGroup(result_)
    }
}
