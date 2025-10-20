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
     * 
     * @param {Pointer<VDS_PATH_INFO>} ppPaths 
     * @param {Pointer<Int32>} plNumberOfPaths 
     * @returns {HRESULT} 
     */
    GetPathInfo(ppPaths, plNumberOfPaths) {
        result := ComCall(3, this, "ptr", ppPaths, "int*", plNumberOfPaths, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPolicy 
     * @param {Pointer<VDS_PATH_POLICY>} ppPaths 
     * @param {Pointer<Int32>} plNumberOfPaths 
     * @returns {HRESULT} 
     */
    GetLoadBalancePolicy(pPolicy, ppPaths, plNumberOfPaths) {
        result := ComCall(4, this, "int*", pPolicy, "ptr", ppPaths, "int*", plNumberOfPaths, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} policy 
     * @param {Pointer<VDS_PATH_POLICY>} pPaths 
     * @param {Integer} lNumberOfPaths 
     * @returns {HRESULT} 
     */
    SetLoadBalancePolicy(policy, pPaths, lNumberOfPaths) {
        result := ComCall(5, this, "int", policy, "ptr", pPaths, "int", lNumberOfPaths, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulLbFlags 
     * @returns {HRESULT} 
     */
    GetSupportedLbPolicies(pulLbFlags) {
        result := ComCall(6, this, "uint*", pulLbFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
