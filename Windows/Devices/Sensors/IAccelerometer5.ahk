#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AccelerometerDataThreshold.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IAccelerometer5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccelerometer5
     * @type {Guid}
     */
    static IID => Guid("{7e7e7021-def4-53a6-af43-806fd538edf6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ReportThreshold"]

    /**
     * @type {AccelerometerDataThreshold} 
     */
    ReportThreshold {
        get => this.get_ReportThreshold()
    }

    /**
     * 
     * @returns {AccelerometerDataThreshold} 
     */
    get_ReportThreshold() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AccelerometerDataThreshold(value)
    }
}
