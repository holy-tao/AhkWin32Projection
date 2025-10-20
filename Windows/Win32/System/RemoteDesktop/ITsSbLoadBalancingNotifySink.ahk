#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITsSbBaseNotifySink.ahk

/**
 * Exposes methods that return the result of a load-balancing algorithm to Remote Desktop Connection Broker (RD Connection Broker).
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbloadbalancingnotifysink
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbLoadBalancingNotifySink extends ITsSbBaseNotifySink{
    /**
     * The interface identifier for ITsSbLoadBalancingNotifySink
     * @type {Guid}
     */
    static IID => Guid("{5f8a8297-3244-4e6a-958a-27c822c1e141}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<ITsSbLoadBalanceResult>} pLBResult 
     * @param {BOOL} fIsNewConnection 
     * @returns {HRESULT} 
     */
    OnGetMostSuitableTarget(pLBResult, fIsNewConnection) {
        result := ComCall(5, this, "ptr", pLBResult, "int", fIsNewConnection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
