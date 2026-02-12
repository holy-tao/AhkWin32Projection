#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ProximitySensorReading.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IProximitySensorStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProximitySensorStatics2
     * @type {Guid}
     */
    static IID => Guid("{cbf473ae-e9ca-422f-ad67-4c3d25df350c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetReadingsFromTriggerDetails"]

    /**
     * 
     * @param {SensorDataThresholdTriggerDetails} triggerDetails 
     * @returns {IVectorView<ProximitySensorReading>} 
     */
    GetReadingsFromTriggerDetails(triggerDetails) {
        result := ComCall(6, this, "ptr", triggerDetails, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ProximitySensorReading, result_)
    }
}
