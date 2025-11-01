#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastaddressallocation-get_scopes
     */
    get_Scopes(pVariant) {
        result := ComCall(7, this, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumMcastScope>} ppEnumMcastScope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastaddressallocation-enumeratescopes
     */
    EnumerateScopes(ppEnumMcastScope) {
        result := ComCall(8, this, "ptr*", ppEnumMcastScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMcastScope} pScope 
     * @param {Float} LeaseStartTime 
     * @param {Float} LeaseStopTime 
     * @param {Integer} NumAddresses 
     * @param {Pointer<IMcastLeaseInfo>} ppLeaseResponse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastaddressallocation-requestaddress
     */
    RequestAddress(pScope, LeaseStartTime, LeaseStopTime, NumAddresses, ppLeaseResponse) {
        result := ComCall(9, this, "ptr", pScope, "double", LeaseStartTime, "double", LeaseStopTime, "int", NumAddresses, "ptr*", ppLeaseResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lReserved 
     * @param {IMcastLeaseInfo} pRenewRequest 
     * @param {Pointer<IMcastLeaseInfo>} ppRenewResponse 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastaddressallocation-renewaddress
     */
    RenewAddress(lReserved, pRenewRequest, ppRenewResponse) {
        result := ComCall(10, this, "int", lReserved, "ptr", pRenewRequest, "ptr*", ppRenewResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMcastLeaseInfo} pReleaseRequest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastaddressallocation-releaseaddress
     */
    ReleaseAddress(pReleaseRequest) {
        result := ComCall(11, this, "ptr", pReleaseRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} LeaseStartTime 
     * @param {Float} LeaseStopTime 
     * @param {Integer} dwNumAddresses 
     * @param {Pointer<PWSTR>} ppAddresses 
     * @param {PWSTR} pRequestID 
     * @param {PWSTR} pServerAddress 
     * @param {Pointer<IMcastLeaseInfo>} ppReleaseRequest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastaddressallocation-createleaseinfo
     */
    CreateLeaseInfo(LeaseStartTime, LeaseStopTime, dwNumAddresses, ppAddresses, pRequestID, pServerAddress, ppReleaseRequest) {
        pRequestID := pRequestID is String ? StrPtr(pRequestID) : pRequestID
        pServerAddress := pServerAddress is String ? StrPtr(pServerAddress) : pServerAddress

        result := ComCall(12, this, "double", LeaseStartTime, "double", LeaseStopTime, "uint", dwNumAddresses, "ptr", ppAddresses, "ptr", pRequestID, "ptr", pServerAddress, "ptr*", ppReleaseRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} LeaseStartTime 
     * @param {Float} LeaseStopTime 
     * @param {VARIANT} vAddresses 
     * @param {BSTR} pRequestID 
     * @param {BSTR} pServerAddress 
     * @param {Pointer<IMcastLeaseInfo>} ppReleaseRequest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastaddressallocation-createleaseinfofromvariant
     */
    CreateLeaseInfoFromVariant(LeaseStartTime, LeaseStopTime, vAddresses, pRequestID, pServerAddress, ppReleaseRequest) {
        pRequestID := pRequestID is String ? BSTR.Alloc(pRequestID).Value : pRequestID
        pServerAddress := pServerAddress is String ? BSTR.Alloc(pServerAddress).Value : pServerAddress

        result := ComCall(13, this, "double", LeaseStartTime, "double", LeaseStopTime, "ptr", vAddresses, "ptr", pRequestID, "ptr", pServerAddress, "ptr*", ppReleaseRequest, "HRESULT")
        return result
    }
}
