#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IRTCSession2.ahk" { IRTCSession2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCParticipant.ahk" { IRTCParticipant }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCInfoEvent extends IDispatch {
    /**
     * The interface identifier for IRTCInfoEvent
     * @type {Guid}
     */
    static IID := Guid("{4e1d68ae-1912-4f49-b2c3-594fadfd425f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCInfoEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Session     : IntPtr
        get_Participant : IntPtr
        get_Info        : IntPtr
        get_InfoHeader  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCInfoEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRTCSession2} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * @type {IRTCParticipant} 
     */
    Participant {
        get => this.get_Participant()
    }

    /**
     * @type {BSTR} 
     */
    Info {
        get => this.get_Info()
    }

    /**
     * @type {BSTR} 
     */
    InfoHeader {
        get => this.get_InfoHeader()
    }

    /**
     * 
     * @returns {IRTCSession2} 
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppSession := 0, "HRESULT")
        return IRTCSession2(ppSession)
    }

    /**
     * 
     * @returns {IRTCParticipant} 
     */
    get_Participant() {
        result := ComCall(8, this, "ptr*", &ppParticipant := 0, "HRESULT")
        return IRTCParticipant(ppParticipant)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Info() {
        pbstrInfo := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrInfo, "HRESULT")
        return pbstrInfo
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_InfoHeader() {
        pbstrInfoHeader := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrInfoHeader, "HRESULT")
        return pbstrInfoHeader
    }

    Query(iid) {
        if (IRTCInfoEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Session := CallbackCreate(GetMethod(implObj, "get_Session"), flags, 2)
        this.vtbl.get_Participant := CallbackCreate(GetMethod(implObj, "get_Participant"), flags, 2)
        this.vtbl.get_Info := CallbackCreate(GetMethod(implObj, "get_Info"), flags, 2)
        this.vtbl.get_InfoHeader := CallbackCreate(GetMethod(implObj, "get_InfoHeader"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Session)
        CallbackFree(this.vtbl.get_Participant)
        CallbackFree(this.vtbl.get_Info)
        CallbackFree(this.vtbl.get_InfoHeader)
    }
}
