#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWSDTransportAddress.ahk" { IWSDTransportAddress }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Provides access to the individual components of an HTTP address.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nn-wsdbase-iwsdhttpaddress
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDHttpAddress extends IWSDTransportAddress {
    /**
     * The interface identifier for IWSDHttpAddress
     * @type {Guid}
     */
    static IID := Guid("{d09ac7bd-2a3e-4b85-8605-2737ff3e4ea0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDHttpAddress interfaces
    */
    struct Vtbl extends IWSDTransportAddress.Vtbl {
        GetSecure : IntPtr
        SetSecure : IntPtr
        GetPath   : IntPtr
        SetPath   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDHttpAddress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the status on whether TLS secure sessions are enabled for this address.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
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
     * TLS secure sessions are enabled for this address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TLS secure sessions are disabled for this address.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpaddress-getsecure
     */
    GetSecure() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Enables or disables TLS secure sessions for this address.
     * @param {BOOL} fSecure <b>TRUE</b> to enable TLS secure session communications for this address, <b>FALSE</b> to disable TLS.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
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
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpaddress-setsecure
     */
    SetSecure(fSecure) {
        result := ComCall(11, this, BOOL, fSecure, "HRESULT")
        return result
    }

    /**
     * Gets the URI path for this address.
     * @returns {PWSTR} Pointer to the URI path for this address. Do not release this object.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpaddress-getpath
     */
    GetPath() {
        result := ComCall(12, this, PWSTR.Ptr, &ppszPath := 0, "HRESULT")
        return ppszPath
    }

    /**
     * Sets the URI path for this address.
     * @param {PWSTR} pszPath The URI path to use for this address.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
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
     * Method completed successfully.
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
     * The length in characters of <i>pszPath</i> exceeds WSD_MAX_TEXT_LENGTH (8192). 
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
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpaddress-setpath
     */
    SetPath(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(13, this, "ptr", pszPath, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWSDHttpAddress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSecure := CallbackCreate(GetMethod(implObj, "GetSecure"), flags, 1)
        this.vtbl.SetSecure := CallbackCreate(GetMethod(implObj, "SetSecure"), flags, 2)
        this.vtbl.GetPath := CallbackCreate(GetMethod(implObj, "GetPath"), flags, 2)
        this.vtbl.SetPath := CallbackCreate(GetMethod(implObj, "SetPath"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSecure)
        CallbackFree(this.vtbl.SetSecure)
        CallbackFree(this.vtbl.GetPath)
        CallbackFree(this.vtbl.SetPath)
    }
}
