#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HumanPresenceSensorReading.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHumanPresenceSensorReadingChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHumanPresenceSensorReadingChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{a9dc4583-fd69-5c5e-ab1f-942204eae2db}")

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
     * @type {HumanPresenceSensorReading} 
     */
    Reading {
        get => this.get_Reading()
    }

    /**
     * 
     * @returns {HumanPresenceSensorReading} 
     */
    get_Reading() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HumanPresenceSensorReading(value)
    }
}
