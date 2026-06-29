#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWSDAddress.ahk" { IWSDAddress }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents an IP-based transport address.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nn-wsdbase-iwsdtransportaddress
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDTransportAddress extends IWSDAddress {
    /**
     * The interface identifier for IWSDTransportAddress
     * @type {Guid}
     */
    static IID := Guid("{70d23498-4ee6-4340-a3df-d845d2235467}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDTransportAddress interfaces
    */
    struct Vtbl extends IWSDAddress.Vtbl {
        GetPort               : IntPtr
        SetPort               : IntPtr
        GetTransportAddress   : IntPtr
        GetTransportAddressEx : IntPtr
        SetTransportAddress   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDTransportAddress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the IP port number associated with this transport address.
     * @returns {Integer} Port number associated with the address object.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdtransportaddress-getport
     */
    GetPort() {
        result := ComCall(5, this, "ushort*", &pwPort := 0, "HRESULT")
        return pwPort
    }

    /**
     * Sets only the IP port number for this transport address.
     * @param {Integer} wPort The IP port number for the address object.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdtransportaddress-setport
     */
    SetPort(wPort) {
        result := ComCall(6, this, "ushort", wPort, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to a string representation of the address object. (IWSDTransportAddress.GetTransportAddress)
     * @remarks
     * The string returned by this method may contain an IPv4 or unbracketed IPv6 address such as "fe80::1".  It may also contain a bracketed IPv6 address that includes the port such as "[fe80::1]:1234".  The caller should parse the string carefully to account for both possibilities.
     * @returns {PWSTR} String representation of the address object. Do not deallocate this pointer.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdtransportaddress-gettransportaddress
     */
    GetTransportAddress() {
        result := ComCall(7, this, PWSTR.Ptr, &ppszAddress := 0, "HRESULT")
        return ppszAddress
    }

    /**
     * Gets a pointer to a string representation of the address object. (IWSDTransportAddress.GetTransportAddressEx)
     * @remarks
     * The string returned by this method may contain an IPv4 or unbracketed IPv6 address such as "fe80::1".  It may also contain a bracketed IPv6 address that includes the port such as "[fe80::1]:1234".  The caller should parse the string carefully to account for both possibilities.
     * @param {BOOL} fSafe Specifies whether the scope identifier for an IPv6 address is included in the returned <i>ppszAddress</i> string. For example, if the address object represents an IPv6 link local address and <i>fSafe</i> is <b>FALSE</b>, then the IPv6 scope identifier will be included in the returned <i>ppszAddress</i> string.
     * 
     * If the address object represents an IPv4 address or a host name, this parameter is ignored.
     * @returns {PWSTR} String representation of the address object. Do not deallocate this pointer.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdtransportaddress-gettransportaddressex
     */
    GetTransportAddressEx(fSafe) {
        result := ComCall(8, this, BOOL, fSafe, PWSTR.Ptr, &ppszAddress := 0, "HRESULT")
        return ppszAddress
    }

    /**
     * Sets the string representation of the transport address.
     * @param {PWSTR} pszAddress String representation of the transport address.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following:
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
     * The length in characters of the address string pointed to by <i>ppszAddress</i> exceeds WSD_MAX_TEXT_LENGTH (8192),  <i>ppszAddress</i> is <b>NULL</b>, or the format of <i>ppszAddress</i> was not recognized. 
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
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdtransportaddress-settransportaddress
     */
    SetTransportAddress(pszAddress) {
        pszAddress := pszAddress is String ? StrPtr(pszAddress) : pszAddress

        result := ComCall(9, this, "ptr", pszAddress, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWSDTransportAddress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPort := CallbackCreate(GetMethod(implObj, "GetPort"), flags, 2)
        this.vtbl.SetPort := CallbackCreate(GetMethod(implObj, "SetPort"), flags, 2)
        this.vtbl.GetTransportAddress := CallbackCreate(GetMethod(implObj, "GetTransportAddress"), flags, 2)
        this.vtbl.GetTransportAddressEx := CallbackCreate(GetMethod(implObj, "GetTransportAddressEx"), flags, 3)
        this.vtbl.SetTransportAddress := CallbackCreate(GetMethod(implObj, "SetTransportAddress"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPort)
        CallbackFree(this.vtbl.SetPort)
        CallbackFree(this.vtbl.GetTransportAddress)
        CallbackFree(this.vtbl.GetTransportAddressEx)
        CallbackFree(this.vtbl.SetTransportAddress)
    }
}
