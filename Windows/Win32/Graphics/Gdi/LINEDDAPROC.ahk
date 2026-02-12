#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LineDDAProc function is an application-defined callback function used with the LineDDA function.
 * @remarks
 * An application registers a <b>LineDDAProc</b> function by passing its address to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-linedda">LineDDA</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nc-wingdi-lineddaproc
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class LINEDDAPROC extends IUnknown {

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
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {LPARAM} param2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2) {
        param2 := param2 is Win32Handle ? NumGet(param2, "ptr") : param2

        ComCall(3, this, "int", param0, "int", param1, "ptr", param2)
    }
}
