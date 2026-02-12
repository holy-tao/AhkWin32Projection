#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors.Custom
 * @version WindowsRuntime 1.4
 */
class ICustomSensorReading2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICustomSensorReading2
     * @type {Guid}
     */
    static IID => Guid("{223c98ea-bf73-4992-9a48-d3c897594ccb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PerformanceCount"]

    /**
     * @type {IReference<TimeSpan>} 
     */
    PerformanceCount {
        get => this.get_PerformanceCount()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_PerformanceCount() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }
}
