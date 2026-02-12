#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LightSensorReading.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ILightSensorReadingChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILightSensorReadingChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{a3a2f4cf-258b-420c-b8ab-8edd601ecf50}")

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
     * @type {LightSensorReading} 
     */
    Reading {
        get => this.get_Reading()
    }

    /**
     * 
     * @returns {LightSensorReading} 
     */
    get_Reading() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LightSensorReading(value)
    }
}
