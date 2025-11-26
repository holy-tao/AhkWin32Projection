#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPRemoteEndpointInfo interface allows a hosted device to obtain information about a requester (that is, a control point) and the request.
 * @see https://docs.microsoft.com/windows/win32/api//upnphost/nn-upnphost-iupnpremoteendpointinfo
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPRemoteEndpointInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPRemoteEndpointInfo
     * @type {Guid}
     */
    static IID => Guid("{c92eb863-0269-4aff-9c72-75321bba2952}")

    /**
     * The class identifier for UPnPRemoteEndpointInfo
     * @type {Guid}
     */
    static CLSID => Guid("{2e5e84e9-4049-4244-b728-2d24227157c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDwordValue", "GetStringValue", "GetGuidValue"]

    /**
     * The GetDwordValue method gets a 4-byte value that provides information about either a request or requester.
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
     * @see https://docs.microsoft.com/windows/win32/api//upnphost/nf-upnphost-iupnpremoteendpointinfo-getdwordvalue
     */
    GetDwordValue(bstrValueName) {
        bstrValueName := bstrValueName is String ? BSTR.Alloc(bstrValueName).Value : bstrValueName

        result := ComCall(3, this, "ptr", bstrValueName, "uint*", &pdwValue := 0, "HRESULT")
        return pdwValue
    }

    /**
     * The GetStringValue method gets a string that provides information about either a request or requester.
     * @param {BSTR} bstrValueName String that specifies the category of information to be retrieved.
     * @returns {BSTR} Pointer to a string, the meaning of which depends on the value of <i>bstrValueName</i>.
     * 
     * If <i>bstrValueName</i> is "RemoteAddress", the string is the requester's IP address.<b>Windows 7:  </b>To retrieve the HTTP UserAgent header, set <i>bstrValueName</i> to "HttpUserAgent".
     * @see https://docs.microsoft.com/windows/win32/api//upnphost/nf-upnphost-iupnpremoteendpointinfo-getstringvalue
     */
    GetStringValue(bstrValueName) {
        bstrValueName := bstrValueName is String ? BSTR.Alloc(bstrValueName).Value : bstrValueName

        pbstrValue := BSTR()
        result := ComCall(4, this, "ptr", bstrValueName, "ptr", pbstrValue, "HRESULT")
        return pbstrValue
    }

    /**
     * The GetGuidValue method currently is not supported.
     * @param {BSTR} bstrValueName Not supported.
     * @returns {Guid} Not supported.
     * @see https://docs.microsoft.com/windows/win32/api//upnphost/nf-upnphost-iupnpremoteendpointinfo-getguidvalue
     */
    GetGuidValue(bstrValueName) {
        bstrValueName := bstrValueName is String ? BSTR.Alloc(bstrValueName).Value : bstrValueName

        pguidValue := Guid()
        result := ComCall(5, this, "ptr", bstrValueName, "ptr", pguidValue, "HRESULT")
        return pguidValue
    }
}
