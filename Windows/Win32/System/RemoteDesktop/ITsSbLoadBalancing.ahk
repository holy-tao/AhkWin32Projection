#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITsSbPlugin.ahk

/**
 * Exposes methods you can use to provide a custom load-balancing algorithm.
 * @remarks
 * 
 * A plug-in can implement this interface to provide a custom load-balancing algorithm.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbloadbalancing
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbLoadBalancing extends ITsSbPlugin{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbLoadBalancing
     * @type {Guid}
     */
    static IID => Guid("{24329274-9eb7-11dc-ae98-f2b456d89593}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMostSuitableTarget"]

    /**
     * Determines the most suitable target to which to direct an incoming client connection.
     * @param {ITsSbClientConnection} pConnection A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbclientconnection">ITsSbClientConnection</a> object. Information specific to a client connection, such as user name and 
     * farm name, can be obtained from this object.
     * @param {ITsSbLoadBalancingNotifySink} pLBSink A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbloadbalancingnotifysink">ITsSbLoadBalancingNotifySink</a> object. If the plug-in successfully determines where to redirect the connection, it should return the load balancing result by using this sink object. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbloadbalanceresult">ITsSbLoadBalanceResult</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbloadbalancing-getmostsuitabletarget
     */
    GetMostSuitableTarget(pConnection, pLBSink) {
        result := ComCall(5, this, "ptr", pConnection, "ptr", pLBSink, "HRESULT")
        return result
    }
}
