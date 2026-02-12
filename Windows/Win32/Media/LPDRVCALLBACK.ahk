#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media
 * @version v4.0.30319
 */
class LPDRVCALLBACK extends IUnknown {

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
     * @param {HDRVR} hdrvr_ 
     * @param {Integer} uMsg 
     * @param {Pointer} dwUser 
     * @param {Pointer} dw1 
     * @param {Pointer} dw2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hdrvr_, uMsg, dwUser, dw1, dw2) {
        hdrvr_ := hdrvr_ is Win32Handle ? NumGet(hdrvr_, "ptr") : hdrvr_

        ComCall(3, this, "ptr", hdrvr_, "uint", uMsg, "ptr", dwUser, "ptr", dw1, "ptr", dw2)
    }
}
