#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables access to DataTransferManager methods in a Windows Store app that manages multiple windows.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-idatatransfermanagerinterop
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDataTransferManagerInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataTransferManagerInterop
     * @type {Guid}
     */
    static IID => Guid("{3a3dcd6c-3eab-43dc-bcde-45671ce800c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForWindow", "ShowShareUIForWindow"]

    /**
     * Gets the DataTransferManager instance for the specified window.
     * @param {HWND} appWindow The window whose <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datatransfermanager">DataTransferManager</a> instance is to be retrieved.
     * @param {Pointer<Guid>} riid The requested interface ID of the <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datatransfermanager">DataTransferManager</a> instance.
     * @returns {Pointer<Void>} Receives the <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datatransfermanager">DataTransferManager</a> instance.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idatatransfermanagerinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(3, this, "ptr", appWindow, "ptr", riid, "ptr*", &dataTransferManager := 0, "HRESULT")
        return dataTransferManager
    }

    /**
     * Displays the UI for sharing content for the specified window.
     * @param {HWND} appWindow The window to show the share UI for.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idatatransfermanagerinterop-showshareuiforwindow
     */
    ShowShareUIForWindow(appWindow) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(4, this, "ptr", appWindow, "HRESULT")
        return result
    }
}
