#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media
 * @version v4.0.30319
 */
class LPTIMECALLBACK extends IUnknown {

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
     * @param {Integer} uTimerID 
     * @param {Integer} uMsg 
     * @param {Pointer} dwUser 
     * @param {Pointer} dw1 
     * @param {Pointer} dw2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(uTimerID, uMsg, dwUser, dw1, dw2) {
        ComCall(3, this, "uint", uTimerID, "uint", uMsg, "ptr", dwUser, "ptr", dw1, "ptr", dw2)
    }
}
