#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\FlightStickReading.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class IFlightStick extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFlightStick
     * @type {Guid}
     */
    static IID => Guid("{b4a2c01c-b83b-4459-a1a9-97b03c33da7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HatSwitchKind", "GetButtonLabel", "GetCurrentReading"]

    /**
     * @type {Integer} 
     */
    HatSwitchKind {
        get => this.get_HatSwitchKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HatSwitchKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} button_ 
     * @returns {Integer} 
     */
    GetButtonLabel(button_) {
        result := ComCall(7, this, "uint", button_, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {FlightStickReading} 
     */
    GetCurrentReading() {
        value := FlightStickReading()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
