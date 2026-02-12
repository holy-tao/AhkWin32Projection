#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IInclinometerReadingYawAccuracy extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInclinometerReadingYawAccuracy
     * @type {Guid}
     */
    static IID => Guid("{b453e880-1fe3-4986-a257-e6ece2723949}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_YawAccuracy"]

    /**
     * @type {Integer} 
     */
    YawAccuracy {
        get => this.get_YawAccuracy()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_YawAccuracy() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
