#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemObjectSink interface creates a sink interface that can receive all types of notifications within the WMI programming model.
 * @remarks
 * When implementing an event subscription sink (<b>IWbemObjectSink</b> or <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemeventsink">IWbemEventSink</a>), do  not call into WMI from within the <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">Indicate</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">SetStatus</a> methods on the sink object.  For example, calling <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-cancelasynccall">IWbemServices::CancelAsyncCall</a> to cancel the sink  from within an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">Indicate</a> can interfere with the WMI state. To cancel an event subscription, set a flag and call <b>IWbemServices::CancelAsyncCall</b> from another thread or object. For implementations that are not related to an event sink, such as object, enum, and query retrievals, you can call back into WMI.
 * 
 * Sink implementations should process the event notification within 100 MSEC because the WMI thread that delivers the event notification cannot do other work until the sink object has completed processing. If the notification requires a large amount of processing, the sink can use an internal queue for another thread to handle the processing.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iwbemobjectsink
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemObjectSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemObjectSink
     * @type {Guid}
     */
    static IID => Guid("{7c857801-7381-11cf-884d-00aa004b2e24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Indicate", "SetStatus"]

    /**
     * Called by a source to provide a notification.
     * @remarks
     * When implementing an event subscription sink (<a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a> or <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemeventsink">IWbemEventSink</a>), do  not call into WMI from within the <b>Indicate</b>  method on the sink object.  For example, calling <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-cancelasynccall">IWbemServices::CancelAsyncCall</a>  from within an implementation of <b>Indicate</b> can interfere with the WMI state. To cancel an event subscription, set a flag and call <b>IWbemServices::CancelAsyncCall</b> from another thread or object. For implementations that are not related to an event sink, such as object, enum, and query retrievals, you can call back into WMI.
     * 
     * Sink implementations should process the event notification within 100 MSEC because the WMI thread that delivers the event notification cannot do other work until the sink object has completed processing. If the notification requires a large amount of processing, the sink can use an internal queue for another thread to handle the processing.
     * 
     * When an event provider calls 
     * <b>Indicate</b> to provide an event, the call can fail with <b>WBEM_E_SERVER_TOO_BUSY</b>. The provider can choose to respond to this message by re-firing the event.
     * 
     * <div class="alert"><b>Note</b>  Because the callback to the sink might not be returned at the same authentication level as the client requires, it is recommended that you use semisynchronous instead of asynchronous communication.  For more information, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.</div>
     * <div> </div>
     * @param {Integer} lObjectCount Number of objects in the following array of pointers.
     * @param {Pointer<IWbemClassObject>} apObjArray Array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> interfaces. The array memory itself is read-only, and is owned by the caller of the method. Because this is an in parameter, the implementation has the option of calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IWbemClassObject::AddRef</a> on any object pointer in the array and holding it before returning if the objects will be used after the method has returned, in accordance with COM rules. If the objects are only used for the duration of the 
     * <b>Indicate</b> call, then you do not need to call <b>AddRef</b> on each object pointer.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate
     */
    Indicate(lObjectCount, apObjArray) {
        result := ComCall(3, this, "int", lObjectCount, "ptr*", apObjArray, "HRESULT")
        return result
    }

    /**
     * Called by sources to indicate the end of a notification sequence, or to send other status codes to the sink.
     * @remarks
     * When implementing an event subscription sink (<a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a> or <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemeventsink">IWbemEventSink</a>), do  not call into WMI from within the <b>SetStatus</b>  method on the sink object.  For example, calling <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-cancelasynccall">IWbemServices::CancelAsyncCall</a>  from within an implementation of <b>SetStatus</b> can interfere with the WMI state. To cancel an event subscription, set a flag and call <b>IWbemServices::CancelAsyncCall</b> from another thread or object. For implementations that are not related to an event sink, such as object, enum, and query retrievals, you can call back into WMI.
     * 
     * Sink implementations should process the event notification within 100 MSEC because the WMI thread that delivers the event notification cannot do other work until the sink object has completed processing. If the notification requires a large amount of processing, the sink can use an internal queue for another thread to handle the processing. For implementations that are not related to an event sink, such as object, enum, and query retrievals, you can call back into WMI.
     * 
     * To receive intermediate status updates through the client's implementation of <b>SetStatus</b>, you must specify <b>WBEM_FLAG_SENT_STATUS</b> in your call to a provider/service method. The exact status can be determined by examining the HIWORD and LOWORD values of <i>hResult</i> separately. The LOWORD (<i>hResult</i>) value contains the amount of progress that has been made so far and the HIWORD (<i>hResult</i>) value contains the total.
     * 
     * If you do not specify <b>WBEM_FLAG_SEND_STATUS</b> when calling your provider or service method, you are guaranteed to receive one and only one call to 
     * <b>SetStatus</b>.
     * @param {Integer} lFlags Bitmask of status information. The status of the operation can be obtained by examining the <i>hResult</i> parameter.
     * @param {HRESULT} _hResult 
     * @param {BSTR} strParam Receives a pointer to a read-only <b>BSTR</b>, if the original asynchronous operation returns a string. For example, when using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putinstanceasync">PutInstanceAsync</a>, 
     * <b>SetStatus</b> is called with this parameter set to the object path of the newly created instance.
     * @param {IWbemClassObject} pObjParam In cases where a complex error or status object is returned, this contains a pointer to the error object. If the object is required after 
     * <b>SetStatus</b> returns, the called object must use the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the pointer before the called object returns.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus
     */
    SetStatus(lFlags, _hResult, strParam, pObjParam) {
        strParam := strParam is String ? BSTR.Alloc(strParam).Value : strParam

        result := ComCall(4, this, "int", lFlags, "int", _hResult, "ptr", strParam, "ptr", pObjParam, "HRESULT")
        return result
    }
}
