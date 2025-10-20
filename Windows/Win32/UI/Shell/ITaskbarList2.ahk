#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITaskbarList.ahk

/**
 * Extends the ITaskbarList interface by exposing a method to mark a window as a full-screen display.
 * @remarks
 * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itaskbarlist">ITaskbarList</a> interface, from which it inherits.
  * 
  * The Shell also automatically attempts to detect full-screen applications, but it is not as reliable as using the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist2-markfullscreenwindow">ITaskbarList2::MarkFullscreenWindow</a> method.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-itaskbarlist2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITaskbarList2 extends ITaskbarList{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITaskbarList2
     * @type {Guid}
     */
    static IID => Guid("{602d4995-b13a-429b-a66e-1935e44f4317}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MarkFullscreenWindow"]

    /**
     * 
     * @param {HWND} hwnd 
     * @param {BOOL} fFullscreen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist2-markfullscreenwindow
     */
    MarkFullscreenWindow(hwnd, fFullscreen) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(8, this, "ptr", hwnd, "int", fFullscreen, "HRESULT")
        return result
    }
}
