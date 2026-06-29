#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\IESEvent.ahk" { IESEvent }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IESEventFactory extends IUnknown {
    /**
     * The interface identifier for IESEventFactory
     * @type {Guid}
     */
    static IID := Guid("{506a09b8-7f86-4e04-ac05-3303bfe8fc49}")

    /**
     * The class identifier for ESEventFactory
     * @type {Guid}
     */
    static CLSID := Guid("{8e8a07da-71f8-40c1-a929-5e3a868ac2c6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IESEventFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateESEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IESEventFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pServiceProvider 
     * @param {Integer} dwEventId 
     * @param {Guid} guidEventType 
     * @param {Integer} dwEventDataLength 
     * @param {Pointer<Integer>} pEventData 
     * @param {BSTR} bstrBaseUrl 
     * @param {IUnknown} pInitContext 
     * @returns {IESEvent} 
     */
    CreateESEvent(pServiceProvider, dwEventId, guidEventType, dwEventDataLength, pEventData, bstrBaseUrl, pInitContext) {
        bstrBaseUrl := bstrBaseUrl is String ? BSTR.Alloc(bstrBaseUrl).Value : bstrBaseUrl

        pEventDataMarshal := pEventData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", pServiceProvider, "uint", dwEventId, Guid, guidEventType, "uint", dwEventDataLength, pEventDataMarshal, pEventData, BSTR, bstrBaseUrl, "ptr", pInitContext, "ptr*", &ppESEvent := 0, "HRESULT")
        return IESEvent(ppESEvent)
    }

    Query(iid) {
        if (IESEventFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateESEvent := CallbackCreate(GetMethod(implObj, "CreateESEvent"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateESEvent)
    }
}
