#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * Enables interoperability with a WinRT [Print3DManager](/uwp/api/windows.graphics.printing3d.print3dmanager) object.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//print3dmanagerinterop/nn-print3dmanagerinterop-iprinting3dmanagerinterop
 * @namespace Windows.Win32.System.WinRT.Printing
 * @version v4.0.30319
 */
class IPrinting3DManagerInterop extends IInspectable{
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
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} printManager 
     * @returns {HRESULT} 
     */
    GetForWindow(appWindow, riid, printManager) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(6, this, "ptr", appWindow, "ptr", riid, "ptr", printManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} appWindow 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} asyncOperation 
     * @returns {HRESULT} 
     */
    ShowPrintUIForWindowAsync(appWindow, riid, asyncOperation) {
        appWindow := appWindow is Win32Handle ? NumGet(appWindow, "ptr") : appWindow

        result := ComCall(7, this, "ptr", appWindow, "ptr", riid, "ptr", asyncOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
