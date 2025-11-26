#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a dialog box for selecting the device to acquire images from.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nn-photoacquire-iphotoacquiredeviceselectiondialog
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IPhotoAcquireDeviceSelectionDialog extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoAcquireDeviceSelectionDialog
     * @type {Guid}
     */
    static IID => Guid("{00f28837-55dd-4f37-aaf5-6855a9640467}")

    /**
     * The class identifier for PhotoAcquireDeviceSelectionDialog
     * @type {Guid}
     */
    static CLSID => Guid("{00f29a34-b8a1-482c-bcf8-3ac7b0fe8f62}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTitle", "SetSubmitButtonText", "DoModal"]

    /**
     * The SetTitle method sets the title of the device selection dialog box.
     * @param {PWSTR} pszTitle Pointer to a null-terminated string containing the title.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiredeviceselectiondialog-settitle
     */
    SetTitle(pszTitle) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(3, this, "ptr", pszTitle, "HRESULT")
        return result
    }

    /**
     * The SetPrompt method sets the text displayed in the dialog box that prompts the user to select a device.
     * @param {PWSTR} pszSubmitButtonText Pointer to a null-terminated string containing the prompt.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiredeviceselectiondialog-setsubmitbuttontext
     */
    SetSubmitButtonText(pszSubmitButtonText) {
        pszSubmitButtonText := pszSubmitButtonText is String ? StrPtr(pszSubmitButtonText) : pszSubmitButtonText

        result := ComCall(4, this, "ptr", pszSubmitButtonText, "HRESULT")
        return result
    }

    /**
     * The DoModal method displays a device selection dialog box. The function returns when the user selects a device using the modal dialog box.
     * @param {HWND} hWndParent Handle to a parent window.
     * @param {Integer} dwDeviceFlags Double word value containing a combination of device flags that indicate which type of devices to display. The device flags may be a combination of any of the following:
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td><b>DSF_WPD_DEVICES</b></td>
     * <td>Show devices of type Windows Portable Devices (WPD).</td>
     * </tr>
     * <tr>
     * <td><b>DSF_WIA_CAMERAS</b></td>
     * <td>Show cameras of type Windows Image Acquisition (WIA).</td>
     * </tr>
     * <tr>
     * <td><b>DSF_WIA_SCANNERS</b></td>
     * <td>Show scanners of type Windows Image Acquisition (WIA).</td>
     * </tr>
     * <tr>
     * <td><b>DSF_STI_DEVICES</b></td>
     * <td>Show devices of type Still Image Architecture (STI).</td>
     * </tr>
     * <tr>
     * <td><b>DSF_FS_DEVICES</b></td>
     * <td>Show removable storage devices, such as CD drives or card readers.</td>
     * </tr>
     * <tr>
     * <td><b>DSF_DV_DEVICES</b></td>
     * <td>Show digital video camera devices.</td>
     * </tr>
     * <tr>
     * <td><b>DSF_ALL_DEVICES</b></td>
     * <td>Show all devices.</td>
     * </tr>
     * <tr>
     * <td><b>DSF_SHOW_OFFLINE</b></td>
     * <td>Show devices that are offline. Not supported by all device types.</td>
     * </tr>
     * </table>
     * @param {Pointer<BSTR>} pbstrDeviceId Pointer to a string containing the ID of the selected device.
     * @param {Pointer<Integer>} pnDeviceType Pointer to the <a href="https://docs.microsoft.com/windows/win32/api/photoacquire/ne-photoacquire-device_selection_device_type">DEVICE_SELECTION_DEVICE_TYPE</a> of the selected device.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiredeviceselectiondialog-domodal
     */
    DoModal(hWndParent, dwDeviceFlags, pbstrDeviceId, pnDeviceType) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        pnDeviceTypeMarshal := pnDeviceType is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", hWndParent, "uint", dwDeviceFlags, "ptr", pbstrDeviceId, pnDeviceTypeMarshal, pnDeviceType, "HRESULT")
        return result
    }
}
