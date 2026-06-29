#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDebugDocumentContext.ahk" { IDebugDocumentContext }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEBUG_EVENT_INFO_TYPE.ahk" { DEBUG_EVENT_INFO_TYPE }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IRemoteDebugInfoEvent110 extends IUnknown {
    /**
     * The interface identifier for IRemoteDebugInfoEvent110
     * @type {Guid}
     */
    static IID := Guid("{9ff56bb6-eb89-4c0f-8823-cc2a4c0b7f26}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRemoteDebugInfoEvent110 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEventInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRemoteDebugInfoEvent110.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DEBUG_EVENT_INFO_TYPE>} pMessageType 
     * @param {Pointer<BSTR>} pbstrMessage 
     * @param {Pointer<BSTR>} pbstrUrl 
     * @param {Pointer<IDebugDocumentContext>} ppLocation 
     * @returns {HRESULT} 
     */
    GetEventInfo(pMessageType, pbstrMessage, pbstrUrl, ppLocation) {
        pMessageTypeMarshal := pMessageType is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pMessageTypeMarshal, pMessageType, BSTR.Ptr, pbstrMessage, BSTR.Ptr, pbstrUrl, IDebugDocumentContext.Ptr, ppLocation, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRemoteDebugInfoEvent110.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEventInfo := CallbackCreate(GetMethod(implObj, "GetEventInfo"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEventInfo)
    }
}
