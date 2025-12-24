#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing query and configuration operations on a LUN with MPIO extensions.
 * @remarks
 * 
 * If your provider is an iSCSI provider, or if your provider does not support MPIO, you should not implement the <b>IVdsLunMpio</b> interface. If an iSCSI provider implements this interface, VDS will ignore it, because VDS uses the service's own routines to handle MPIO for iSCSI.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdslunmpio
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsLunMpio extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsLunMpio
     * @type {Guid}
     */
    static IID => Guid("{7c5fbae3-333a-48a1-a982-33c15788cde3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPathInfo", "GetLoadBalancePolicy", "SetLoadBalancePolicy", "GetSupportedLbPolicies"]

    /**
     * Returns an array of VDS_PATH_INFO structures, one for each path to the LUN.
     * @param {Pointer<Pointer<VDS_PATH_INFO>>} ppPaths The address of a variable that receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_path_info">VDS_PATH_INFO</a> structures. Callers must free each element in the array, and the array itself, by using 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Integer>} plNumberOfPaths The address of a variable that receives the number of elements in the array returned in the 
     *       <i>ppPaths</i> parameter.
     *       
     * 
     * The number of paths returned by this method will match the number of paths returned by the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslunmpio-getloadbalancepolicy">IVdsLunMpio::GetLoadBalancePolicy</a> 
     *        method.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The path information was successfully returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache of the provider is corrupted. This indicates a software or communication problem inside a 
     *         provider that caches information about the attached devices. The caller can use the 
     *         <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the  <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> 
     *         method to restore the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_OBJECT_DELETED</b></b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_OBJECT_STATUS_FAILED</b></b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN is in a failed state and is unable to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress. This operation cannot proceed until previous operations are 
     *         complete.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslunmpio-getpathinfo
     */
    GetPathInfo(ppPaths, plNumberOfPaths) {
        ppPathsMarshal := ppPaths is VarRef ? "ptr*" : "ptr"
        plNumberOfPathsMarshal := plNumberOfPaths is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, ppPathsMarshal, ppPaths, plNumberOfPathsMarshal, plNumberOfPaths, "HRESULT")
        return result
    }

    /**
     * Returns the current load balance policy on the LUN.
     * @param {Pointer<Integer>} pPolicy A pointer to a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_loadbalance_policy_enum">VDS_LOADBALANCE_POLICY_ENUM</a> enumeration value that specifies the load balance policy.
     * @param {Pointer<Pointer<VDS_PATH_POLICY>>} ppPaths A pointer to the array of <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_path_policy">VDS_PATH_POLICY</a> structures passed in by the caller. Callers must free this array by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Integer>} plNumberOfPaths A pointer to a variable that receives the number of path-specific policy information structures returned in the 
     *       <i>ppPaths</i> parameter.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The load balance policy was successfully returned. If the LUN has no paths, the array is empty, the value 
     *         pointed to by the  <i>plNumberOfPaths</i> parameter is set to 0, and the value pointed to 
     *         by the <i>ppPaths</i> parameter is set to <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache of the provider is corrupted. This indicates a software or communication problem inside a 
     *         provider that caches information about the attached devices. The caller can use the 
     *         <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the  <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> 
     *         method to  restore the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_OBJECT_DELETED</b></b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_OBJECT_STATUS_FAILED</b></b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN is in a failed state and is unable to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress. This operation cannot proceed until previous operations are 
     *         complete.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslunmpio-getloadbalancepolicy
     */
    GetLoadBalancePolicy(pPolicy, ppPaths, plNumberOfPaths) {
        pPolicyMarshal := pPolicy is VarRef ? "int*" : "ptr"
        ppPathsMarshal := ppPaths is VarRef ? "ptr*" : "ptr"
        plNumberOfPathsMarshal := plNumberOfPaths is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pPolicyMarshal, pPolicy, ppPathsMarshal, ppPaths, plNumberOfPathsMarshal, plNumberOfPaths, "HRESULT")
        return result
    }

    /**
     * Sets the load balance policy on the LUN.
     * @param {Integer} policy The load balance policy enumerated by the  
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_loadbalance_policy_enum">VDS_LOADBALANCE_POLICY_ENUM</a> enumeration.
     * @param {Pointer<VDS_PATH_POLICY>} pPaths A 
     *       pointer to an array of members of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_path_policy">VDS_PATH_POLICY</a> structure 
     *       that contain the path-specific policy information.
     * @param {Integer} lNumberOfPaths The number of members of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_path_policy">VDS_PATH_POLICY</a> structure in the array 
     *       pointed to by the <i>pPaths</i> parameter.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The load balance policy was successfully set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache of the provider is corrupted. This indicates a software or communication problem inside a provider 
     *         that caches information about the attached devices. The caller can use the 
     *         <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the  <a href="/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> method to 
     *         restore the cache.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_OBJECT_DELETED</b></b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_OBJECT_STATUS_FAILED</b></b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The LUN is in a failed state and is unable to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress. This operation cannot proceed until previous operations are complete.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslunmpio-setloadbalancepolicy
     */
    SetLoadBalancePolicy(policy, pPaths, lNumberOfPaths) {
        result := ComCall(5, this, "int", policy, "ptr", pPaths, "int", lNumberOfPaths, "HRESULT")
        return result
    }

    /**
     * Retrieves the load balance policies that are supported by the hardware provider.
     * @returns {Integer} The address of a <b>ULONG</b> that will receive the supported flags (as enumerated by 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_provider_lbsupport_flag">VDS_PROVIDER_LBSUPPORT_FLAG</a> enumeration.)
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdslunmpio-getsupportedlbpolicies
     */
    GetSupportedLbPolicies() {
        result := ComCall(6, this, "uint*", &pulLbFlags := 0, "HRESULT")
        return pulLbFlags
    }
}
