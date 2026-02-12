#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IWindowForBindingUI extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowForBindingUI
     * @type {Guid}
     */
    static IID => Guid("{79eac9d5-bafa-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWindow"]

    /**
     * Retrieves a handle to a window that has the specified relationship (Z-Order or owner) to the specified window.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumchildwindows">EnumChildWindows</a> function is more reliable than calling <b>GetWindow</b> in a loop. An application that calls <b>GetWindow</b> to perform this task risks being caught in an infinite loop or referencing a handle to a window that has been destroyed.
     * @param {Pointer<Guid>} rguidReason 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getwindow
     */
    GetWindow(rguidReason) {
        phwnd := HWND()
        result := ComCall(3, this, "ptr", rguidReason, "ptr", phwnd, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phwnd
    }
}
