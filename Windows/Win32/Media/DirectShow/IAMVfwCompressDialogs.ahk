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
     * The ShowDialog method displays the specified dialog box.
     * @param {Integer} iDialog Dialog box to display. This is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vfwcompressdialogs">VfwCompressDialogs</a> enumeration.
     * @param {HWND} hwnd Handle of the dialog box's parent window.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvfwcompressdialogs-showdialog
     */
    ShowDialog(iDialog, hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "int", iDialog, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * The GetState method retrieves the current configuration settings for the VCM codec currently being used.
     * @param {Pointer} pState State of the VCM codec.
     * @param {Pointer<Integer>} pcbState Pointer to the size of the state.
     * @returns {HRESULT} Return value varies depending on the implementation within each driver.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvfwcompressdialogs-getstate
     */
    GetState(pState, pcbState) {
        pcbStateMarshal := pcbState is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pState, pcbStateMarshal, pcbState, "HRESULT")
        return result
    }

    /**
     * The SetState method sets configuration for the VCM codec.
     * @param {Pointer} pState State of the VCM codec.
     * @param {Integer} cbState Size of the state.
     * @returns {HRESULT} Return value varies depending on the implementation within each driver.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvfwcompressdialogs-setstate
     */
    SetState(pState, cbState) {
        result := ComCall(5, this, "ptr", pState, "int", cbState, "HRESULT")
        return result
    }

    /**
     * The SendDriverMessage method sends a driver-specific message.
     * @param {Integer} uMsg Message to send to the driver.
     * @param {Integer} dw1 Message data.
     * @param {Integer} dw2 Message data.
     * @returns {HRESULT} Return value varies depending on the implementation within each driver.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvfwcompressdialogs-senddrivermessage
     */
    SendDriverMessage(uMsg, dw1, dw2) {
        result := ComCall(6, this, "int", uMsg, "int", dw1, "int", dw2, "HRESULT")
        return result
    }
}
