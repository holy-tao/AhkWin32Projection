#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SPEVENTEX.ahk" { SPEVENTEX }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpEventSource.ahk" { ISpEventSource }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpEventSource2 extends ISpEventSource {
    /**
     * The interface identifier for ISpEventSource2
     * @type {Guid}
     */
    static IID := Guid("{2373a435-6a4b-429e-a6ac-d4231a61975b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpEventSource2 interfaces
    */
    struct Vtbl extends ISpEventSource.Vtbl {
        GetEventsEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpEventSource2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<SPEVENTEX>} pEventArray 
     * @param {Pointer<Integer>} pulFetched 
     * @returns {HRESULT} 
     */
    GetEventsEx(ulCount, pEventArray, pulFetched) {
        pulFetchedMarshal := pulFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", ulCount, SPEVENTEX.Ptr, pEventArray, pulFetchedMarshal, pulFetched, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpEventSource2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEventsEx := CallbackCreate(GetMethod(implObj, "GetEventsEx"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEventsEx)
    }
}
