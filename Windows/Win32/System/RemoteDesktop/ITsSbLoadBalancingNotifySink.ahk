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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnGetMostSuitableTarget"]

    /**
     * Returns a load-balancing result to Remote Desktop Connection Broker (RD Connection Broker).
     * @param {ITsSbLoadBalanceResult} pLBResult A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbloadbalanceresult">ITsSbLoadBalanceResult</a> object that  includes the name of the target to which the connection should 
     * be redirected.
     * @param {BOOL} fIsNewConnection Indicates whether this is a new connection. <b>TRUE</b> if it is a new connection; <b>FALSE</b> otherwise.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbloadbalancingnotifysink-ongetmostsuitabletarget
     */
    OnGetMostSuitableTarget(pLBResult, fIsNewConnection) {
        result := ComCall(5, this, "ptr", pLBResult, "int", fIsNewConnection, "HRESULT")
        return result
    }
}
