#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMVfwCaptureDialogs interface displays a dialog box provided by a Video for Windows (VFW) capture driver.The VFW Capture filter implements this interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamvfwcapturedialogs
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMVfwCaptureDialogs extends IUnknown {
    /**
     * The interface identifier for IAMVfwCaptureDialogs
     * @type {Guid}
     */
    static IID := Guid("{d8d715a0-6e5e-11d0-b3f0-00aa003761c5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMVfwCaptureDialogs interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HasDialog         : IntPtr
        ShowDialog        : IntPtr
        SendDriverMessage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMVfwCaptureDialogs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The HasDialog method determines if the specified dialog box exists in the driver.
     * @remarks
     * This method calls the Video for Windows <b>videoDialog</b> function to query for the existence of the appropriate dialog box.
     * @param {Integer} iDialog Desired dialog box. This is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vfwcapturedialogs">VfwCaptureDialogs</a> enumeration.
     * @returns {HRESULT} Returns S_OK if the driver contains the dialog box or S_FALSE otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvfwcapturedialogs-hasdialog
     */
    HasDialog(iDialog) {
        result := ComCall(3, this, "int", iDialog, "HRESULT")
        return result
    }

    /**
     * The ShowDialog method displays the specified VFW dialog box.
     * @remarks
     * Stop the filter graph before calling this method. Otherwise, the method fails and returns VFW_E_NOT_STOPPED.
     * 
     * The Video Format dialog (VfwCaptureDialog_Format) may change the video format. If so, the method tries to reconnect the capture filter. If the downstream filter rejects the new format, the method returns VFW_E_CANNOT_CONNECT.
     * @param {Integer} iDialog Dialog box to display. This is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vfwcapturedialogs">VfwCaptureDialogs</a> enumeration.
     * @param {HWND} _hwnd Handle of the dialog box's parent window.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvfwcapturedialogs-showdialog
     */
    ShowDialog(iDialog, _hwnd) {
        result := ComCall(4, this, "int", iDialog, HWND, _hwnd, "HRESULT")
        return result
    }

    /**
     * The SendDriverMessage method sends a driver-specific message. (IAMVfwCaptureDialogs.SendDriverMessage)
     * @remarks
     * You should never need to use this method. This method can send any private message to the capture driver. Behavior might be undetermined in response to arbitrary messages; use this method at your own risk.
     * 
     * This method calls the Video for Windows <b>videoMessage</b> function to send the driver message.
     * @param {Integer} iDialog Handle of the driver dialog box. This is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vfwcapturedialogs">VfwCaptureDialogs</a> enumeration.
     * @param {Integer} uMsg Message to send to the driver.
     * @param {Integer} dw1 Message data.
     * @param {Integer} dw2 Message data.
     * @returns {HRESULT} Return value varies depending on the implementation within each driver.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamvfwcapturedialogs-senddrivermessage
     */
    SendDriverMessage(iDialog, uMsg, dw1, dw2) {
        result := ComCall(5, this, "int", iDialog, "int", uMsg, "int", dw1, "int", dw2, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMVfwCaptureDialogs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HasDialog := CallbackCreate(GetMethod(implObj, "HasDialog"), flags, 2)
        this.vtbl.ShowDialog := CallbackCreate(GetMethod(implObj, "ShowDialog"), flags, 3)
        this.vtbl.SendDriverMessage := CallbackCreate(GetMethod(implObj, "SendDriverMessage"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HasDialog)
        CallbackFree(this.vtbl.ShowDialog)
        CallbackFree(this.vtbl.SendDriverMessage)
    }
}
