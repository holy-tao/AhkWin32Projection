#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Enables access to PlayToManager methods in a Windows Store app that manages multiple windows.
 * @see https://learn.microsoft.com/windows/win32/api//content/playtomanagerinterop/nn-playtomanagerinterop-iplaytomanagerinterop
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IPlayToManagerInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayToManagerInterop
     * @type {Guid}
     */
    static IID => Guid("{24394699-1f2c-4eb3-8cd7-0ec1da42a540}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForWindow", "ShowPlayToUIForWindow"]

    /**
     * Gets the PlayToManager instance for the specified window.
     * @remarks
     * You can use the <b>GetForWindow</b> method to get the <a href="https://docs.microsoft.com/uwp/api/windows.media.playto.playtomanager">PlayToManager</a> for the specified window. The <b>GetForWindow</b> method is equivalent to the <a href="https://docs.microsoft.com/uwp/api/windows.graphics.printing.printmanager.getforcurrentview">GetForCurrentView</a> method, except that you supply a reference to a window from a multi-window Windows Store app.
     * @param {HWND} appWindow The window to get the <a href="https://docs.microsoft.com/uwp/api/windows.media.playto.playtomanager">PlayToManager</a> instance for.
     * @param {Pointer<Guid>} riid The reference ID of the specified window.
     * @returns {Pointer<Pointer<Void>>} The <a href="https://docs.microsoft.com/uwp/api/windows.media.playto.playtomanager">PlayToManager</a> instance for the specified window.
     * @see https://learn.microsoft.com/windows/win32/api//content/playtomanagerinterop/nf-playtomanagerinterop-iplaytomanagerinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(6, this, "ptr", appWindow, "ptr", riid, "ptr*", &playToManager := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return playToManager
    }

    /**
     * Displays the Play To UI for the specified window.
     * @remarks
     * You can use the <b>ShowPlayToUIForWindow</b> method to show the Play To UI for the specified window. The <b>ShowPlayToUIForWindow</b> method is equivalent to the <a href="https://docs.microsoft.com/uwp/api/windows.media.playto.playtomanager.showplaytoui">ShowPlayToUI</a> method, except that you supply a reference to a window from a multi-window Windows Store app.
     * @param {HWND} appWindow The window to show the Play To UI  for.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/playtomanagerinterop/nf-playtomanagerinterop-iplaytomanagerinterop-showplaytouiforwindow
     */
    ShowPlayToUIForWindow(appWindow) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(7, this, "ptr", appWindow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
