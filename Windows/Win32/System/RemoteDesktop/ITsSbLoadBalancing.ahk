#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITsSbLoadBalancingNotifySink.ahk" { ITsSbLoadBalancingNotifySink }
#Import ".\ITsSbClientConnection.ahk" { ITsSbClientConnection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITsSbPlugin.ahk" { ITsSbPlugin }

/**
 * Exposes methods you can use to provide a custom load-balancing algorithm.
 * @remarks
 * A plug-in can implement this interface to provide a custom load-balancing algorithm.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbloadbalancing
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbLoadBalancing extends ITsSbPlugin {
    /**
     * The interface identifier for ITsSbLoadBalancing
     * @type {Guid}
     */
    static IID := Guid("{24329274-9eb7-11dc-ae98-f2b456d89593}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbLoadBalancing interfaces
    */
    struct Vtbl extends ITsSbPlugin.Vtbl {
        GetMostSuitableTarget : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbLoadBalancing.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines the most suitable target to which to direct an incoming client connection.
     * @remarks
     * The default load-balancing algorithm in RD Connection Broker redirects an incoming connection to the server with the 
     * fewest remote sessions. Your plug-in can use this method to override the default load-balancing algorithm. For example, you could define an algorithm that assigns connections to servers by comparing resource use on the target servers. You could also redirect the connection based on the 
     *  information in the client connection object, such as the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nf-sbtsv-itssbclientconnection-get_initialprogram">InitialProgram</a> property.
     * @param {ITsSbClientConnection} pConnection A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbclientconnection">ITsSbClientConnection</a> object. Information specific to a client connection, such as user name and 
     * farm name, can be obtained from this object.
     * @param {ITsSbLoadBalancingNotifySink} pLBSink A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbloadbalancingnotifysink">ITsSbLoadBalancingNotifySink</a> object. If the plug-in successfully determines where to redirect the connection, it should return the load balancing result by using this sink object. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbloadbalanceresult">ITsSbLoadBalanceResult</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbloadbalancing-getmostsuitabletarget
     */
    GetMostSuitableTarget(pConnection, pLBSink) {
        result := ComCall(5, this, "ptr", pConnection, "ptr", pLBSink, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbLoadBalancing.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMostSuitableTarget := CallbackCreate(GetMethod(implObj, "GetMostSuitableTarget"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMostSuitableTarget)
    }
}
