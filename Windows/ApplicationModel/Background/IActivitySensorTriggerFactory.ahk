#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ActivitySensorTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IActivitySensorTriggerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActivitySensorTriggerFactory
     * @type {Guid}
     */
    static IID => Guid("{a72691c3-3837-44f7-831b-0132cc872bc3}")

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
     * @param {Integer} reportIntervalInMilliseconds 
     * @returns {ActivitySensorTrigger} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(reportIntervalInMilliseconds) {
        result := ComCall(6, this, "uint", reportIntervalInMilliseconds, "ptr*", &activityTrigger := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActivitySensorTrigger(activityTrigger)
    }
}
