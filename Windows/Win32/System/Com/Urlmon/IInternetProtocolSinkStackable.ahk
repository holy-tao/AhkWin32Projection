#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IInternetProtocolSink.ahk" { IInternetProtocolSink }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetProtocolSinkStackable extends IUnknown {
    /**
     * The interface identifier for IInternetProtocolSinkStackable
     * @type {Guid}
     */
    static IID := Guid("{79eac9f0-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetProtocolSinkStackable interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SwitchSink     : IntPtr
        CommitSwitch   : IntPtr
        RollbackSwitch : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetProtocolSinkStackable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IInternetProtocolSink} pOIProtSink 
     * @returns {HRESULT} 
     */
    SwitchSink(pOIProtSink) {
        result := ComCall(3, this, "ptr", pOIProtSink, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CommitSwitch() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RollbackSwitch() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInternetProtocolSinkStackable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SwitchSink := CallbackCreate(GetMethod(implObj, "SwitchSink"), flags, 2)
        this.vtbl.CommitSwitch := CallbackCreate(GetMethod(implObj, "CommitSwitch"), flags, 1)
        this.vtbl.RollbackSwitch := CallbackCreate(GetMethod(implObj, "RollbackSwitch"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SwitchSink)
        CallbackFree(this.vtbl.CommitSwitch)
        CallbackFree(this.vtbl.RollbackSwitch)
    }
}
