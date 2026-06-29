#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDOMEvent.ahk" { IDOMEvent }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDocumentEvent extends IDispatch {
    /**
     * The interface identifier for IDocumentEvent
     * @type {Guid}
     */
    static IID := Guid("{305104bc-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDocumentEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        createEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDocumentEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} eventType 
     * @returns {IDOMEvent} 
     */
    createEvent(eventType) {
        eventType := eventType is String ? BSTR.Alloc(eventType).Value : eventType

        result := ComCall(7, this, BSTR, eventType, "ptr*", &ppEvent := 0, "HRESULT")
        return IDOMEvent(ppEvent)
    }

    Query(iid) {
        if (IDocumentEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.createEvent := CallbackCreate(GetMethod(implObj, "createEvent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.createEvent)
    }
}
