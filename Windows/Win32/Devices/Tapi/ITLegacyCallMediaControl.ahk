#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITLegacyCallMediaControl interface supports legacy applications that must communicate directly with a device. This interface is exposed on the Call Object and can be created by calling QueryInterface on ITBasicCallControl.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itlegacycallmediacontrol
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITLegacyCallMediaControl extends IDispatch {
    /**
     * The interface identifier for ITLegacyCallMediaControl
     * @type {Guid}
     */
    static IID := Guid("{d624582f-cc23-4436-b8a5-47c625c8045d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITLegacyCallMediaControl interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        DetectDigits   : IntPtr
        GenerateDigits : IntPtr
        GetID          : IntPtr
        SetMediaType   : IntPtr
        MonitorMedia   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITLegacyCallMediaControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The DetectDigits method sets an identifier of the type of digits that will be detected on the current call, such as rotary pulse or DTMF.
     * @param {Integer} DigitMode Indicates 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapi-digitmode--constants">digit mode</a>.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALCALLSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No call currently exists.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol-detectdigits
     */
    DetectDigits(DigitMode) {
        result := ComCall(7, this, "int", DigitMode, "HRESULT")
        return result
    }

    /**
     * The GenerateDigits method causes digits to be output on the current call.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> to allocate memory for the <i>pDigits</i> parameter and use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory when the variable is no longer needed.
     * @param {BSTR} pDigits Pointer to <b>BSTR</b> representation of digits to be sent.
     * @param {Integer} DigitMode Indicates 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapi-digitmode--constants">digit mode</a>.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALCALLSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No call currently exists.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol-generatedigits
     */
    GenerateDigits(pDigits, DigitMode) {
        pDigits := pDigits is String ? BSTR.Alloc(pDigits).Value : pDigits

        result := ComCall(8, this, BSTR, pDigits, "int", DigitMode, "HRESULT")
        return result
    }

    /**
     * The GetID method gets the identifier for the device associated with the current call.
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
     * @param {BSTR} pDeviceClass Pointer to <b>BSTR</b> representing the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapi-device-classes">TAPI device class</a>.
     * @param {Pointer<Integer>} pdwSize Size in bytes of device identifier.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol-getid
     */
    GetID(pDeviceClass, pdwSize, ppDeviceID) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        ppDeviceIDMarshal := ppDeviceID is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, BSTR, pDeviceClass, pdwSizeMarshal, pdwSize, ppDeviceIDMarshal, ppDeviceID, "HRESULT")
        return result
    }

    /**
     * The SetMediaType method sets the media type(s) for the current call in its LINECALLINFO structure. For more information, see lineSetMediaMode.
     * @param {Integer} lMediaType Indicator of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media type</a>.
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
     * The associated call object is not valid.
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
     * The <i>lMediaType</i> parameter is not valid.
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol-setmediatype
     */
    SetMediaType(lMediaType) {
        result := ComCall(10, this, "int", lMediaType, "HRESULT")
        return result
    }

    /**
     * The MonitorMedia method sets monitoring for a given media type on the current call.
     * @param {Integer} lMediaType Indicator of 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media type</a>.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lMediaType</i> parameter is not valid.
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
     * The associated call object is not valid.
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol-monitormedia
     */
    MonitorMedia(lMediaType) {
        result := ComCall(11, this, "int", lMediaType, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITLegacyCallMediaControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DetectDigits := CallbackCreate(GetMethod(implObj, "DetectDigits"), flags, 2)
        this.vtbl.GenerateDigits := CallbackCreate(GetMethod(implObj, "GenerateDigits"), flags, 3)
        this.vtbl.GetID := CallbackCreate(GetMethod(implObj, "GetID"), flags, 4)
        this.vtbl.SetMediaType := CallbackCreate(GetMethod(implObj, "SetMediaType"), flags, 2)
        this.vtbl.MonitorMedia := CallbackCreate(GetMethod(implObj, "MonitorMedia"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DetectDigits)
        CallbackFree(this.vtbl.GenerateDigits)
        CallbackFree(this.vtbl.GetID)
        CallbackFree(this.vtbl.SetMediaType)
        CallbackFree(this.vtbl.MonitorMedia)
    }
}
