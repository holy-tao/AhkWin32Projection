#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class WINWATCHNOTIFYPROC extends IUnknown {

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
     * @param {HWINWATCH} hww 
     * @param {HWND} hwnd_ 
     * @param {Integer} code 
     * @param {LPARAM} lParam_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hww, hwnd_, code, lParam_) {
        hww := hww is Win32Handle ? NumGet(hww, "ptr") : hww
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        ComCall(3, this, "ptr", hww, "ptr", hwnd_, "uint", code, "ptr", lParam_)
    }
}
