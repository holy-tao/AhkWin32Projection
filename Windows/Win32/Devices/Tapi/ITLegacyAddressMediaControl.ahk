#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITLegacyAddressMediaControl interface is provided to support legacy applications that require direct access to a device and its configuration. It is exposed by the Address Object and can be created by calling QueryInterface on ITAddress.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itlegacyaddressmediacontrol
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITLegacyAddressMediaControl extends IUnknown {
    /**
     * The interface identifier for ITLegacyAddressMediaControl
     * @type {Guid}
     */
    static IID := Guid("{ab493640-4c0b-11d2-a046-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITLegacyAddressMediaControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetID        : IntPtr
        GetDevConfig : IntPtr
        SetDevConfig : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITLegacyAddressMediaControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetID method returns a device identifier for the specified device class associated with the current address.
     * @remarks
     * The application must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-registercallnotifications">ITTAPI::RegisterCallNotifications</a> prior to calling this method.
     * 
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pDeviceClass</i> parameter and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variable is no longer needed.
     * 
     * The application must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory allocated for the <i>ppDeviceID</i> parameter.
     * 
     * <b>TAPI 2.1 Cross-References:  </b><a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a>, <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetdevconfig">lineSetDevConfig</a>, <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetid">lineGetID</a>
     * @param {BSTR} pDeviceClass Pointer to <b>BSTR</b> containing 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapi-device-classes">TAPI device class</a> for which configuration information is needed.
     * @param {Pointer<Integer>} pdwSize Length of device identifier returned.
     * @param {Pointer<Pointer<Integer>>} ppDeviceID Device identifier.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method failed. This may mean there is no device of a specified class associated with the current address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdwSize</i> or <i>ppDeviceID</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol-getid
     */
    GetID(pDeviceClass, pdwSize, ppDeviceID) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        ppDeviceIDMarshal := ppDeviceID is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, BSTR, pDeviceClass, pdwSizeMarshal, pdwSize, ppDeviceIDMarshal, ppDeviceID, "HRESULT")
        return result
    }

    /**
     * The GetDevConfig method returns an opaque data structure.
     * @remarks
     * This method is a COM wrapper for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">LineGetDevConfig</a> TAPI 2.1 function.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol-getid">GetID</a> must be performed prior to calling this method.
     * 
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pDeviceClass</i> parameter and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variable is no longer needed.
     * 
     * The application must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free the memory allocated for the <i>ppDeviceConfig</i> parameter.
     * 
     * <b>TAPI 2.1 Cross-References:  </b><a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a>, <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetdevconfig">lineSetDevConfig</a>
     * @param {BSTR} pDeviceClass Pointer to <b>BSTR</b> containing 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapi-device-classes">TAPI device class</a> for which configuration information is needed.
     * @param {Pointer<Integer>} pdwSize Pointer to size of configuration array.
     * @param {Pointer<Pointer<Integer>>} ppDeviceConfig Pointer to array of bytes containing device configuration information.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pDeviceClass</i>, <i>pdwSize</i>, or <i>ppDeviceConfig</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol-getdevconfig
     */
    GetDevConfig(pDeviceClass, pdwSize, ppDeviceConfig) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        ppDeviceConfigMarshal := ppDeviceConfig is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, BSTR, pDeviceClass, pdwSizeMarshal, pdwSize, ppDeviceConfigMarshal, ppDeviceConfig, "HRESULT")
        return result
    }

    /**
     * The SetDevConfig function allows the application to restore the configuration of a media stream device on a line device to a setup previously obtained using GetDevConfig.
     * @remarks
     * This method is a COM wrapper for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetdevconfig">lineSetDevConfig</a> TAPI 2.1 function.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol-getid">GetID</a> must be performed prior to calling this method.
     * 
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pDeviceClass</i> parameter and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variable is no longer needed.
     * 
     * <b>TAPI 2.1 Cross-References:  </b><a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetdevconfig">lineGetDevConfig</a>, <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetdevconfig">lineSetDevConfig</a>
     * @param {BSTR} pDeviceClass Pointer to <b>BSTR</b> containing 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapi-device-classes">TAPI device class</a> for which configuration information is needed.
     * @param {Integer} dwSize Size of configuration array.
     * @param {Pointer<Integer>} pDeviceConfig Pointer to the array of bytes containing device configuration information obtained by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol-getdevconfig">GetDevConfig</a>.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pDeviceClass</i>, <i>pdwSize</i>, or <i>ppDeviceConfig</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdwSize</i> parameter is zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol-setdevconfig
     */
    SetDevConfig(pDeviceClass, dwSize, pDeviceConfig) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        pDeviceConfigMarshal := pDeviceConfig is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, BSTR, pDeviceClass, "uint", dwSize, pDeviceConfigMarshal, pDeviceConfig, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITLegacyAddressMediaControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetID := CallbackCreate(GetMethod(implObj, "GetID"), flags, 4)
        this.vtbl.GetDevConfig := CallbackCreate(GetMethod(implObj, "GetDevConfig"), flags, 4)
        this.vtbl.SetDevConfig := CallbackCreate(GetMethod(implObj, "SetDevConfig"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetID)
        CallbackFree(this.vtbl.GetDevConfig)
        CallbackFree(this.vtbl.SetDevConfig)
    }
}
