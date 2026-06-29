#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IConnectionPoint.ahk" { IConnectionPoint }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\DISPPARAMS.ahk" { DISPPARAMS }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct CIE4ConnectionPoint extends IConnectionPoint {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for CIE4ConnectionPoint interfaces
    */
    struct Vtbl extends IConnectionPoint.Vtbl {
        DoInvokeIE4     : IntPtr
        DoInvokePIDLIE4 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := CIE4ConnectionPoint.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<BOOL>} pf 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @param {Integer} dispid 
     * @param {Pointer<DISPPARAMS>} pdispparams 
     * @returns {HRESULT} 
     */
    DoInvokeIE4(pf, ppv, dispid, pdispparams) {
        pfMarshal := pf is VarRef ? "int*" : "ptr"
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, pfMarshal, pf, ppvMarshal, ppv, "int", dispid, DISPPARAMS.Ptr, pdispparams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dispid 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {BOOL} fCanCancel 
     * @returns {HRESULT} 
     */
    DoInvokePIDLIE4(dispid, pidl, fCanCancel) {
        result := ComCall(9, this, "int", dispid, ITEMIDLIST.Ptr, pidl, BOOL, fCanCancel, "HRESULT")
        return result
    }

    Query(iid) {
        if (CIE4ConnectionPoint.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DoInvokeIE4 := CallbackCreate(GetMethod(implObj, "DoInvokeIE4"), flags, 5)
        this.vtbl.DoInvokePIDLIE4 := CallbackCreate(GetMethod(implObj, "DoInvokePIDLIE4"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DoInvokeIE4)
        CallbackFree(this.vtbl.DoInvokePIDLIE4)
    }
}
