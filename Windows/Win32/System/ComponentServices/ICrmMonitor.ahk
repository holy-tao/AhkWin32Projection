#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICrmMonitorClerks.ahk" { ICrmMonitorClerks }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Captures a snapshot of the current state of the CRM and holds a specific CRM clerk.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icrmmonitor
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ICrmMonitor extends IUnknown {
    /**
     * The interface identifier for ICrmMonitor
     * @type {Guid}
     */
    static IID := Guid("{70c8e443-c7ed-11d1-82fb-00a0c91eede9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICrmMonitor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetClerks : IntPtr
        HoldClerk : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICrmMonitor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a clerk collection object, which is a snapshot of the current state of the clerks.
     * @returns {ICrmMonitorClerks} An <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icrmmonitorclerks">ICrmMonitorClerks</a> pointer to a clerks collection object.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitor-getclerks
     */
    GetClerks() {
        result := ComCall(3, this, "ptr*", &pClerks := 0, "HRESULT")
        return ICrmMonitorClerks(pClerks)
    }

    /**
     * Retrieves a pointer on the specified clerk.
     * @param {VARIANT} Index A <b>VARIANT</b> string containing the instance CLSID of the required CRM clerk.
     * @returns {VARIANT} A <b>VARIANT</b> <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer returning the interface to the specified CRM clerk.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icrmmonitor-holdclerk
     */
    HoldClerk(Index) {
        pItem := VARIANT()
        result := ComCall(4, this, VARIANT, Index, VARIANT.Ptr, pItem, "HRESULT")
        return pItem
    }

    Query(iid) {
        if (ICrmMonitor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClerks := CallbackCreate(GetMethod(implObj, "GetClerks"), flags, 2)
        this.vtbl.HoldClerk := CallbackCreate(GetMethod(implObj, "HoldClerk"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClerks)
        CallbackFree(this.vtbl.HoldClerk)
    }
}
