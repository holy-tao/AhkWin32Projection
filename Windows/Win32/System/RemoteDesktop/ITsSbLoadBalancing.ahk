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
     * 
     * @param {ITsSbClientConnection} pConnection 
     * @param {ITsSbLoadBalancingNotifySink} pLBSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbloadbalancing-getmostsuitabletarget
     */
    GetMostSuitableTarget(pConnection, pLBSink) {
        result := ComCall(5, this, "ptr", pConnection, "ptr", pLBSink, "HRESULT")
        return result
    }
}
