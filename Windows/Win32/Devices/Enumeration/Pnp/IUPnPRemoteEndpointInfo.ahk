#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUPnPRemoteEndpointInfo interface allows a hosted device to obtain information about a requester (that is, a control point) and the request.
 * @see https://learn.microsoft.com/windows/win32/api/upnphost/nn-upnphost-iupnpremoteendpointinfo
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPRemoteEndpointInfo extends IUnknown {
    /**
     * The interface identifier for IUPnPRemoteEndpointInfo
     * @type {Guid}
     */
    static IID := Guid("{c92eb863-0269-4aff-9c72-75321bba2952}")

    /**
     * The class identifier for UPnPRemoteEndpointInfo
     * @type {Guid}
     */
    static CLSID := Guid("{2e5e84e9-4049-4244-b728-2d24227157c7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPRemoteEndpointInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDwordValue  : IntPtr
        GetStringValue : IntPtr
        GetGuidValue   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPRemoteEndpointInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetDwordValue method gets a 4-byte value that provides information about either a request or requester.
     * @remarks
     * Currently, the only valid value for the <i>bstrValueName</i> parameter is "AddressFamily". For any other value, this method will return the COM error code E_INVALIDARG.
     * @param {BSTR} bstrValueName String that specifies the category of information to be retrieved.
     * @returns {Integer} Pointer to a 4-byte value, the meaning of which depends on the value of <i>bstrValueName</i>.
     * 
     * If <i>bstrValueName</i> is "AddressFamily", the 4-byte value indicates the format of the requester's IP address as follows. The values are defined in Winsock2.h.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IP (IP version 4)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IP6 (IP version 6)
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpremoteendpointinfo-getdwordvalue
     */
    GetDwordValue(bstrValueName) {
        bstrValueName := bstrValueName is String ? BSTR.Alloc(bstrValueName).Value : bstrValueName

        result := ComCall(3, this, BSTR, bstrValueName, "uint*", &pdwValue := 0, "HRESULT")
        return pdwValue
    }

    /**
     * The GetStringValue method gets a string that provides information about either a request or requester.
     * @remarks
     * Currently, the only valid values for the <i>bstrValueName</i> parameter are "RemoteAddress" and (Windows 7 only) "HttpUserAgent". For any other value, this method will return the COM error code E_INVALIDARG.
     * @param {BSTR} bstrValueName String that specifies the category of information to be retrieved.
     * @returns {BSTR} Pointer to a string, the meaning of which depends on the value of <i>bstrValueName</i>.
     * 
     * If <i>bstrValueName</i> is "RemoteAddress", the string is the requester's IP address.<b>Windows 7:  </b>To retrieve the HTTP UserAgent header, set <i>bstrValueName</i> to "HttpUserAgent".
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpremoteendpointinfo-getstringvalue
     */
    GetStringValue(bstrValueName) {
        bstrValueName := bstrValueName is String ? BSTR.Alloc(bstrValueName).Value : bstrValueName

        pbstrValue := BSTR.Owned()
        result := ComCall(4, this, BSTR, bstrValueName, BSTR.Ptr, pbstrValue, "HRESULT")
        return pbstrValue
    }

    /**
     * The GetGuidValue method currently is not supported.
     * @param {BSTR} bstrValueName Not supported.
     * @returns {Guid} Not supported.
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpremoteendpointinfo-getguidvalue
     */
    GetGuidValue(bstrValueName) {
        bstrValueName := bstrValueName is String ? BSTR.Alloc(bstrValueName).Value : bstrValueName

        pguidValue := Guid()
        result := ComCall(5, this, BSTR, bstrValueName, Guid.Ptr, pguidValue, "HRESULT")
        return pguidValue
    }

    Query(iid) {
        if (IUPnPRemoteEndpointInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDwordValue := CallbackCreate(GetMethod(implObj, "GetDwordValue"), flags, 3)
        this.vtbl.GetStringValue := CallbackCreate(GetMethod(implObj, "GetStringValue"), flags, 3)
        this.vtbl.GetGuidValue := CallbackCreate(GetMethod(implObj, "GetGuidValue"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDwordValue)
        CallbackFree(this.vtbl.GetStringValue)
        CallbackFree(this.vtbl.GetGuidValue)
    }
}
