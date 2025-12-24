#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMVfwCaptureDialogs interface displays a dialog box provided by a Video for Windows (VFW) capture driver.The VFW Capture filter implements this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamvfwcapturedialogs
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMVfwCaptureDialogs extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMVfwCaptureDialogs
     * @type {Guid}
     */
    static IID => Guid("{d8d715a0-6e5e-11d0-b3f0-00aa003761c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HasDialog", "ShowDialog", "SendDriverMessage"]

    /**
     * The HasDialog method determines if the specified dialog box exists in the driver.
     * @param {Integer} iDialog Desired dialog box. This is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vfwcapturedialogs">VfwCaptureDialogs</a> enumeration.
     * @returns {HRESULT} Returns S_OK if the driver contains the dialog box or S_FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvfwcapturedialogs-hasdialog
     */
    HasDialog(iDialog) {
        result := ComCall(3, this, "int", iDialog, "HRESULT")
        return result
    }

    /**
     * The ShowDialog method displays the specified VFW dialog box.
     * @param {Integer} iDialog Dialog box to display. This is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vfwcapturedialogs">VfwCaptureDialogs</a> enumeration.
     * @param {HWND} hwnd Handle of the dialog box's parent window.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_CANNOT_CONNECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not reconnect with the new format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_STOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter graph is not stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvfwcapturedialogs-showdialog
     */
    ShowDialog(iDialog, hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(4, this, "int", iDialog, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * The SendDriverMessage method sends a driver-specific message.
     * @param {Integer} iDialog Handle of the driver dialog box. This is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vfwcapturedialogs">VfwCaptureDialogs</a> enumeration.
     * @param {Integer} uMsg Message to send to the driver.
     * @param {Integer} dw1 Message data.
     * @param {Integer} dw2 Message data.
     * @returns {HRESULT} Return value varies depending on the implementation within each driver.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamvfwcapturedialogs-senddrivermessage
     */
    SendDriverMessage(iDialog, uMsg, dw1, dw2) {
        result := ComCall(5, this, "int", iDialog, "int", uMsg, "int", dw1, "int", dw2, "HRESULT")
        return result
    }
}
