#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRTCSessionOperationCompleteEvent.ahk" { IRTCSessionOperationCompleteEvent }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCParticipant.ahk" { IRTCParticipant }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCSessionOperationCompleteEvent2 extends IRTCSessionOperationCompleteEvent {
    /**
     * The interface identifier for IRTCSessionOperationCompleteEvent2
     * @type {Guid}
     */
    static IID := Guid("{f6fc2a9b-d5bc-4241-b436-1b8460c13832}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCSessionOperationCompleteEvent2 interfaces
    */
    struct Vtbl extends IRTCSessionOperationCompleteEvent.Vtbl {
        get_Participant             : IntPtr
        GetRemoteSessionDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCSessionOperationCompleteEvent2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRTCParticipant} 
     */
    Participant {
        get => this.get_Participant()
    }

    /**
     * 
     * @returns {IRTCParticipant} 
     */
    get_Participant() {
        result := ComCall(11, this, "ptr*", &ppParticipant := 0, "HRESULT")
        return IRTCParticipant(ppParticipant)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrContentType 
     * @param {Pointer<BSTR>} pbstrSessionDescription 
     * @returns {HRESULT} 
     */
    GetRemoteSessionDescription(pbstrContentType, pbstrSessionDescription) {
        result := ComCall(12, this, BSTR.Ptr, pbstrContentType, BSTR.Ptr, pbstrSessionDescription, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCSessionOperationCompleteEvent2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Participant := CallbackCreate(GetMethod(implObj, "get_Participant"), flags, 2)
        this.vtbl.GetRemoteSessionDescription := CallbackCreate(GetMethod(implObj, "GetRemoteSessionDescription"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Participant)
        CallbackFree(this.vtbl.GetRemoteSessionDescription)
    }
}
