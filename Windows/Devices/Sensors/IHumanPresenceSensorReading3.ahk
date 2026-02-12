#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\DetectedPerson.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHumanPresenceSensorReading3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHumanPresenceSensorReading3
     * @type {Guid}
     */
    static IID => Guid("{b876d918-f069-586f-90e3-7c6fa5c5d33a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OnlookerPresence", "get_DetectedPersons"]

    /**
     * @type {Integer} 
     */
    OnlookerPresence {
        get => this.get_OnlookerPresence()
    }

    /**
     * @type {IVectorView<DetectedPerson>} 
     */
    DetectedPersons {
        get => this.get_DetectedPersons()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OnlookerPresence() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<DetectedPerson>} 
     */
    get_DetectedPersons() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(DetectedPerson, value)
    }
}
