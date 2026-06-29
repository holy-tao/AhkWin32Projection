#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSMQCollection.ahk" { IMSMQCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSMQManagement.ahk" { IMSMQManagement }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQOutgoingQueueManagement extends IMSMQManagement {
    /**
     * The interface identifier for IMSMQOutgoingQueueManagement
     * @type {Guid}
     */
    static IID := Guid("{64c478fb-f9b0-4695-8a7f-439ac94326d3}")

    /**
     * The class identifier for MSMQOutgoingQueueManagement
     * @type {Guid}
     */
    static CLSID := Guid("{0188401c-247a-4fed-99c6-bf14119d7055}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQOutgoingQueueManagement interfaces
    */
    struct Vtbl extends IMSMQManagement.Vtbl {
        get_State      : IntPtr
        get_NextHops   : IntPtr
        EodGetSendInfo : IntPtr
        Resume         : IntPtr
        Pause          : IntPtr
        EodResend      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQOutgoingQueueManagement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {VARIANT} 
     */
    NextHops {
        get => this.get_NextHops()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(16, this, "int*", &plState := 0, "HRESULT")
        return plState
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_NextHops() {
        pvNextHops := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, pvNextHops, "HRESULT")
        return pvNextHops
    }

    /**
     * 
     * @returns {IMSMQCollection} 
     */
    EodGetSendInfo() {
        result := ComCall(18, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IMSMQCollection(ppCollection)
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/pause-method
     */
    Pause() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EodResend() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSMQOutgoingQueueManagement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_NextHops := CallbackCreate(GetMethod(implObj, "get_NextHops"), flags, 2)
        this.vtbl.EodGetSendInfo := CallbackCreate(GetMethod(implObj, "EodGetSendInfo"), flags, 2)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 1)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 1)
        this.vtbl.EodResend := CallbackCreate(GetMethod(implObj, "EodResend"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_NextHops)
        CallbackFree(this.vtbl.EodGetSendInfo)
        CallbackFree(this.vtbl.Resume)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.EodResend)
    }
}
