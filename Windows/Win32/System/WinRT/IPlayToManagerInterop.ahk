#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Enables access to PlayToManager methods in a Windows Store app that manages multiple windows.
 * @see https://docs.microsoft.com/windows/win32/api//playtomanagerinterop/nn-playtomanagerinterop-iplaytomanagerinterop
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
     * @param {HWND} appWindow The window to get the <a href="https://docs.microsoft.com/uwp/api/windows.media.playto.playtomanager">PlayToManager</a> instance for.
     * @param {Pointer<Guid>} riid The reference ID of the specified window.
     * @returns {Pointer<Void>} The <a href="https://docs.microsoft.com/uwp/api/windows.media.playto.playtomanager">PlayToManager</a> instance for the specified window.
     * @see https://docs.microsoft.com/windows/win32/api//playtomanagerinterop/nf-playtomanagerinterop-iplaytomanagerinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(6, this, "ptr", appWindow, "ptr", riid, "ptr*", &playToManager := 0, "HRESULT")
        return playToManager
    }

    /**
     * Displays the Play To UI for the specified window.
     * @param {HWND} appWindow The window to show the Play To UI  for.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//playtomanagerinterop/nf-playtomanagerinterop-iplaytomanagerinterop-showplaytouiforwindow
     */
    ShowPlayToUIForWindow(appWindow) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(7, this, "ptr", appWindow, "HRESULT")
        return result
    }
}
