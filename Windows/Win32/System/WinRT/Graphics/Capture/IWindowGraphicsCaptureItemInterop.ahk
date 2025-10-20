#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Graphics.Capture
 * @version v4.0.30319
 */
class IWindowGraphicsCaptureItemInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowGraphicsCaptureItemInterop
     * @type {Guid}
     */
    static IID => Guid("{38e4c48b-94e6-4c44-9cfa-968193316c0c}")

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
     * @param {Pointer<HWND>} window 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is a window handle. If no window exists with the specified relationship to the specified window, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getwindow
     */
    GetWindow(window) {
        result := ComCall(3, this, "ptr", window, "HRESULT")
        return result
    }
}
