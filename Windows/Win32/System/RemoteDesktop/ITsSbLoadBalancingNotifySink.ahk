#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITsSbBaseNotifySink.ahk" { ITsSbBaseNotifySink }
#Import ".\ITsSbLoadBalanceResult.ahk" { ITsSbLoadBalanceResult }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Exposes methods that return the result of a load-balancing algorithm to Remote Desktop Connection Broker (RD Connection Broker).
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbloadbalancingnotifysink
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbLoadBalancingNotifySink extends ITsSbBaseNotifySink {
    /**
     * The interface identifier for ITsSbLoadBalancingNotifySink
     * @type {Guid}
     */
    static IID := Guid("{5f8a8297-3244-4e6a-958a-27c822c1e141}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbLoadBalancingNotifySink interfaces
    */
    struct Vtbl extends ITsSbBaseNotifySink.Vtbl {
        OnGetMostSuitableTarget : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbLoadBalancingNotifySink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns a load-balancing result to Remote Desktop Connection Broker (RD Connection Broker).
     * @remarks
     * Your plug-in should call this method on the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbloadbalancingnotifysink">ITsSbLoadBalancingNotifySink</a> object passed to <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nf-sbtsv-itssbloadbalancing-getmostsuitabletarget">GetMostSuitableTarget</a>.
     * @param {ITsSbLoadBalanceResult} pLBResult A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbloadbalanceresult">ITsSbLoadBalanceResult</a> object that  includes the name of the target to which the connection should 
     * be redirected.
     * @param {BOOL} fIsNewConnection Indicates whether this is a new connection. <b>TRUE</b> if it is a new connection; <b>FALSE</b> otherwise.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbloadbalancingnotifysink-ongetmostsuitabletarget
     */
    OnGetMostSuitableTarget(pLBResult, fIsNewConnection) {
        result := ComCall(5, this, "ptr", pLBResult, BOOL, fIsNewConnection, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbLoadBalancingNotifySink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnGetMostSuitableTarget := CallbackCreate(GetMethod(implObj, "OnGetMostSuitableTarget"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnGetMostSuitableTarget)
    }
}
