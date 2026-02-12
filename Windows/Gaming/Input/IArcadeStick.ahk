#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ArcadeStickReading.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class IArcadeStick extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IArcadeStick
     * @type {Guid}
     */
    static IID => Guid("{b14a539d-befb-4c81-8051-15ecf3b13036}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetButtonLabel", "GetCurrentReading"]

    /**
     * 
     * @param {Integer} button_ 
     * @returns {Integer} 
     */
    GetButtonLabel(button_) {
        result := ComCall(6, this, "uint", button_, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ArcadeStickReading} 
     */
    GetCurrentReading() {
        value := ArcadeStickReading()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
