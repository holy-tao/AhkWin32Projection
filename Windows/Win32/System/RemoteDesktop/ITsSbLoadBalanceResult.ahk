#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods and properties that store the target name returned by a load-balancing algorithm.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbloadbalanceresult
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbLoadBalanceResult extends IUnknown {
    /**
     * The interface identifier for ITsSbLoadBalanceResult
     * @type {Guid}
     */
    static IID := Guid("{24fdb7ac-fea6-11dc-9672-9a8956d89593}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbLoadBalanceResult interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_TargetName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbLoadBalanceResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    TargetName {
        get => this.get_TargetName()
    }

    /**
     * Retrieves the target name returned by a load-balancing algorithm.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbloadbalanceresult-get_targetname
     */
    get_TargetName() {
        pVal := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    Query(iid) {
        if (ITsSbLoadBalanceResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_TargetName := CallbackCreate(GetMethod(implObj, "get_TargetName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_TargetName)
    }
}
