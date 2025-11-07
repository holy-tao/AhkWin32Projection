#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * Enables access to PrintManager methods in a Windows Store app that manages multiple windows.
 * @see https://docs.microsoft.com/windows/win32/api//printmanagerinterop/nn-printmanagerinterop-iprintmanagerinterop
 * @namespace Windows.Win32.System.WinRT.Printing
 * @version v4.0.30319
 */
class IPrintManagerInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintManagerInterop
     * @type {Guid}
     */
    static IID => Guid("{c5435a42-8d43-4e7b-a68a-ef311e392087}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForWindow", "ShowPrintUIForWindowAsync"]

    /**
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/printmanagerinterop/nf-printmanagerinterop-iprintmanagerinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(6, this, "ptr", appWindow, "ptr", riid, "ptr*", &printManager := 0, "HRESULT")
        return printManager
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/printmanagerinterop/nf-printmanagerinterop-iprintmanagerinterop-showprintuiforwindowasync
     */
    ShowPrintUIForWindowAsync(appWindow, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(7, this, "ptr", appWindow, "ptr", riid, "ptr*", &asyncOperation := 0, "HRESULT")
        return asyncOperation
    }
}
