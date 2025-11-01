#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface to notify an application of machine-wide cost and data plan related events.
 * @see https://docs.microsoft.com/windows/win32/api//netlistmgr/nn-netlistmgr-inetworkcostmanagerevents
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class INetworkCostManagerEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkCostManagerEvents
     * @type {Guid}
     */
    static IID => Guid("{dcb00009-570f-4a9b-8d69-199fdba5723b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CostChanged", "DataPlanStatusChanged"]

    /**
     * 
     * @param {Integer} newCost 
     * @param {Pointer<NLM_SOCKADDR>} pDestAddr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkcostmanagerevents-costchanged
     */
    CostChanged(newCost, pDestAddr) {
        result := ComCall(3, this, "uint", newCost, "ptr", pDestAddr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<NLM_SOCKADDR>} pDestAddr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/nf-netlistmgr-inetworkcostmanagerevents-dataplanstatuschanged
     */
    DataPlanStatusChanged(pDestAddr) {
        result := ComCall(4, this, "ptr", pDestAddr, "HRESULT")
        return result
    }
}
