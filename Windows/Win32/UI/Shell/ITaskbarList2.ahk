#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITaskbarList.ahk

/**
 * Extends the ITaskbarList interface by exposing a method to mark a window as a full-screen display.
 * @remarks
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-itaskbarlist">ITaskbarList</a> interface, from which it inherits.
 * 
 * The Shell also automatically attempts to detect full-screen applications, but it is not as reliable as using the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist2-markfullscreenwindow">ITaskbarList2::MarkFullscreenWindow</a> method.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-itaskbarlist2
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
     * Marks a window as full-screen.
     * @remarks
     * Setting the value of <i>fFullscreen</i> to <b>TRUE</b>, the Shell treats this window as a full-screen window, and the taskbar is moved to the bottom of the z-order when this window is active. Setting the value of <i>fFullscreen</i> to <b>FALSE</b> removes the full-screen marking, but <i>does not</i> cause the Shell to treat the window as though it were definitely not full-screen. With a <b>FALSE</b> <i>fFullscreen</i> value, the Shell depends on its automatic detection facility to specify how the window should be treated, possibly still flagging the window as full-screen.
     * 
     * 
     * 
     * **Since Windows 7,** call `SetProp(hwnd, L”NonRudeHWND”, reinterpret_cast<HANDLE>(TRUE))` before showing a window to indicate to the Shell that the window should not be treated as full-screen. This ensures the taskbar does not adjust itself to be below the window in z-order. This is similar to `ITaskbarList2::MarkFullscreenWindow(FALSE)` except the Shell will not fallback to its automatic detection facility and will not treat the window as full-screen.
     * @param {HWND} hwnd_ Type: <b>HWND</b>
     * 
     * The handle of the window to be marked.
     * @param {BOOL} fFullscreen Type: <b>BOOL</b>
     * 
     * A Boolean value marking the desired full-screen status of the window.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-itaskbarlist2-markfullscreenwindow
     */
    MarkFullscreenWindow(hwnd_, fFullscreen) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(8, this, "ptr", hwnd_, "int", fFullscreen, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
