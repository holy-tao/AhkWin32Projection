#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IDropSourceNotify interface is implemented on an IDropSource object to receive notifications from OLE when a user drags the mouse into or out of a potential drop target window.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-idropsourcenotify
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IDropSourceNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDropSourceNotify
     * @type {Guid}
     */
    static IID => Guid("{0000012b-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DragEnterTarget", "DragLeaveTarget"]

    /**
     * OLE calls this method when the user drags the mouse cursor into a potential drop target window.
     * @param {HWND} hwndTarget The window handle of the potential drop target window.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-idropsourcenotify-dragentertarget
     */
    DragEnterTarget(hwndTarget) {
        hwndTarget := hwndTarget is Win32Handle ? NumGet(hwndTarget, "ptr") : hwndTarget

        result := ComCall(3, this, "ptr", hwndTarget, "HRESULT")
        return result
    }

    /**
     * OLE calls this method when the user drags the mouse cursor out of a potential drop target window.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-idropsourcenotify-dragleavetarget
     */
    DragLeaveTarget() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
