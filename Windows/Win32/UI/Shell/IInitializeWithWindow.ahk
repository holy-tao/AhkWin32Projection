#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method through which a client can provide an owner window to a Windows Runtime object used in a desktop application.
 * @remarks
 * Implement this interface if your object needs to be provided with an owner window, generally to display UI. Most third-party applications will not need to implement this interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-iinitializewithwindow
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IInitializeWithWindow extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInitializeWithWindow
     * @type {Guid}
     */
    static IID => Guid("{3e68d4bd-7135-4d10-8018-9fb6d9f33fa1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Specifies an owner window to be used by a Windows Runtime object that is used in a desktop app.
     * @param {HWND} hwnd_ The handle of the window to be used as the owner window.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-iinitializewithwindow-initialize
     */
    Initialize(hwnd_) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(3, this, "ptr", hwnd_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
