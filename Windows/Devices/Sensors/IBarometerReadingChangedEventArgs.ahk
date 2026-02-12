#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BarometerReading.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IBarometerReadingChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarometerReadingChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{3d84945f-037b-404f-9bbb-6232d69543c3}")

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
     * @type {BarometerReading} 
     */
    Reading {
        get => this.get_Reading()
    }

    /**
     * 
     * @returns {BarometerReading} 
     */
    get_Reading() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BarometerReading(value)
    }
}
