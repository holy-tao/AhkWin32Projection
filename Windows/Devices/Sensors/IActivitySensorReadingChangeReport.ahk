#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ActivitySensorReading.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IActivitySensorReadingChangeReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActivitySensorReadingChangeReport
     * @type {Guid}
     */
    static IID => Guid("{4f3c2915-d93b-47bd-960a-f20fb2f322b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Reading"]

    /**
     * @type {ActivitySensorReading} 
     */
    Reading {
        get => this.get_Reading()
    }

    /**
     * 
     * @returns {ActivitySensorReading} 
     */
    get_Reading() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActivitySensorReading(value)
    }
}
