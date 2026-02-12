#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PerceptionFaceAuthenticationGroup.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class IPerceptionFaceAuthenticationGroupFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionFaceAuthenticationGroupFactory
     * @type {Guid}
     */
    static IID => Guid("{e68a05d4-b60c-40f4-bcb9-f24d46467320}")

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
     * @param {PerceptionStartFaceAuthenticationHandler} startHandler 
     * @param {PerceptionStopFaceAuthenticationHandler} stopHandler 
     * @returns {PerceptionFaceAuthenticationGroup} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(ids, startHandler, stopHandler) {
        result := ComCall(6, this, "ptr", ids, "ptr", startHandler, "ptr", stopHandler, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionFaceAuthenticationGroup(result_)
    }
}
