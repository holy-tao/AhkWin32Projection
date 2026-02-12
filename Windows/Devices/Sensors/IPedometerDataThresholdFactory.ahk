#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PedometerDataThreshold.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IPedometerDataThresholdFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPedometerDataThresholdFactory
     * @type {Guid}
     */
    static IID => Guid("{cbad8f50-7a54-466b-9010-77a162fca5d7}")

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
     * @param {Pedometer} sensor_ 
     * @param {Integer} stepGoal 
     * @returns {PedometerDataThreshold} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(sensor_, stepGoal) {
        result := ComCall(6, this, "ptr", sensor_, "int", stepGoal, "ptr*", &threshold := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PedometerDataThreshold(threshold)
    }
}
