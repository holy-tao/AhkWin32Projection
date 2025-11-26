#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEnumWIA_DEV_INFO.ahk
#Include .\IWiaItem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the IWiaDevMgr interface to create and manage image acquisition devices.
 * @remarks
 * 
 * The <b>IWiaDevMgr</b> interface, like all Component Object Model (COM) interfaces, inherits the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface methods. 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>IUnknown Methods</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>
 * </td>
 * <td>Returns pointers to supported interfaces.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a>
 * </td>
 * <td>Increments reference count.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>
 * </td>
 * <td>Decrements reference count.</td>
 * </tr>
 * </table>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nn-wia_xp-iwiadevmgr
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaDevMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaDevMgr
     * @type {Guid}
     */
    static IID => Guid("{5eb2502a-8cf1-11d1-bf92-0060081ed811}")

    /**
     * The class identifier for WiaDevMgr
     * @type {Guid}
     */
    static CLSID => Guid("{a1f4e726-8cf1-11d1-bf92-0060081ed811}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumDeviceInfo", "CreateDevice", "SelectDeviceDlg", "SelectDeviceDlgID", "GetImageDlg", "RegisterEventCallbackProgram", "RegisterEventCallbackInterface", "RegisterEventCallbackCLSID", "AddDeviceDlg"]

    /**
     * Applications use the IWiaDevMgr::EnumDeviceInfo method to enumerate property information for each available Windows Image Acquisition (WIA) device.
     * @param {Integer} lFlag Type: <b>LONG</b>
     * 
     * Specifies the types of WIA devices to enumerate. Should be set to WIA_DEVINFO_ENUM_LOCAL.
     * @returns {IEnumWIA_DEV_INFO} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_info">IEnumWIA_DEV_INFO</a>**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_dev_info">IEnumWIA_DEV_INFO</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiadevmgr-enumdeviceinfo
     */
    EnumDeviceInfo(lFlag) {
        result := ComCall(3, this, "int", lFlag, "ptr*", &ppIEnum := 0, "HRESULT")
        return IEnumWIA_DEV_INFO(ppIEnum)
    }

    /**
     * The IWiaDevMgr::CreateDevice creates a hierarchical tree of IWiaItem objects for a Windows Image Acquisition (WIA) device.
     * @param {BSTR} bstrDeviceID Type: <b>BSTR</b>
     * 
     * Specifies the unique identifier of the WIA device.
     * @returns {IWiaItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a>**</b>
     * 
     * Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> interface of the root item in the hierarchical tree for the WIA device.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiadevmgr-createdevice
     */
    CreateDevice(bstrDeviceID) {
        bstrDeviceID := bstrDeviceID is String ? BSTR.Alloc(bstrDeviceID).Value : bstrDeviceID

        result := ComCall(4, this, "ptr", bstrDeviceID, "ptr*", &ppWiaItemRoot := 0, "HRESULT")
        return IWiaItem(ppWiaItemRoot)
    }

    /**
     * The IWiaDevMgr::SelectDeviceDlg displays a dialog box that enables the user to select a hardware device for image acquisition.
     * @param {HWND} hwndParent Type: <b>HWND</b>
     * 
     * Handle of the window that owns the <b>Select Device</b> dialog box.
     * @param {Integer} lDeviceType Type: <b>LONG</b>
     * 
     * Specifies which type of WIA device to use. Can be set to <b>StiDeviceTypeDefault</b>, <b>StiDeviceTypeScanner</b>, or <b>StiDeviceTypeDigitalCamera</b>.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * @param {Pointer<BSTR>} pbstrDeviceID Type: <b>BSTR*</b>
     * 
     * On output, receives a string which contains the device's identifier string. On input, pass the address of a pointer if this information is needed, or <b>NULL</b> if it is not needed.
     * @returns {IWiaItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a>**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> interface of the root item of the tree that represents the selected WIA device. If no devices are found, it contains the value <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiadevmgr-selectdevicedlg
     */
    SelectDeviceDlg(hwndParent, lDeviceType, lFlags, pbstrDeviceID) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(5, this, "ptr", hwndParent, "int", lDeviceType, "int", lFlags, "ptr", pbstrDeviceID, "ptr*", &ppItemRoot := 0, "HRESULT")
        return IWiaItem(ppItemRoot)
    }

    /**
     * The IWiaDevMgr::SelectDeviceDlgID method displays a dialog box that enables the user to select a hardware device for image acquisition.
     * @param {HWND} hwndParent Type: <b>HWND</b>
     * 
     * Handle of the window that owns the <b>Select Device</b> dialog box.
     * @param {Integer} lDeviceType Type: <b>LONG</b>
     * 
     * Specifies which type of WIA device to use. Can be set to <b>StiDeviceTypeDefault</b>, <b>StiDeviceTypeScanner</b>, or <b>StiDeviceTypeDigitalCamera</b>.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * @param {Pointer<BSTR>} pbstrDeviceID Type: <b>BSTR*</b>
     * 
     * Pointer to a string that receives the identifier string of the device.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns the following values:
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Return Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>A device was successfully selected.</td>
     * </tr>
     * <tr>
     * <td>S_FALSE</td>
     * <td>The user canceled the dialog box.</td>
     * </tr>
     * <tr>
     * <td>WIA_S_NO_DEVICE_AVAILABLE</td>
     * <td>There are no WIA hardware devices attached to the user's computer that match the specifications.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiadevmgr-selectdevicedlgid
     */
    SelectDeviceDlgID(hwndParent, lDeviceType, lFlags, pbstrDeviceID) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "int", lDeviceType, "int", lFlags, "ptr", pbstrDeviceID, "HRESULT")
        return result
    }

    /**
     * The IWiaDevMgr::GetImageDlg method displays one or more dialog boxes that enable a user to acquire an image from a Windows Image Acquisition (WIA) device and write the image to a specified file.
     * @param {HWND} hwndParent Type: <b>HWND</b>
     * 
     * Handle of the window that owns the <b>Get Image</b> dialog box.
     * @param {Integer} lDeviceType Type: <b>LONG</b>
     * 
     * Specifies which type of WIA device to use. Is set to <b>StiDeviceTypeDefault</b>, <b>StiDeviceTypeScanner</b>, or <b>StiDeviceTypeDigitalCamera</b>.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * 
     * Specifies dialog box behavior. Can be set to the following values:
     * 
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Default behavior.</td>
     * </tr>
     * <tr>
     * <td>WIA_SELECT_DEVICE_NODEFAULT</td>
     * <td>Force this method to display the <b>Select Device</b> dialog box. For more information, see the <b>Remarks</b> section of this reference page.</td>
     * </tr>
     * <tr>
     * <td>WIA_DEVICE_DIALOG_SINGLE_IMAGE</td>
     * <td>Restrict image selection to a single image in the device image acquisition dialog box.</td>
     * </tr>
     * <tr>
     * <td>WIA_DEVICE_DIALOG_USE_COMMON_UI</td>
     * <td>Use the system UI, if available, rather than the vendor-supplied UI. If the system UI is not available, the vendor UI is used. If neither UI is available, the function returns E_NOTIMPL.</td>
     * </tr>
     * </table>
     * @param {Integer} lIntent Type: <b>LONG</b>
     * 
     * Specifies what type of data the image is intended to represent. For a list of image intent values, see <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-imageintentconstants">Image Intent Constants</a>.
     * @param {IWiaItem} pItemRoot Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a>*</b>
     * 
     * Pointer to the interface of the hierarchical tree of <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaitem">IWiaItem</a> objects returned by <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadevmgr-createdevice">IWiaDevMgr::CreateDevice</a>.
     * @param {BSTR} bstrFilename Type: <b>BSTR</b>
     * 
     * Specifies the name of the file to which the image data is written.
     * @param {Pointer<Guid>} pguidFormat Type: <b>GUID*</b>
     * 
     * On input, contains a pointer to a GUID that specifies the format to use. On output, holds the format used. Pass IID_NULL to use the default format.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * <b>IWiaDevMgr::GetImageDlg</b> returns S_FALSE if the user cancels the device selection or image acquisition dialog boxes, WIA_S_NO_DEVICE_AVAILABLE if no WIA device is currently available, E_NOTIMPL if no UI is available, and S_OK if the data is transferred successfully.
     * 
     * <b>IWiaDevMgr::GetImageDlg</b> returns a value specified in <a href="/windows/desktop/wia/-wia-error-codes">Error Codes</a>, or a standard COM error if it fails for any reason other than those specified.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiadevmgr-getimagedlg
     */
    GetImageDlg(hwndParent, lDeviceType, lFlags, lIntent, pItemRoot, bstrFilename, pguidFormat) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        bstrFilename := bstrFilename is String ? BSTR.Alloc(bstrFilename).Value : bstrFilename

        result := ComCall(7, this, "ptr", hwndParent, "int", lDeviceType, "int", lFlags, "int", lIntent, "ptr", pItemRoot, "ptr", bstrFilename, "ptr", pguidFormat, "HRESULT")
        return result
    }

    /**
     * The IWiaDevMgr::RegisterEventCallbackProgram method registers an application to receive device events. It is primarily provided for backward compatibility with applications that were not written for WIA.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * 
     * Specifies registration flags. Can be set to the following values:
     * 
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Registration Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>WIA_REGISTER_EVENT_CALLBACK</td>
     * <td>Register for the event.</td>
     * </tr>
     * <tr>
     * <td>WIA_UNREGISTER_EVENT_CALLBACK</td>
     * <td>Delete the registration for the event.</td>
     * </tr>
     * <tr>
     * <td>WIA_SET_DEFAULT_HANDLER</td>
     * <td>Set the application as the default event handler.</td>
     * </tr>
     * </table>
     * @param {BSTR} bstrDeviceID Type: <b>BSTR</b>
     * 
     * Specifies a device identifier. Pass <b>NULL</b> to register for the event on all WIA devices.
     * @param {Pointer<Guid>} pEventGUID Type: <b>const GUID*</b>
     * 
     * Specifies the event for which the application is registering. For a list of valid event GUIDs, see <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-wia-event-identifiers">WIA Event Identifiers</a>.
     * @param {BSTR} bstrCommandline Type: <b>BSTR</b>
     * 
     * Specifies a string that contains the full path name and the appropriate command-line arguments needed to invoke the application. Two pairs of quotation marks should be used, for example, "\"C:\Program Files\MyExe.exe\" /arg1".
     * @param {BSTR} bstrName Type: <b>BSTR</b>
     * 
     * Specifies the name of the application. This name is displayed to the user when multiple applications register for the same event.
     * @param {BSTR} bstrDescription Type: <b>BSTR</b>
     * 
     * Specifies the description of the application. This description is displayed to the user when multiple applications register for the same event.
     * @param {BSTR} bstrIcon Type: <b>BSTR</b>
     * 
     * Specifies the icon that represents the application. The icon is displayed to the user when multiple applications register for the same event. The string contains the name of the application and the 0-based index of the icon (there may be more than one icon that represent application) separated by a comma. For example, "MyApp, 0".
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiadevmgr-registereventcallbackprogram
     */
    RegisterEventCallbackProgram(lFlags, bstrDeviceID, pEventGUID, bstrCommandline, bstrName, bstrDescription, bstrIcon) {
        bstrDeviceID := bstrDeviceID is String ? BSTR.Alloc(bstrDeviceID).Value : bstrDeviceID
        bstrCommandline := bstrCommandline is String ? BSTR.Alloc(bstrCommandline).Value : bstrCommandline
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription
        bstrIcon := bstrIcon is String ? BSTR.Alloc(bstrIcon).Value : bstrIcon

        result := ComCall(8, this, "int", lFlags, "ptr", bstrDeviceID, "ptr", pEventGUID, "ptr", bstrCommandline, "ptr", bstrName, "ptr", bstrDescription, "ptr", bstrIcon, "HRESULT")
        return result
    }

    /**
     * The IWiaDevMgr::RegisterEventCallbackInterface method registers a running application Windows Image Acquisition (WIA) event notification.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * 
     * Currently unused. Should be set to zero.
     * @param {BSTR} bstrDeviceID Type: <b>BSTR</b>
     * 
     * Specifies a device identifier. Pass <b>NULL</b> to register for the event on all WIA devices.
     * @param {Pointer<Guid>} pEventGUID Type: <b>const GUID*</b>
     * 
     * Specifies the event for which the application is registering. For a list of standard events, see <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-wia-event-identifiers">WIA Event Identifiers</a>.
     * @param {IWiaEventCallback} pIWiaEventCallback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaeventcallback">IWiaEventCallback</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiaeventcallback">IWiaEventCallback</a> interface that the WIA system used to send the event notification.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiadevmgr-registereventcallbackinterface
     */
    RegisterEventCallbackInterface(lFlags, bstrDeviceID, pEventGUID, pIWiaEventCallback) {
        bstrDeviceID := bstrDeviceID is String ? BSTR.Alloc(bstrDeviceID).Value : bstrDeviceID

        result := ComCall(9, this, "int", lFlags, "ptr", bstrDeviceID, "ptr", pEventGUID, "ptr", pIWiaEventCallback, "ptr*", &pEventObject := 0, "HRESULT")
        return IUnknown(pEventObject)
    }

    /**
     * The IWiaDevMgr::RegisterEventCallbackCLSID method registers an application to receive events even if the application may not be running.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * 
     * Specifies registration flags. Can be set to the following values:
     * 
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Registration Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>WIA_REGISTER_EVENT_CALLBACK</td>
     * <td>Register for the event.</td>
     * </tr>
     * <tr>
     * <td>WIA_UNREGISTER_EVENT_CALLBACK</td>
     * <td>Delete the registration for the event.</td>
     * </tr>
     * <tr>
     * <td>WIA_SET_DEFAULT_HANDLER</td>
     * <td>Set the application as the default event handler.</td>
     * </tr>
     * </table>
     * @param {BSTR} bstrDeviceID Type: <b>BSTR</b>
     * 
     * Specifies a device identifier. Pass <b>NULL</b> to register for the event on all WIA devices.
     * @param {Pointer<Guid>} pEventGUID Type: <b>const GUID*</b>
     * 
     * Specifies the event for which the application is registering. For a list of standard events, see <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-wia-event-identifiers">WIA Event Identifiers</a>.
     * @param {Pointer<Guid>} pClsID Type: <b>const GUID*</b>
     * 
     * Pointer to the application's class ID (<b>CLSID</b>). The WIA run-time system uses the application's <b>CLSID</b> to start the application when an event occurs for which it is registered.
     * @param {BSTR} bstrName Type: <b>BSTR</b>
     * 
     * Specifies the name of the application that registers for the event.
     * @param {BSTR} bstrDescription Type: <b>BSTR</b>
     * 
     * Specifies a text description of the application that registers for the event.
     * @param {BSTR} bstrIcon Type: <b>BSTR</b>
     * 
     * Specifies the name of an image file to be used for the icon for the application that registers for the event.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiadevmgr-registereventcallbackclsid
     */
    RegisterEventCallbackCLSID(lFlags, bstrDeviceID, pEventGUID, pClsID, bstrName, bstrDescription, bstrIcon) {
        bstrDeviceID := bstrDeviceID is String ? BSTR.Alloc(bstrDeviceID).Value : bstrDeviceID
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription
        bstrIcon := bstrIcon is String ? BSTR.Alloc(bstrIcon).Value : bstrIcon

        result := ComCall(10, this, "int", lFlags, "ptr", bstrDeviceID, "ptr", pEventGUID, "ptr", pClsID, "ptr", bstrName, "ptr", bstrDescription, "ptr", bstrIcon, "HRESULT")
        return result
    }

    /**
     * This method is not implemented.
     * @param {HWND} hwndParent Type: <b>HWND</b>
     * @param {Integer} lFlags Type: <b>LONG</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiadevmgr-adddevicedlg
     */
    AddDeviceDlg(hwndParent, lFlags) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(11, this, "ptr", hwndParent, "int", lFlags, "HRESULT")
        return result
    }
}
