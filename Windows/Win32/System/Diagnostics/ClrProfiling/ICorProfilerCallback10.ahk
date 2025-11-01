#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerCallback9.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerCallback10 extends ICorProfilerCallback9{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerCallback10
     * @type {Guid}
     */
    static IID => Guid("{cec5b60e-c69c-495f-87f6-84d28ee16ffb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 95

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EventPipeEventDelivered", "EventPipeProviderCreated"]

    /**
     * 
     * @param {Pointer} provider 
     * @param {Integer} eventId 
     * @param {Integer} eventVersion 
     * @param {Integer} cbMetadataBlob 
     * @param {Pointer<Integer>} metadataBlob 
     * @param {Integer} cbEventData 
     * @param {Pointer<Integer>} eventData 
     * @param {Pointer<Guid>} pActivityId 
     * @param {Pointer<Guid>} pRelatedActivityId 
     * @param {Pointer} eventThread 
     * @param {Integer} numStackFrames 
     * @param {Pointer<Pointer>} stackFrames 
     * @returns {HRESULT} 
     */
    EventPipeEventDelivered(provider, eventId, eventVersion, cbMetadataBlob, metadataBlob, cbEventData, eventData, pActivityId, pRelatedActivityId, eventThread, numStackFrames, stackFrames) {
        result := ComCall(95, this, "ptr", provider, "uint", eventId, "uint", eventVersion, "uint", cbMetadataBlob, "char*", metadataBlob, "uint", cbEventData, "char*", eventData, "ptr", pActivityId, "ptr", pRelatedActivityId, "ptr", eventThread, "uint", numStackFrames, "ptr*", stackFrames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} provider 
     * @returns {HRESULT} 
     */
    EventPipeProviderCreated(provider) {
        result := ComCall(96, this, "ptr", provider, "HRESULT")
        return result
    }
}
