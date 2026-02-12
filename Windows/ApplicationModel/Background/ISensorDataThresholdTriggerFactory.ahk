#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SensorDataThresholdTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ISensorDataThresholdTriggerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISensorDataThresholdTriggerFactory
     * @type {Guid}
     */
    static IID => Guid("{921fe675-7df0-4da3-97b3-e544ee857fe6}")

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
     * @param {ISensorDataThreshold} threshold 
     * @returns {SensorDataThresholdTrigger} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(threshold) {
        result := ComCall(6, this, "ptr", threshold, "ptr*", &trigger := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SensorDataThresholdTrigger(trigger)
    }
}
