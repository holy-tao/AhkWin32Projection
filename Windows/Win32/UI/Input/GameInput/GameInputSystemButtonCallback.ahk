#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputSystemButtonCallback extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} callbackToken 
     * @param {Pointer<Void>} context_ 
     * @param {IGameInputDevice} device 
     * @param {Integer} timestamp_ 
     * @param {Integer} currentButtons 
     * @param {Integer} previousButtons 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(callbackToken, context_, device, timestamp_, currentButtons, previousButtons) {
        context_Marshal := context_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "uint", callbackToken, context_Marshal, context_, "ptr", device, "uint", timestamp_, "int", currentButtons, "int", previousButtons)
    }
}
