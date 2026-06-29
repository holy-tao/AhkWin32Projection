#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\xa_switch_t.ahk" { xa_switch_t }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IRMHelper extends IUnknown {
    /**
     * The interface identifier for IRMHelper
     * @type {Guid}
     */
    static IID := Guid("{e793f6d1-f53d-11cf-a60d-00a0c905416e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRMHelper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RMCount : IntPtr
        RMInfo  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRMHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwcTotalNumberOfRMs 
     * @returns {HRESULT} 
     */
    RMCount(dwcTotalNumberOfRMs) {
        result := ComCall(3, this, "uint", dwcTotalNumberOfRMs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<xa_switch_t>} pXa_Switch 
     * @param {BOOL} fCDeclCallingConv 
     * @param {PSTR} pszOpenString 
     * @param {PSTR} pszCloseString 
     * @param {Guid} guidRMRecovery 
     * @returns {HRESULT} 
     */
    RMInfo(pXa_Switch, fCDeclCallingConv, pszOpenString, pszCloseString, guidRMRecovery) {
        pszOpenString := pszOpenString is String ? StrPtr(pszOpenString) : pszOpenString
        pszCloseString := pszCloseString is String ? StrPtr(pszCloseString) : pszCloseString

        result := ComCall(4, this, xa_switch_t.Ptr, pXa_Switch, BOOL, fCDeclCallingConv, "ptr", pszOpenString, "ptr", pszCloseString, Guid, guidRMRecovery, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRMHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RMCount := CallbackCreate(GetMethod(implObj, "RMCount"), flags, 2)
        this.vtbl.RMInfo := CallbackCreate(GetMethod(implObj, "RMInfo"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RMCount)
        CallbackFree(this.vtbl.RMInfo)
    }
}
