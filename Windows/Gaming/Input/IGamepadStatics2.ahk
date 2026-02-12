#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Gamepad.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class IGamepadStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGamepadStatics2
     * @type {Guid}
     */
    static IID => Guid("{42676dc5-0856-47c4-9213-b395504c3a3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromGameController"]

    /**
     * 
     * @param {IGameController} gameController 
     * @returns {Gamepad} 
     */
    FromGameController(gameController) {
        result := ComCall(6, this, "ptr", gameController, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Gamepad(value)
    }
}
