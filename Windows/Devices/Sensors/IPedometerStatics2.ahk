#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\PedometerReading.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IPedometerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPedometerStatics2
     * @type {Guid}
     */
    static IID => Guid("{79f5c6bb-ce0e-4133-b47e-8627ea72f677}")

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
     * @returns {IVectorView<PedometerReading>} 
     */
    GetReadingsFromTriggerDetails(triggerDetails) {
        result := ComCall(6, this, "ptr", triggerDetails, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PedometerReading, result_)
    }
}
