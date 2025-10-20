#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemObjectSink interface creates a sink interface that can receive all types of notifications within the WMI programming model.
 * @remarks
 * 
  * When implementing an event subscription sink (<b>IWbemObjectSink</b> or <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemeventsink">IWbemEventSink</a>), do  not call into WMI from within the <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">Indicate</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">SetStatus</a>methods on the sink object.  For example, calling <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-cancelasynccall">IWbemServices::CancelAsyncCall</a> to cancel the sink  from within an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">Indicate</a> can interfere with the WMI state. To cancel an event subscription, set a flag and call <b>IWbemServices::CancelAsyncCall</b> from another thread or object. For implementations that are not related to an event sink, such as object, enum, and query retrievals, you can call back into WMI.
  * 
  * Sink implementations should process the event notification within 100 MSEC because the WMI thread that delivers the event notification cannot do other work until the sink object has completed processing. If the notification requires a large amount of processing, the sink can use an internal queue for another thread to handle the processing.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemobjectsink
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
     * 
     * @param {Integer} lObjectCount 
     * @param {Pointer<IWbemClassObject>} apObjArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate
     */
    Indicate(lObjectCount, apObjArray) {
        result := ComCall(3, this, "int", lObjectCount, "ptr*", apObjArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {HRESULT} hResult 
     * @param {BSTR} strParam 
     * @param {IWbemClassObject} pObjParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus
     */
    SetStatus(lFlags, hResult, strParam, pObjParam) {
        strParam := strParam is String ? BSTR.Alloc(strParam).Value : strParam

        result := ComCall(4, this, "int", lFlags, "int", hResult, "ptr", strParam, "ptr", pObjParam, "HRESULT")
        return result
    }
}
