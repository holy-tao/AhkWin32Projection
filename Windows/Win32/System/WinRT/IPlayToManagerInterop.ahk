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
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} playToManager 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/playtomanagerinterop/nf-playtomanagerinterop-iplaytomanagerinterop-getforwindow
     */
    GetForWindow(appWindow, riid, playToManager) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(6, this, "ptr", appWindow, "ptr", riid, "ptr*", playToManager, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/playtomanagerinterop/nf-playtomanagerinterop-iplaytomanagerinterop-showplaytouiforwindow
     */
    ShowPlayToUIForWindow(appWindow) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(7, this, "ptr", appWindow, "HRESULT")
        return result
    }
}
