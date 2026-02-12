#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITLegacyAddressMediaControl interface is provided to support legacy applications that require direct access to a device and its configuration. It is exposed by the Address Object and can be created by calling QueryInterface on ITAddress.
 * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nn-tapi3if-itlegacyaddressmediacontrol
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITLegacyAddressMediaControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITLegacyAddressMediaControl
     * @type {Guid}
     */
    static IID => Guid("{ab493640-4c0b-11d2-a046-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetID", "GetDevConfig", "SetDevConfig"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol-getid
     */
    GetID(pDeviceClass, pdwSize, ppDeviceID) {
        if(pDeviceClass is String) {
            pin := BSTR.Alloc(pDeviceClass)
            pDeviceClass := pin.Value
        }

        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        ppDeviceIDMarshal := ppDeviceID is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pDeviceClass, pdwSizeMarshal, pdwSize, ppDeviceIDMarshal, ppDeviceID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol-getdevconfig
     */
    GetDevConfig(pDeviceClass, pdwSize, ppDeviceConfig) {
        if(pDeviceClass is String) {
            pin := BSTR.Alloc(pDeviceClass)
            pDeviceClass := pin.Value
        }

        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        ppDeviceConfigMarshal := ppDeviceConfig is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pDeviceClass, pdwSizeMarshal, pdwSize, ppDeviceConfigMarshal, ppDeviceConfig, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol-setdevconfig
     */
    SetDevConfig(pDeviceClass, dwSize, pDeviceConfig) {
        if(pDeviceClass is String) {
            pin := BSTR.Alloc(pDeviceClass)
            pDeviceClass := pin.Value
        }

        pDeviceConfigMarshal := pDeviceConfig is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "ptr", pDeviceClass, "uint", dwSize, pDeviceConfigMarshal, pDeviceConfig, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
