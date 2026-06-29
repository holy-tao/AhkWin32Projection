#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Implements a generic event interface that can deliver and encapsulate events that are raised by devices that work with the Protected Broadcast Driver Interface (PBDA).
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-iesevent
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IESEvent extends IUnknown {
    /**
     * The interface identifier for IESEvent
     * @type {Guid}
     */
    static IID := Guid("{1f0e5357-af43-44e6-8547-654c645145d2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IESEvent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEventId          : IntPtr
        GetEventType        : IntPtr
        SetCompletionStatus : IntPtr
        GetData             : IntPtr
        GetStringData       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IESEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the unique identifier from an event that is derived from the IESEvent interface. The event identifier is contained in an IESEvent object, which ispassed in a call to IESEventService::FireESEvent.
     * @returns {Integer} Receives the event identifier.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesevent-geteventid
     */
    GetEventId() {
        result := ComCall(3, this, "uint*", &pdwEventId := 0, "HRESULT")
        return pdwEventId
    }

    /**
     * Gets the GUID that identifies an event that is derived from the IESEvent interface. The GUID is contained in an IESEvent object, which ispassed in a call to IESEventService::FireESEvent.
     * @returns {Guid} Pointer to the GUID that uniquely identifies the event type.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesevent-geteventtype
     */
    GetEventType() {
        pguidEventType := Guid()
        result := ComCall(4, this, Guid.Ptr, pguidEventType, "HRESULT")
        return pguidEventType
    }

    /**
     * Sets the completion status for an event that is derived from the IESEvent interface.
     * @param {Integer} dwResult Completion status for the event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesevent-setcompletionstatus
     */
    SetCompletionStatus(dwResult) {
        result := ComCall(5, this, "uint", dwResult, "HRESULT")
        return result
    }

    /**
     * Gets data from an event that is derived from the IESEvent interface. This method gets a byte array that contains the data in an IESEvent object, which is passed in a call to IESEventService::FireESEvent.
     * @returns {Pointer<SAFEARRAY>} Pointer to <b>SAFEARRAY</b> that receives the event data.
     *           The caller is responsible for freeing the <b>SAFEARRAY</b>.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesevent-getdata
     */
    GetData() {
        result := ComCall(6, this, "ptr*", &pbData := 0, "HRESULT")
        return pbData
    }

    /**
     * Gets the data from an event that is derived from the IESEvent interface, in Unicode string format. The data is contained in an IESEvent object, which ispassed in a call to IESEventService::FireESEvent.
     * @returns {BSTR} Pointer to a buffer that receives the data that is passed with the <b>IESEvent</b> object, in Unicode string format. The caller must release this memory.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesevent-getstringdata
     */
    GetStringData() {
        pbstrData := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrData, "HRESULT")
        return pbstrData
    }

    Query(iid) {
        if (IESEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEventId := CallbackCreate(GetMethod(implObj, "GetEventId"), flags, 2)
        this.vtbl.GetEventType := CallbackCreate(GetMethod(implObj, "GetEventType"), flags, 2)
        this.vtbl.SetCompletionStatus := CallbackCreate(GetMethod(implObj, "SetCompletionStatus"), flags, 2)
        this.vtbl.GetData := CallbackCreate(GetMethod(implObj, "GetData"), flags, 2)
        this.vtbl.GetStringData := CallbackCreate(GetMethod(implObj, "GetStringData"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEventId)
        CallbackFree(this.vtbl.GetEventType)
        CallbackFree(this.vtbl.SetCompletionStatus)
        CallbackFree(this.vtbl.GetData)
        CallbackFree(this.vtbl.GetStringData)
    }
}
