#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumMcastScope.ahk
#Include .\IMcastLeaseInfo.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * IMcastAddressAllocation is the main interface for multicast address allocation. An application calls the COM CoCreateInstance function on this interface to create the multicast client interface object.
 * @remarks
 * 
 * The multicast COM interfaces allow access to the network's facility for allocating, renewing, and releasing leases on multicast addresses. They encapsulate a set of function and data structure definitions. The COM interfaces free the programmer from the burden of understanding and manipulating these data structures. Moreover, because TAPI 3 itself is COM-based, these interfaces make multicast address allocation accessible in a way that is consistent with the other facilities provided by TAPI 3. Applications written using Visual Basic, Java, or scripting languages must use these COM interfaces—they cannot normally access the Windows API directly.
 * 
 * In addition, this component provides seamless and transparent support for local address allocation for non-multicast environments. The <b>DWORD</b> registry value <b>HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\MCAST\LocalAllocation</b>, when set to a nonzero value, specifies that random number generation performed on the local machine is to be used for the allocation of all multicast addresses. This allows applications to function the same way on a network without a multicast address allocation server as they would on a network with a multicast address allocation server. If the registry value is set to zero or does not exist, this component performs normally as described in the rest of this specification. Note that local address allocation is never used unless this registry key is set to a nonzero value; local address allocation is not a fallback mechanism for a temporarily inaccessible multicast address allocation server.
 * 
 * Multicast address allocation is currently the subject of an IETF working group. To access current information, query on "Internet draft" and "MDHCP" or "MADCAP" using any Internet search engine. In addition to MADCAP (previously called MDHCP), the proposed architecture includes a protocol for server-to-server coordination within a domain or AS, as well as a protocol for interdomain coordination. While this architecture is currently evolving, the client need not concern itself with the details of this scheme.
 * 
 * This component currently supports only IP version 4 addresses.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nn-mdhcp-imcastaddressallocation
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IMcastAddressAllocation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMcastAddressAllocation
     * @type {Guid}
     */
    static IID => Guid("{df0daef1-a289-11d1-8697-006008b0e5d2}")

    /**
     * The class identifier for McastAddressAllocation
     * @type {Guid}
     */
    static CLSID => Guid("{df0daef2-a289-11d1-8697-006008b0e5d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Scopes", "EnumerateScopes", "RequestAddress", "RenewAddress", "ReleaseAddress", "CreateLeaseInfo", "CreateLeaseInfoFromVariant"]

    /**
     * @type {VARIANT} 
     */
    Scopes {
        get => this.get_Scopes()
    }

    /**
     * The get_Scopes method creates a collection of IMcast scopes available. This method is similar to EnumerateScopes, but is used by scripting languages such as Visual Basic.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> receiving an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nn-mdhcp-imcastscope">IMcastScope</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastaddressallocation-get_scopes
     */
    get_Scopes() {
        pVariant := VARIANT()
        result := ComCall(7, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateScopes method creates an enumeration of multicast scopes available. This method is primarily for C++ programmers. Visual Basic and other scripting languages use get_Scopes instead.
     * @returns {IEnumMcastScope} Returns a pointer to a new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nn-mdhcp-ienummcastscope">IEnumMcastScope</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastaddressallocation-enumeratescopes
     */
    EnumerateScopes() {
        result := ComCall(8, this, "ptr*", &ppEnumMcastScope := 0, "HRESULT")
        return IEnumMcastScope(ppEnumMcastScope)
    }

    /**
     * The RequestAddress method obtains a new lease for one or more multicast addresses. The EnumerateScopes or get_Scopes method must be called first.
     * @param {IMcastScope} pScope Identifies the multicast scope from which the application needs an address. The application first calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nf-mdhcp-imcastaddressallocation-get_scopes">get_Scopes</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nf-mdhcp-imcastaddressallocation-enumeratescopes">EnumerateScopes</a> to obtain a list of available scopes.
     * @param {Float} LeaseStartTime Requested time for the lease on these addresses to start. The start time that is actually granted may be different.
     * @param {Float} LeaseStopTime Requested time for the lease on these addresses to stop. The stop time that is actually granted may be different.
     * @param {Integer} NumAddresses The number of addresses requested. Fewer addresses may actually be granted.
     * @returns {IMcastLeaseInfo} Pointer to an interface pointer that will be set to point to a new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nn-mdhcp-imcastleaseinfo">IMcastLeaseInfo</a> object. This interface can then be used to discover the actual attributes of the granted lease. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nn-mdhcp-imcastscope">IMcastScope</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastaddressallocation-requestaddress
     */
    RequestAddress(pScope, LeaseStartTime, LeaseStopTime, NumAddresses) {
        result := ComCall(9, this, "ptr", pScope, "double", LeaseStartTime, "double", LeaseStopTime, "int", NumAddresses, "ptr*", &ppLeaseResponse := 0, "HRESULT")
        return IMcastLeaseInfo(ppLeaseResponse)
    }

    /**
     * The RenewAddress method renews an address lease. Call CreateLeaseInfo to specify the parameters of the renewal request, and then call this method to make the request.
     * @param {Integer} lReserved Reserved parameter. An application should pass in a value of 0.
     * @param {IMcastLeaseInfo} pRenewRequest Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nn-mdhcp-imcastleaseinfo">IMcastLeaseInfo</a> object specifying the attributes of the requested renewal, such as which address(es) to renew. This is obtained by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nf-mdhcp-imcastaddressallocation-createleaseinfo">CreateLeaseInfo</a>.
     * @returns {IMcastLeaseInfo} Pointer to an interface pointer that will be set to point to a new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nn-mdhcp-imcastleaseinfo">IMcastLeaseInfo</a> object. This interface can then be used to discover the attributes of the renewed lease. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nn-mdhcp-imcastscope">IMcastScope</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastaddressallocation-renewaddress
     */
    RenewAddress(lReserved, pRenewRequest) {
        result := ComCall(10, this, "int", lReserved, "ptr", pRenewRequest, "ptr*", &ppRenewResponse := 0, "HRESULT")
        return IMcastLeaseInfo(ppRenewResponse)
    }

    /**
     * The ReleaseAddress method releases a lease that was obtained previously.
     * @param {IMcastLeaseInfo} pReleaseRequest Pointer to the lease information interface.
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
     * The caller passed in an invalid pointer argument.
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
     * Not enough memory exists to make the request.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastaddressallocation-releaseaddress
     */
    ReleaseAddress(pReleaseRequest) {
        result := ComCall(11, this, "ptr", pReleaseRequest, "HRESULT")
        return result
    }

    /**
     * The CreateLeaseInfo method creates a lease information object for a subsequent call to RenewAddress or ReleaseAddress.
     * @param {Float} LeaseStartTime The start time of the lease.
     * @param {Float} LeaseStopTime The stop time of the lease.
     * @param {Integer} dwNumAddresses The number of addresses associated with the lease.
     * @param {Pointer<PWSTR>} ppAddresses An array of <b>LPWSTR</b> pointers of size <i>dwNumAddresses</i>. Each <b>LPWSTR</b> is an IP version 4 address in dotted quad notation (for example, 10.111.222.111).
     * @param {PWSTR} pRequestID An <b>LPWSTR</b> specifying the request ID for the original request. This is obtained by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_requestid">IMcastLeaseInfo::get_RequestID</a> on the lease information object corresponding to the original request. The request ID should be saved in persistent storage between executions of the application program. If you are renewing or releasing a lease that was requested during the same run of the application, you have no reason to use 
     * <b>CreateLeaseInfo</b>; just pass the existing 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nn-mdhcp-imcastleaseinfo">IMcastLeaseInfo</a> pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nf-mdhcp-imcastaddressallocation-renewaddress">RenewAddress</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nf-mdhcp-imcastaddressallocation-releaseaddress">ReleaseAddress</a>.
     * @param {PWSTR} pServerAddress Specifies server address.
     * @returns {IMcastLeaseInfo} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nn-mdhcp-imcastleaseinfo">IMcastLeaseInfo</a> interface created.
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastaddressallocation-createleaseinfo
     */
    CreateLeaseInfo(LeaseStartTime, LeaseStopTime, dwNumAddresses, ppAddresses, pRequestID, pServerAddress) {
        pRequestID := pRequestID is String ? StrPtr(pRequestID) : pRequestID
        pServerAddress := pServerAddress is String ? StrPtr(pServerAddress) : pServerAddress

        ppAddressesMarshal := ppAddresses is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, "double", LeaseStartTime, "double", LeaseStopTime, "uint", dwNumAddresses, ppAddressesMarshal, ppAddresses, "ptr", pRequestID, "ptr", pServerAddress, "ptr*", &ppReleaseRequest := 0, "HRESULT")
        return IMcastLeaseInfo(ppReleaseRequest)
    }

    /**
     * The CreateLeaseInfoFromVariant method creates a lease information object for a subsequent call to RenewAddress or ReleaseAddress. This method is similar to CreateLeaseInfo but is used by Automation client languages such as Visual Basic.
     * @param {Float} LeaseStartTime The start time of the lease.
     * @param {Float} LeaseStopTime The stop time of the lease.
     * @param {VARIANT} vAddresses A <b>VARIANT</b> containing a SAFEARRAY of <b>BSTR</b> strings. Each <b>BSTR</b> is an IP version 4 address in dotted quad notation (for example, 10.111.222.111).
     * @param {BSTR} pRequestID Pointer to a <b>BSTR</b> specifying the request ID for the original request. This is obtained by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nf-mdhcp-imcastleaseinfo-get_requestid">IMcastLeaseInfo::get_RequestID</a> on the lease information object corresponding to the original request. The request ID should be saved in persistent storage between executions of the application program. If you are renewing or releasing a lease that was requested during the same run of the application, you have no reason to use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nf-mdhcp-imcastaddressallocation-createleaseinfo">CreateLeaseInfo</a>; just pass the existing 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nn-mdhcp-imcastleaseinfo">IMcastLeaseInfo</a> pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nf-mdhcp-imcastaddressallocation-renewaddress">RenewAddress</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nf-mdhcp-imcastaddressallocation-releaseaddress">ReleaseAddress</a>.
     * @param {BSTR} pServerAddress Pointer to a <b>BSTR</b> specifying the server address.
     * @returns {IMcastLeaseInfo} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mdhcp/nn-mdhcp-imcastleaseinfo">IMcastLeaseInfo</a> interface created.
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastaddressallocation-createleaseinfofromvariant
     */
    CreateLeaseInfoFromVariant(LeaseStartTime, LeaseStopTime, vAddresses, pRequestID, pServerAddress) {
        pRequestID := pRequestID is String ? BSTR.Alloc(pRequestID).Value : pRequestID
        pServerAddress := pServerAddress is String ? BSTR.Alloc(pServerAddress).Value : pServerAddress

        result := ComCall(13, this, "double", LeaseStartTime, "double", LeaseStopTime, "ptr", vAddresses, "ptr", pRequestID, "ptr", pServerAddress, "ptr*", &ppReleaseRequest := 0, "HRESULT")
        return IMcastLeaseInfo(ppReleaseRequest)
    }
}
