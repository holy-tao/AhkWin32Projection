#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPrintWorkflowXpsReceiver.ahk" { IPrintWorkflowXpsReceiver }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.WinRT.Printing
 */
export default struct IPrintWorkflowXpsReceiver2 extends IPrintWorkflowXpsReceiver {
    /**
     * The interface identifier for IPrintWorkflowXpsReceiver2
     * @type {Guid}
     */
    static IID := Guid("{023bcc0c-dfab-4a61-b074-490c6995580d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintWorkflowXpsReceiver2 interfaces
    */
    struct Vtbl extends IPrintWorkflowXpsReceiver.Vtbl {
        Failed : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintWorkflowXpsReceiver2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HRESULT} XpsError 
     * @returns {HRESULT} 
     */
    Failed(XpsError) {
        result := ComCall(8, this, "int", XpsError, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintWorkflowXpsReceiver2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Failed := CallbackCreate(GetMethod(implObj, "Failed"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Failed)
    }
}
