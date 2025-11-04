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
     * 
     * @param {Pointer<Pointer<VDS_PATH_INFO>>} ppPaths 
     * @param {Pointer<Integer>} plNumberOfPaths 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunmpio-getpathinfo
     */
    GetPathInfo(ppPaths, plNumberOfPaths) {
        ppPathsMarshal := ppPaths is VarRef ? "ptr*" : "ptr"
        plNumberOfPathsMarshal := plNumberOfPaths is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, ppPathsMarshal, ppPaths, plNumberOfPathsMarshal, plNumberOfPaths, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPolicy 
     * @param {Pointer<Pointer<VDS_PATH_POLICY>>} ppPaths 
     * @param {Pointer<Integer>} plNumberOfPaths 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunmpio-getloadbalancepolicy
     */
    GetLoadBalancePolicy(pPolicy, ppPaths, plNumberOfPaths) {
        pPolicyMarshal := pPolicy is VarRef ? "int*" : "ptr"
        ppPathsMarshal := ppPaths is VarRef ? "ptr*" : "ptr"
        plNumberOfPathsMarshal := plNumberOfPaths is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pPolicyMarshal, pPolicy, ppPathsMarshal, ppPaths, plNumberOfPathsMarshal, plNumberOfPaths, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} policy 
     * @param {Pointer<VDS_PATH_POLICY>} pPaths 
     * @param {Integer} lNumberOfPaths 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunmpio-setloadbalancepolicy
     */
    SetLoadBalancePolicy(policy, pPaths, lNumberOfPaths) {
        result := ComCall(5, this, "int", policy, "ptr", pPaths, "int", lNumberOfPaths, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulLbFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunmpio-getsupportedlbpolicies
     */
    GetSupportedLbPolicies(pulLbFlags) {
        pulLbFlagsMarshal := pulLbFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulLbFlagsMarshal, pulLbFlags, "HRESULT")
        return result
    }
}
