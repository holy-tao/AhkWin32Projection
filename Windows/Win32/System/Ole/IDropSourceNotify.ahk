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
     * 
     * @param {HWND} hwndTarget 
     * @returns {HRESULT} 
     */
    DragEnterTarget(hwndTarget) {
        hwndTarget := hwndTarget is Win32Handle ? NumGet(hwndTarget, "ptr") : hwndTarget

        result := ComCall(3, this, "ptr", hwndTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DragLeaveTarget() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
