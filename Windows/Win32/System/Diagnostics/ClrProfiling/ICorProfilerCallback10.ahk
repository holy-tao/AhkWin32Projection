#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICorProfilerCallback9.ahk" { ICorProfilerCallback9 }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerCallback10 extends ICorProfilerCallback9 {
    /**
     * The interface identifier for ICorProfilerCallback10
     * @type {Guid}
     */
    static IID := Guid("{cec5b60e-c69c-495f-87f6-84d28ee16ffb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerCallback10 interfaces
    */
    struct Vtbl extends ICorProfilerCallback9.Vtbl {
        EventPipeEventDelivered  : IntPtr
        EventPipeProviderCreated : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerCallback10.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        metadataBlobMarshal := metadataBlob is VarRef ? "char*" : "ptr"
        eventDataMarshal := eventData is VarRef ? "char*" : "ptr"
        stackFramesMarshal := stackFrames is VarRef ? "ptr*" : "ptr"

        result := ComCall(95, this, "ptr", provider, "uint", eventId, "uint", eventVersion, "uint", cbMetadataBlob, metadataBlobMarshal, metadataBlob, "uint", cbEventData, eventDataMarshal, eventData, Guid.Ptr, pActivityId, Guid.Ptr, pRelatedActivityId, "ptr", eventThread, "uint", numStackFrames, stackFramesMarshal, stackFrames, "HRESULT")
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

    Query(iid) {
        if (ICorProfilerCallback10.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EventPipeEventDelivered := CallbackCreate(GetMethod(implObj, "EventPipeEventDelivered"), flags, 13)
        this.vtbl.EventPipeProviderCreated := CallbackCreate(GetMethod(implObj, "EventPipeProviderCreated"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EventPipeEventDelivered)
        CallbackFree(this.vtbl.EventPipeProviderCreated)
    }
}
