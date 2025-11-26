#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWbemEventSink.ahk
#Include .\IWbemObjectSink.ahk

/**
 * Initiates communication with an event provider using a restricted set of queries.
 * @remarks
 * 
 * When implementing an event subscription sink (<a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a> or <b>IWbemEventSink</b>), do  not call into WMI from within the  methods on the sink object.  For example, calling <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-cancelasynccall">IWbemServices::CancelAsyncCall</a> to cancel the sink  from within an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nf-wbemprov-iwbemeventsink-setsinksecurity">IWbemEventSink::SetSinkSecurity</a> can interfere with the WMI state. To cancel an event subscription, set a flag and call <b>IWbemServices::CancelAsyncCall</b> from another thread or object. For implementations that are not related to an event sink, such as object, enum, and query retrievals, you can call back into WMI.
 * 
 * Sink implementations should process the event notification within 100 MSEC because the WMI thread that delivers the event notification cannot do other work until the sink object has completed processing. If the notification requires a large amount of processing, the sink can use an internal queue for another thread to handle the processing.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nn-wbemprov-iwbemeventsink
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemEventSink extends IWbemObjectSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemEventSink
     * @type {Guid}
     */
    static IID => Guid("{3ae0080a-7e3a-4366-bf89-0feedc931659}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSinkSecurity", "IsActive", "GetRestrictedSink", "SetBatchingParameters"]

    /**
     * Used to set a security descriptor (SD) on a sink for all the events passing through.
     * @param {Integer} lSDLength Length of security descriptor.
     * @param {Pointer<Integer>} pSD Security descriptor, DACL.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nf-wbemprov-iwbemeventsink-setsinksecurity
     */
    SetSinkSecurity(lSDLength, pSD) {
        pSDMarshal := pSD is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "int", lSDLength, pSDMarshal, pSD, "HRESULT")
        return result
    }

    /**
     * The IWbemEventSink::IsActive method is used by the provider to determine if there is interest in the events that the sink is filtering.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained withinan <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nf-wbemprov-iwbemeventsink-isactive
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
     * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nf-wbemprov-iwbemeventsink-getrestrictedsink
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
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained withinan <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nf-wbemprov-iwbemeventsink-setbatchingparameters
     */
    SetBatchingParameters(lFlags, dwMaxBufferSize, dwMaxSendLatency) {
        result := ComCall(8, this, "int", lFlags, "uint", dwMaxBufferSize, "uint", dwMaxSendLatency, "HRESULT")
        return result
    }
}
