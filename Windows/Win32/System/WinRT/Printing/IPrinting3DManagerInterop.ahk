#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * Enables interoperability with a WinRT [Print3DManager](/uwp/api/windows.graphics.printing3d.print3dmanager) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/print3dmanagerinterop/nn-print3dmanagerinterop-iprinting3dmanagerinterop
 * @namespace Windows.Win32.System.WinRT.Printing
 * @version v4.0.30319
 */
class IPrinting3DManagerInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DManagerInterop
     * @type {Guid}
     */
    static IID => Guid("{9ca31010-1484-4587-b26b-dddf9f9caecd}")

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
     * Gets an [Print3DManager](/uwp/api/windows.graphics.printing3d.print3dmanager) object for the window of the active application.
     * @param {HWND} appWindow Handle to the window of the active application.
     * @param {Pointer<Guid>} riid The GUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example: 
     * 
     * `__uuidof(Print3DManager)`
     * @returns {Pointer<Pointer<Void>>} Address of a pointer to a [Print3DManager](/uwp/api/windows.graphics.printing3d.print3dmanager) object.
     * @see https://learn.microsoft.com/windows/win32/api//content/print3dmanagerinterop/nf-print3dmanagerinterop-iprinting3dmanagerinterop-getforwindow
     */
    GetForWindow(appWindow, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(6, this, "ptr", appWindow, "ptr", riid, "ptr*", &printManager := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return printManager
    }

    /**
     * Programmatically initiates the 3D printing user interface.
     * @param {HWND} appWindow Handle to the window of the active application.
     * @param {Pointer<Guid>} riid The GUID for the resource interface.
     * 
     * The REFIID, or GUID, of the interface to the resource can be obtained by using the __uuidof() macro. For example: 
     * 
     * `__uuidof(IAsyncAction)`
     * @returns {Pointer<Pointer<Void>>} Address of a pointer to a [IAsyncAction](/uwp/api/Windows.Foundation.IAsyncAction) object that returns void upon completion.
     * @see https://learn.microsoft.com/windows/win32/api//content/print3dmanagerinterop/nf-print3dmanagerinterop-iprinting3dmanagerinterop-showprintuiforwindowasync
     */
    ShowPrintUIForWindowAsync(appWindow, riid) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(7, this, "ptr", appWindow, "ptr", riid, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return asyncOperation
    }
}
