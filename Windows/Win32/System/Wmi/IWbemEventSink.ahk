#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWbemObjectSink.ahk" { IWbemObjectSink }

/**
 * Initiates communication with an event provider using a restricted set of queries.
 * @remarks
 * When implementing an event subscription sink (<a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a> or <b>IWbemEventSink</b>), do  not call into WMI from within the  methods on the sink object.  For example, calling <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-cancelasynccall">IWbemServices::CancelAsyncCall</a> to cancel the sink  from within an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nf-wbemprov-iwbemeventsink-setsinksecurity">IWbemEventSink::SetSinkSecurity</a> can interfere with the WMI state. To cancel an event subscription, set a flag and call <b>IWbemServices::CancelAsyncCall</b> from another thread or object. For implementations that are not related to an event sink, such as object, enum, and query retrievals, you can call back into WMI.
 * 
 * Sink implementations should process the event notification within 100 MSEC because the WMI thread that delivers the event notification cannot do other work until the sink object has completed processing. If the notification requires a large amount of processing, the sink can use an internal queue for another thread to handle the processing.
 * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nn-wbemprov-iwbemeventsink
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemEventSink extends IWbemObjectSink {
    /**
     * The interface identifier for IWbemEventSink
     * @type {Guid}
     */
    static IID := Guid("{3ae0080a-7e3a-4366-bf89-0feedc931659}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemEventSink interfaces
    */
    struct Vtbl extends IWbemObjectSink.Vtbl {
        SetSinkSecurity       : IntPtr
        IsActive              : IntPtr
        GetRestrictedSink     : IntPtr
        SetBatchingParameters : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Used to set a security descriptor (SD) on a sink for all the events passing through.
     * @remarks
     * The SD DACL defines who has access to the events. The access control entry (ACE) of a consumer seeking access to the events delivered to the sink must match an ACE with <b>WBEM_RIGHT_SUBSCRIBE</b> set in the <i>pSD</i> parameter. The SD owner and group specify the identity to be used when raising the event. This identity can be different than the identity of the account raising the event; however, when checking access of the event against a filter SD, both the identity of the user and the identity specified in the owner field are checked for access. For more information, see the <b>EventAccess</b> property of the 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/--eventfilter">__EventFilter</a> class. The group field of the SD must be set and the SACL field is not used.  For more information about event security and when to use this method, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/securing-wmi-events">Securing WMI Events</a>.
     * 
     * For more information about providing events, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/writing-an-event-provider">Writing an Event Provider</a>.
     * @param {Integer} lSDLength Length of security descriptor.
     * @param {Pointer<Integer>} pSD Security descriptor, DACL.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemeventsink-setsinksecurity
     */
    SetSinkSecurity(lSDLength, pSD) {
        pSDMarshal := pSD is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "int", lSDLength, pSDMarshal, pSD, "HRESULT")
        return result
    }

    /**
     * The IWbemEventSink::IsActive method is used by the provider to determine if there is interest in the events that the sink is filtering.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemeventsink-isactive
     */
    IsActive() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * The IWbemEventSink::GetRestrictedSink method retrieves a restricted event sink. A restricted event sink is one which filters a subset of the events defined in the event provider's registration.
     * @param {Integer} lNumQueries Number of queries in array.
     * @param {Pointer<PWSTR>} awszQueries Array of event queries.
     * @param {IUnknown} pCallback Pointer to callback for event provider.
     * @returns {IWbemEventSink} Pointer to created 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemeventsink">IWbemEventSink</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemeventsink-getrestrictedsink
     */
    GetRestrictedSink(lNumQueries, awszQueries, pCallback) {
        awszQueriesMarshal := awszQueries is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "int", lNumQueries, awszQueriesMarshal, awszQueries, "ptr", pCallback, "ptr*", &ppSink := 0, "HRESULT")
        return IWbemEventSink(ppSink)
    }

    /**
     * The IWbemEventSink::SetBatchingParameters method is used to set the maximum event buffer size and its associated processing latency value.
     * @param {Integer} lFlags Determines batching behavior.
     * @param {Integer} dwMaxBufferSize Maximum batch buffer size. To specify maximum batch size, use MAX_INT.
     * @param {Integer} dwMaxSendLatency Maximum batch send latency. To specify infinite timeout, use <b>WBEM_INFINITE</b>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemeventsink-setbatchingparameters
     */
    SetBatchingParameters(lFlags, dwMaxBufferSize, dwMaxSendLatency) {
        result := ComCall(8, this, "int", lFlags, "uint", dwMaxBufferSize, "uint", dwMaxSendLatency, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWbemEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSinkSecurity := CallbackCreate(GetMethod(implObj, "SetSinkSecurity"), flags, 3)
        this.vtbl.IsActive := CallbackCreate(GetMethod(implObj, "IsActive"), flags, 1)
        this.vtbl.GetRestrictedSink := CallbackCreate(GetMethod(implObj, "GetRestrictedSink"), flags, 5)
        this.vtbl.SetBatchingParameters := CallbackCreate(GetMethod(implObj, "SetBatchingParameters"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSinkSecurity)
        CallbackFree(this.vtbl.IsActive)
        CallbackFree(this.vtbl.GetRestrictedSink)
        CallbackFree(this.vtbl.SetBatchingParameters)
    }
}
