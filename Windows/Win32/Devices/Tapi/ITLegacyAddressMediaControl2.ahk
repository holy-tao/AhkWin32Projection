#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITLegacyAddressMediaControl.ahk

/**
 * The ITLegacyAddressMediaControl2 interface derives from the ITLegacyAddressMediaControl interface. ITLegacyAddressMediaControl2 provides additional methods that allow the configuration of parameters related to line devices.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itlegacyaddressmediacontrol2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITLegacyAddressMediaControl2 extends ITLegacyAddressMediaControl{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITLegacyAddressMediaControl2
     * @type {Guid}
     */
    static IID => Guid("{b0ee512b-a531-409e-9dd9-4099fe86c738}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConfigDialog", "ConfigDialogEdit"]

    /**
     * The ConfigDialog method causes the provider of the specified line device to display a dialog box to allow the user to configure parameters related to the line device. The parameters that can be edited are those currently in use on the device.
     * @param {HWND} hwndOwner A handle to a window to which the dialog box is to be attached. This parameter can be <b>NULL</b> to indicate that a window created by the method should have no owner window.
     * @param {BSTR} pDeviceClass Pointer to a <b>BSTR</b> that specifies a device class name. This device class allows the application to select a specific subscreen of configuration information applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest-level configuration is selected.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itlegacyaddressmediacontrol2-configdialog
     */
    ConfigDialog(hwndOwner, pDeviceClass) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        result := ComCall(6, this, "ptr", hwndOwner, "ptr", pDeviceClass, "HRESULT")
        return result
    }

    /**
     * The ConfigDialogEdit method causes the provider of the specified line device to display a dialog box to allow the user to configure parameters related to the line device.
     * @param {HWND} hwndOwner A handle to a window to which the dialog box is to be attached. Can be <b>NULL</b> to indicate that a window created by the method should have no owner window.
     * @param {BSTR} pDeviceClass Pointer to a <b>BSTR</b> that specifies a device class name. This device class allows the application to select a specific subscreen of configuration information applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest level configuration is selected.
     * @param {Integer} dwSizeIn Pointer to the size of the configuration data pointed to by the <i>pDeviceConfigIn</i> parameter.
     * @param {Pointer<Integer>} pDeviceConfigIn Pointer to an array of bytes containing device configuration data to edit.
     * @param {Pointer<Integer>} pdwSizeOut Pointer to the size of the configuration data pointed to by the <i>ppDeviceConfigOut</i> parameter.
     * @param {Pointer<Pointer<Integer>>} ppDeviceConfigOut Pointer to an array of bytes containing edited device configuration data.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itlegacyaddressmediacontrol2-configdialogedit
     */
    ConfigDialogEdit(hwndOwner, pDeviceClass, dwSizeIn, pDeviceConfigIn, pdwSizeOut, ppDeviceConfigOut) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        pDeviceConfigInMarshal := pDeviceConfigIn is VarRef ? "char*" : "ptr"
        pdwSizeOutMarshal := pdwSizeOut is VarRef ? "uint*" : "ptr"
        ppDeviceConfigOutMarshal := ppDeviceConfigOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", hwndOwner, "ptr", pDeviceClass, "uint", dwSizeIn, pDeviceConfigInMarshal, pDeviceConfigIn, pdwSizeOutMarshal, pdwSizeOut, ppDeviceConfigOutMarshal, ppDeviceConfigOut, "HRESULT")
        return result
    }
}
