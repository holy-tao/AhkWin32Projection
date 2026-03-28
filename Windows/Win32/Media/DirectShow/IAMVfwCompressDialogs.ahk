#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMVfwCompressDialogs interface displays a dialog box provided by a Video for Windows (VFW) codec.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamvfwcompressdialogs
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
     * @remarks
     * This method returns an error when asked to display a dialog box while the driver is streaming or displaying another dialog box. While the driver displays the dialog box you can't stream (pause or run) the filter.
     * 
     * <c>IAMVfwCompressDialogs::ShowDialog</c> calls the Video for Windows video compression manager (VCM) functions <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icconfigure">ICConfigure</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icabout">ICAbout</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icqueryconfigure">ICQueryConfigure</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icqueryabout">ICQueryAbout</a> to display the appropriate dialog box or determine if one exists.
     *       
     * 
     * The VfwCompressDialog_QueryConfig and VfwCompressDialog_QueryAbout members of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vfwcompressdialogs">VfwCompressDialogs</a> enumeration tell you whether or not the configure dialog or about dialog is available. If passed one of these flags, the filter will return S_OK if the dialog exists, and S_FALSE if it does not. If a dialog is available, you call <c>ShowDialog</c> with the value VfwCompressDialog_Config or VfwCompressDialog_About to bring up the dialog.
     * @param {Integer} iDialog Dialog box to display. This is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vfwcompressdialogs">VfwCompressDialogs</a> enumeration.
     * @param {HWND} _hwnd 
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvfwcompressdialogs-showdialog
     */
    ShowDialog(iDialog, _hwnd) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        result := ComCall(3, this, "int", iDialog, "ptr", _hwnd, "HRESULT")
        return result
    }

    /**
     * The GetState method retrieves the current configuration settings for the VCM codec currently being used.
     * @remarks
     * This method calls the  <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icgetstate">ICGetState</a> macro.
     * @param {Pointer} pState State of the VCM codec.
     * @param {Pointer<Integer>} pcbState Pointer to the size of the state.
     * @returns {HRESULT} Return value varies depending on the implementation within each driver.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvfwcompressdialogs-getstate
     */
    GetState(pState, pcbState) {
        pcbStateMarshal := pcbState is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pState, pcbStateMarshal, pcbState, "HRESULT")
        return result
    }

    /**
     * The SetState method sets configuration for the VCM codec.
     * @remarks
     * This method calls the <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icsetstate">ICSetState</a> macro, which notifies a video compression driver to set the state of the compressor.
     * @param {Pointer} pState State of the VCM codec.
     * @param {Integer} cbState Size of the state.
     * @returns {HRESULT} Return value varies depending on the implementation within each driver.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvfwcompressdialogs-setstate
     */
    SetState(pState, cbState) {
        result := ComCall(5, this, "ptr", pState, "int", cbState, "HRESULT")
        return result
    }

    /**
     * The SendDriverMessage method sends a driver-specific message. (IAMVfwCompressDialogs.SendDriverMessage)
     * @remarks
     * You should never need to use this method. This method can send any private message to the video compressor (codec). Behavior might be undetermined in response to arbitrary messages; use this method at your own risk.
     * 
     * This method calls the Video for Windows video compression manager (VCM) <a href="https://docs.microsoft.com/windows/desktop/api/vfw/nf-vfw-icsendmessage">ICSendMessage</a> function to send the message.
     * @param {Integer} uMsg Message to send to the driver.
     * @param {Integer} dw1 Message data.
     * @param {Integer} dw2 Message data.
     * @returns {HRESULT} Return value varies depending on the implementation within each driver.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvfwcompressdialogs-senddrivermessage
     */
    SendDriverMessage(uMsg, dw1, dw2) {
        result := ComCall(6, this, "int", uMsg, "int", dw1, "int", dw2, "HRESULT")
        return result
    }
}
