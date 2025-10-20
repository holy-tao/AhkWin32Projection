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
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} dataTransferManager 
     * @returns {HRESULT} 
     */
    GetForWindow(appWindow, riid, dataTransferManager) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(3, this, "ptr", appWindow, "ptr", riid, "ptr", dataTransferManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @returns {HRESULT} 
     */
    ShowShareUIForWindow(appWindow) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(4, this, "ptr", appWindow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
