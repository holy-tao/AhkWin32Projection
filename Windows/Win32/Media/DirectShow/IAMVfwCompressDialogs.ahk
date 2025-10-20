#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMVfwCompressDialogs interface displays a dialog box provided by a Video for Windows (VFW) codec.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamvfwcompressdialogs
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMVfwCompressDialogs extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMVfwCompressDialogs
     * @type {Guid}
     */
    static IID => Guid("{d8d715a3-6e5e-11d0-b3f0-00aa003761c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowDialog", "GetState", "SetState", "SendDriverMessage"]

    /**
     * 
     * @param {Integer} iDialog 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvfwcompressdialogs-showdialog
     */
    ShowDialog(iDialog, hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "int", iDialog, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pState 
     * @param {Pointer<Integer>} pcbState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvfwcompressdialogs-getstate
     */
    GetState(pState, pcbState) {
        result := ComCall(4, this, "ptr", pState, "int*", pcbState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pState 
     * @param {Integer} cbState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvfwcompressdialogs-setstate
     */
    SetState(pState, cbState) {
        result := ComCall(5, this, "ptr", pState, "int", cbState, "HRESULT")
        return result
    }

    /**
     * Sends the specified message to the installable driver.
     * @param {Integer} uMsg 
     * @param {Integer} dw1 
     * @param {Integer} dw2 
     * @returns {HRESULT} Returns nonzero if successful or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mmiscapi/nf-mmiscapi-senddrivermessage
     */
    SendDriverMessage(uMsg, dw1, dw2) {
        result := ComCall(6, this, "int", uMsg, "int", dw1, "int", dw2, "HRESULT")
        return result
    }
}
