#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PerceptionCorrelation.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class IPerceptionCorrelationFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionCorrelationFactory
     * @type {Guid}
     */
    static IID => Guid("{d4a6c425-2884-4a8f-8134-2835d7286cbf}")

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
     * @param {HSTRING} targetId 
     * @param {Vector3} position 
     * @param {Quaternion} orientation_ 
     * @returns {PerceptionCorrelation} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(targetId, position, orientation_) {
        if(targetId is String) {
            pin := HSTRING.Create(targetId)
            targetId := pin.Value
        }
        targetId := targetId is Win32Handle ? NumGet(targetId, "ptr") : targetId

        result := ComCall(6, this, "ptr", targetId, "ptr", position, "ptr", orientation_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionCorrelation(result_)
    }
}
