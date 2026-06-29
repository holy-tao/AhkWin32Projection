#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDVB_EIT2.ahk" { IDVB_EIT2 }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ISIInbandEPGEvent extends IUnknown {
    /**
     * The interface identifier for ISIInbandEPGEvent
     * @type {Guid}
     */
    static IID := Guid("{7e47913a-5a89-423d-9a2b-e15168858934}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISIInbandEPGEvent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SIObjectEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISIInbandEPGEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDVB_EIT2} pIDVB_EIT 
     * @param {Integer} dwTable_ID 
     * @param {Integer} dwService_ID 
     * @returns {HRESULT} 
     */
    SIObjectEvent(pIDVB_EIT, dwTable_ID, dwService_ID) {
        result := ComCall(3, this, "ptr", pIDVB_EIT, "uint", dwTable_ID, "uint", dwService_ID, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISIInbandEPGEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SIObjectEvent := CallbackCreate(GetMethod(implObj, "SIObjectEvent"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SIObjectEvent)
    }
}
