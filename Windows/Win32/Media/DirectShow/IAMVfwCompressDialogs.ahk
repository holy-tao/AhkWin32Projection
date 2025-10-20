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
     * 
     * @param {Integer} iDialog 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    ShowDialog(iDialog, hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "int", iDialog, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pState 
     * @param {Pointer<Int32>} pcbState 
     * @returns {HRESULT} 
     */
    GetState(pState, pcbState) {
        result := ComCall(4, this, "ptr", pState, "int*", pcbState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pState 
     * @param {Integer} cbState 
     * @returns {HRESULT} 
     */
    SetState(pState, cbState) {
        result := ComCall(5, this, "ptr", pState, "int", cbState, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(6, this, "int", uMsg, "int", dw1, "int", dw2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
