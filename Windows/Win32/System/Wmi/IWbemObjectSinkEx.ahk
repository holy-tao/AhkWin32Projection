#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWbemObjectSink.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/wbemcli/nf-wbemcli-iwbemobjectsink-indicate
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemObjectSinkEx extends IWbemObjectSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemObjectSinkEx
     * @type {Guid}
     */
    static IID => Guid("{e7d35cfa-348b-485e-b524-252725d697ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WriteMessage", "WriteError", "PromptUser", "WriteProgress", "WriteStreamParameter"]

    /**
     * TBD (IWbemObjectSinkEx.WriteMessage)
     * @param {Integer} uChannel 
     * @param {BSTR} strMessage 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemcli/nf-wbemcli-iwbemobjectsinkex-writemessage
     */
    WriteMessage(uChannel, strMessage) {
        if(strMessage is String) {
            pin := BSTR.Alloc(strMessage)
            strMessage := pin.Value
        }

        result := ComCall(5, this, "uint", uChannel, "ptr", strMessage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * TBD (IWbemObjectSinkEx.WriteError)
     * @param {IWbemClassObject} pObjError 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemcli/nf-wbemcli-iwbemobjectsinkex-writeerror
     */
    WriteError(pObjError) {
        result := ComCall(6, this, "ptr", pObjError, "char*", &puReturned := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puReturned
    }

    /**
     * TBD (IWbemObjectSinkEx.PromptUser)
     * @param {BSTR} strMessage 
     * @param {Integer} uPromptType 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemcli/nf-wbemcli-iwbemobjectsinkex-promptuser
     */
    PromptUser(strMessage, uPromptType) {
        if(strMessage is String) {
            pin := BSTR.Alloc(strMessage)
            strMessage := pin.Value
        }

        result := ComCall(7, this, "ptr", strMessage, "char", uPromptType, "char*", &puReturned := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puReturned
    }

    /**
     * TBD (IWbemObjectSinkEx.WriteProgress)
     * @param {BSTR} strActivity 
     * @param {BSTR} strCurrentOperation 
     * @param {BSTR} strStatusDescription 
     * @param {Integer} uPercentComplete 
     * @param {Integer} uSecondsRemaining 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemcli/nf-wbemcli-iwbemobjectsinkex-writeprogress
     */
    WriteProgress(strActivity, strCurrentOperation, strStatusDescription, uPercentComplete, uSecondsRemaining) {
        if(strActivity is String) {
            pin := BSTR.Alloc(strActivity)
            strActivity := pin.Value
        }
        if(strCurrentOperation is String) {
            pin := BSTR.Alloc(strCurrentOperation)
            strCurrentOperation := pin.Value
        }
        if(strStatusDescription is String) {
            pin := BSTR.Alloc(strStatusDescription)
            strStatusDescription := pin.Value
        }

        result := ComCall(8, this, "ptr", strActivity, "ptr", strCurrentOperation, "ptr", strStatusDescription, "uint", uPercentComplete, "uint", uSecondsRemaining, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * TBD (IWbemObjectSinkEx.WriteStreamParameter)
     * @param {BSTR} strName 
     * @param {Pointer<VARIANT>} vtValue 
     * @param {Integer} ulType 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemcli/nf-wbemcli-iwbemobjectsinkex-writestreamparameter
     */
    WriteStreamParameter(strName, vtValue, ulType, ulFlags) {
        if(strName is String) {
            pin := BSTR.Alloc(strName)
            strName := pin.Value
        }

        result := ComCall(9, this, "ptr", strName, "ptr", vtValue, "uint", ulType, "uint", ulFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
