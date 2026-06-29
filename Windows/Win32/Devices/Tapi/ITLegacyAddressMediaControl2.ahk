#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITLegacyAddressMediaControl.ahk" { ITLegacyAddressMediaControl }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITLegacyAddressMediaControl2 interface derives from the ITLegacyAddressMediaControl interface. ITLegacyAddressMediaControl2 provides additional methods that allow the configuration of parameters related to line devices.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itlegacyaddressmediacontrol2
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITLegacyAddressMediaControl2 extends ITLegacyAddressMediaControl {
    /**
     * The interface identifier for ITLegacyAddressMediaControl2
     * @type {Guid}
     */
    static IID := Guid("{b0ee512b-a531-409e-9dd9-4099fe86c738}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITLegacyAddressMediaControl2 interfaces
    */
    struct Vtbl extends ITLegacyAddressMediaControl.Vtbl {
        ConfigDialog     : IntPtr
        ConfigDialogEdit : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITLegacyAddressMediaControl2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ConfigDialog method causes the provider of the specified line device to display a dialog box to allow the user to configure parameters related to the line device. The parameters that can be edited are those currently in use on the device.
     * @remarks
     * This method translates to a TAPI 2.<i>x</i>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineconfigdialog">lineConfigDialog</a> function call. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol2-configdialogedit">ITLegacyAddressMediaControl2::ConfigDialogEdit</a> method translates to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineconfigdialogedit">lineConfigDialogEdit</a> call. These methods differ in their source of parameters to edit and the result of the editing on an active connection. For a discussion about these differences, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineconfigdialogedit">lineConfigDialogEdit</a>.
     * @param {HWND} hwndOwner A handle to a window to which the dialog box is to be attached. This parameter can be <b>NULL</b> to indicate that a window created by the method should have no owner window.
     * @param {BSTR} pDeviceClass Pointer to a <b>BSTR</b> that specifies a device class name. This device class allows the application to select a specific subscreen of configuration information applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest-level configuration is selected.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol2-configdialog
     */
    ConfigDialog(hwndOwner, pDeviceClass) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        result := ComCall(6, this, HWND, hwndOwner, BSTR, pDeviceClass, "HRESULT")
        return result
    }

    /**
     * The ConfigDialogEdit method causes the provider of the specified line device to display a dialog box to allow the user to configure parameters related to the line device.
     * @remarks
     * This method translates to a TAPI 2.<i>x</i>
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineconfigdialogedit">lineConfigDialogEdit</a> call. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol2-configdialog">ITLegacyAddressMediaControl2::ConfigDialog</a> method translates to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineconfigdialog">lineConfigDialog</a> call. These methods differ in their source of parameters to edit and the result of the editing on an active connection. For a discussion about these differences, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineconfigdialogedit">lineConfigDialogEdit</a>.
     * @param {HWND} hwndOwner A handle to a window to which the dialog box is to be attached. Can be <b>NULL</b> to indicate that a window created by the method should have no owner window.
     * @param {BSTR} pDeviceClass Pointer to a <b>BSTR</b> that specifies a device class name. This device class allows the application to select a specific subscreen of configuration information applicable to that device class. This parameter is optional and can be left <b>NULL</b> or empty, in which case the highest level configuration is selected.
     * @param {Integer} dwSizeIn Pointer to the size of the configuration data pointed to by the <i>pDeviceConfigIn</i> parameter.
     * @param {Pointer<Integer>} pDeviceConfigIn Pointer to an array of bytes containing device configuration data to edit.
     * @param {Pointer<Integer>} pdwSizeOut Pointer to the size of the configuration data pointed to by the <i>ppDeviceConfigOut</i> parameter.
     * @param {Pointer<Pointer<Integer>>} ppDeviceConfigOut Pointer to an array of bytes containing edited device configuration data.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol2-configdialogedit
     */
    ConfigDialogEdit(hwndOwner, pDeviceClass, dwSizeIn, pDeviceConfigIn, pdwSizeOut, ppDeviceConfigOut) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        pDeviceConfigInMarshal := pDeviceConfigIn is VarRef ? "char*" : "ptr"
        pdwSizeOutMarshal := pdwSizeOut is VarRef ? "uint*" : "ptr"
        ppDeviceConfigOutMarshal := ppDeviceConfigOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, HWND, hwndOwner, BSTR, pDeviceClass, "uint", dwSizeIn, pDeviceConfigInMarshal, pDeviceConfigIn, pdwSizeOutMarshal, pdwSizeOut, ppDeviceConfigOutMarshal, ppDeviceConfigOut, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITLegacyAddressMediaControl2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConfigDialog := CallbackCreate(GetMethod(implObj, "ConfigDialog"), flags, 3)
        this.vtbl.ConfigDialogEdit := CallbackCreate(GetMethod(implObj, "ConfigDialogEdit"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConfigDialog)
        CallbackFree(this.vtbl.ConfigDialogEdit)
    }
}
