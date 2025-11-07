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
     * 
     * @param {ICallFrameEvents} psink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallinterceptor-registersink
     */
    RegisterSink(psink) {
        result := ComCall(7, this, "ptr", psink, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ICallFrameEvents} 
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallinterceptor-getregisteredsink
     */
    GetRegisteredSink() {
        result := ComCall(8, this, "ptr*", &ppsink := 0, "HRESULT")
        return ICallFrameEvents(ppsink)
    }
}
