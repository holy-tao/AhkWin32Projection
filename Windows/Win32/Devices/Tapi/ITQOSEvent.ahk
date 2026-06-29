#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\QOS_EVENT.ahk" { QOS_EVENT }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITCallInfo.ahk" { ITCallInfo }

/**
 * The ITQOSEvent interface contains methods that retrieve the description of quality of service (QOS) events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itqosevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITQOSEvent extends IDispatch {
    /**
     * The interface identifier for ITQOSEvent
     * @type {Guid}
     */
    static IID := Guid("{cfa3357c-ad77-11d1-bb68-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITQOSEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Call      : IntPtr
        get_Event     : IntPtr
        get_MediaType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITQOSEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ITCallInfo} 
     */
    Call {
        get => this.get_Call()
    }

    /**
     * @type {QOS_EVENT} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * @type {Integer} 
     */
    MediaType {
        get => this.get_MediaType()
    }

    /**
     * The get_Call method gets a pointer to the ITCallInfo interface for the call on which the QOS event occurred.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface returned by <b>tapi3.itqosevent_get_call</b>. The application must call <b>Release</b> on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface to free resources associated with it.
     * @returns {ITCallInfo} Points to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itqosevent-get_call
     */
    get_Call() {
        result := ComCall(7, this, "ptr*", &ppCall := 0, "HRESULT")
        return ITCallInfo(ppCall)
    }

    /**
     * The get_Event method gets the QOS_EVENT indicator.
     * @returns {QOS_EVENT} Indicator of the QOS event type.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itqosevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pQosEvent := 0, "HRESULT")
        return pQosEvent
    }

    /**
     * The get_MediaType method gets the media type indicator.
     * @returns {Integer} Indicates the media type for the call on which the QOS event occurred.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itqosevent-get_mediatype
     */
    get_MediaType() {
        result := ComCall(9, this, "int*", &plMediaType := 0, "HRESULT")
        return plMediaType
    }

    Query(iid) {
        if (ITQOSEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Call := CallbackCreate(GetMethod(implObj, "get_Call"), flags, 2)
        this.vtbl.get_Event := CallbackCreate(GetMethod(implObj, "get_Event"), flags, 2)
        this.vtbl.get_MediaType := CallbackCreate(GetMethod(implObj, "get_MediaType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Call)
        CallbackFree(this.vtbl.get_Event)
        CallbackFree(this.vtbl.get_MediaType)
    }
}
