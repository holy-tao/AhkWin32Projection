#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GamepadVibration.ahk
#Include .\GamepadReading.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class IGamepad extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGamepad
     * @type {Guid}
     */
    static IID => Guid("{bc7bb43c-0a69-3903-9e9d-a50f86a45de5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Vibration", "put_Vibration", "GetCurrentReading"]

    /**
     * @type {GamepadVibration} 
     */
    Vibration {
        get => this.get_Vibration()
        set => this.put_Vibration(value)
    }

    /**
     * 
     * @returns {GamepadVibration} 
     */
    get_Vibration() {
        value := GamepadVibration()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {GamepadVibration} value 
     * @returns {HRESULT} 
     */
    put_Vibration(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {GamepadReading} 
     */
    GetCurrentReading() {
        value := GamepadReading()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
