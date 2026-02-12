#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ProximitySensorDataThreshold.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IProximitySensorDataThresholdFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProximitySensorDataThresholdFactory
     * @type {Guid}
     */
    static IID => Guid("{905ac121-6d27-4ad3-9db5-6467f2a5ad9d}")

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
     * @param {ProximitySensor} sensor_ 
     * @returns {ProximitySensorDataThreshold} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(sensor_) {
        result := ComCall(6, this, "ptr", sensor_, "ptr*", &threshold := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProximitySensorDataThreshold(threshold)
    }
}
