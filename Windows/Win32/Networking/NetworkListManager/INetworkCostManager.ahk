#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\NLM_DATAPLAN_STATUS.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to query for machine-wide cost and data plan status information associated with either a connection used for machine-wide Internet connectivity, or the first-hop of routing to a specific destination on a connection.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-inetworkcostmanager
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetworkCostManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkCostManager
     * @type {Guid}
     */
    static IID => Guid("{dcb00008-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCost", "GetDataPlanStatus", "SetDestinationAddresses"]

    /**
     * GetCost method retrieves the current cost of either a machine-wide internet connection, or the first-hop of routing to a specific destination on a connection.
     * @param {Pointer<NLM_SOCKADDR>} pDestIPAddr An <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ns-netlistmgr-nlm_sockaddr">NLM_SOCKADDR</a> structure containing the destination IPv4/IPv6 address. If  NULL, this method will instead return the cost associated with the preferred connection used for machine Internet connectivity.
     * @returns {Integer} A DWORD value that indicates the cost of the connection. The lowest 16 bits represent the cost level, and the highest 16 bits represent the flags. Possible values are defined by the <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ne-netlistmgr-nlm_connection_cost">NLM_CONNECTION_COST</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkcostmanager-getcost
     */
    GetCost(pDestIPAddr) {
        result := ComCall(3, this, "uint*", &pCost := 0, "ptr", pDestIPAddr, "HRESULT")
        return pCost
    }

    /**
     * GetDataPlanStatus retrieves the data plan status for either a machine-wide internet connection , or the first-hop of routing to a specific destination on a connection.
     * @param {Pointer<NLM_SOCKADDR>} pDestIPAddr An <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ns-netlistmgr-nlm_sockaddr">NLM_SOCKADDR</a> structure containing the destination IPv4/IPv6 or tunnel address. If   NULL, this method returns the cost associated with the preferred connection used for machine Internet connectivity.
     * @returns {NLM_DATAPLAN_STATUS} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ns-netlistmgr-nlm_dataplan_status">NLM_DATAPLAN_STATUS</a> structure that describes the data plan status associated with a connection used to route to a destination. If <i>destIPAddr</i> specifies a tunnel address, the first available data plan status in the interface stack is returned.
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkcostmanager-getdataplanstatus
     */
    GetDataPlanStatus(pDestIPAddr) {
        pDataPlanStatus := NLM_DATAPLAN_STATUS()
        result := ComCall(4, this, "ptr", pDataPlanStatus, "ptr", pDestIPAddr, "HRESULT")
        return pDataPlanStatus
    }

    /**
     * SetDestinationAddresses method registers specified destination IPv4/IPv6 addresses to receive cost or data plan status change notifications.
     * @param {Integer} length The number of destination IPv4/IPv6 addresses in the list.
     * @param {Pointer<NLM_SOCKADDR>} pDestIPAddrList A <a href="https://docs.microsoft.com/windows/desktop/api/netlistmgr/ns-netlistmgr-nlm_sockaddr">NLM_SOCKADDR</a> structure containing a list of destination IPv4/IPv6 addresses to register for cost or data plan status change notification.
     * @param {VARIANT_BOOL} bAppend If true, <i>pDestIPAddrList</i> will be appended to the existing address list; otherwise the existing list will be overwritten.
     * @returns {HRESULT} Returns S_OK on success, otherwise an HRESULT error code is returned.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returned if one of the following occurs:
     * 
     * <ul>
     * <li><i>length</i> is 0.</li>
     * <li><i>length</i> is larger than NLM_MAX_ADDRESS_LIST_SIZE(10)</li>
     * <li><i>bAppend</i> is VARIANT_TRUE, but including the number of subscribed destinations in the existing list with the value of <i>length</i> exceeds NLM_MAX_ADDRESS_SIZE.</li>
     * <li>A destination address in the supplied list is invalid.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>destIPAddrList</i> is NULL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request is not supported. This error is returned if either an IPv4 or IPv6 stack is not present on the local computer but  either an IPv4 or IPv6 address was specified by<i>destIPAddr</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method was called after registering for <a href="/windows/desktop/api/netlistmgr/nn-netlistmgr-inetworkcostmanagerevents">INetworkCostManagerEvents</a> by calling <a href="/windows/desktop/api/ocidl/nf-ocidl-iconnectionpoint-advise">IConnectionPoint::Advise</a>. See Remark for more information.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nf-netlistmgr-inetworkcostmanager-setdestinationaddresses
     */
    SetDestinationAddresses(length, pDestIPAddrList, bAppend) {
        result := ComCall(5, this, "uint", length, "ptr", pDestIPAddrList, "short", bAppend, "HRESULT")
        return result
    }
}
