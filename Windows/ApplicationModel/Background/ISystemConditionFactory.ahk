#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SystemCondition.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ISystemConditionFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemConditionFactory
     * @type {Guid}
     */
    static IID => Guid("{d269d1f1-05a7-49ae-87d7-16b2b8b9a553}")

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
     * @param {Integer} conditionType_ 
     * @returns {SystemCondition} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(conditionType_) {
        result := ComCall(6, this, "int", conditionType_, "ptr*", &condition := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemCondition(condition)
    }
}
