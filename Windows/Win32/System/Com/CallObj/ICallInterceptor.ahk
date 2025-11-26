#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICallFrameEvents.ahk
#Include .\ICallIndirect.ahk

/**
 * Supports the registration and un-registering of event sinks wishing to be notified of calls made directly on the interface.
 * @see https://docs.microsoft.com/windows/win32/api//callobj/nn-callobj-icallinterceptor
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class ICallInterceptor extends ICallIndirect{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICallInterceptor
     * @type {Guid}
     */
    static IID => Guid("{60c7ca75-896d-11d2-b8b6-00c04fb9618a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterSink", "GetRegisteredSink"]

    /**
     * Registers an event sink for receiving notifications of method calls.
     * @param {ICallFrameEvents} psink A pointer to the event sink. See <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nn-callobj-icallframeevents">ICallFrameEvents</a>.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallinterceptor-registersink
     */
    RegisterSink(psink) {
        result := ComCall(7, this, "ptr", psink, "HRESULT")
        return result
    }

    /**
     * Retrieves the registered event sink.
     * @returns {ICallFrameEvents} A pointer to a pointer to the event sink. See <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nn-callobj-icallframeevents">ICallFrameEvents</a>.
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallinterceptor-getregisteredsink
     */
    GetRegisteredSink() {
        result := ComCall(8, this, "ptr*", &ppsink := 0, "HRESULT")
        return ICallFrameEvents(ppsink)
    }
}
