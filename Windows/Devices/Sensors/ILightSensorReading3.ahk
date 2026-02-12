#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LightSensorChromaticity.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ILightSensorReading3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILightSensorReading3
     * @type {Guid}
     */
    static IID => Guid("{f338ee06-96af-4029-b530-61acc05b7cfe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Chromaticity"]

    /**
     * @type {LightSensorChromaticity} 
     */
    Chromaticity {
        get => this.get_Chromaticity()
    }

    /**
     * 
     * @returns {LightSensorChromaticity} 
     */
    get_Chromaticity() {
        value := LightSensorChromaticity()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
