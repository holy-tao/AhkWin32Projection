#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRDPSRAPITransportStream.ahk" { IRDPSRAPITransportStream }
#Import ".\IRDPSRAPIAttendee.ahk" { IRDPSRAPIAttendee }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\CTRL_LEVEL.ahk" { CTRL_LEVEL }
#Import ".\IRDPSRAPIFrameBuffer.ahk" { IRDPSRAPIFrameBuffer }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRDPSRAPISharingSession.ahk" { IRDPSRAPISharingSession }

/**
 * The main object that an application must create to start a collaboration session. (IRDPSRAPISharingSession2)
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapisharingsession2
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPISharingSession2 extends IRDPSRAPISharingSession {
    /**
     * The interface identifier for IRDPSRAPISharingSession2
     * @type {Guid}
     */
    static IID := Guid("{fee4ee57-e3e8-4205-8fb0-8fd1d0675c21}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPISharingSession2 interfaces
    */
    struct Vtbl extends IRDPSRAPISharingSession.Vtbl {
        ConnectUsingTransportStream    : IntPtr
        get_FrameBuffer                : IntPtr
        SendControlLevelChangeResponse : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPISharingSession2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRDPSRAPIFrameBuffer} 
     */
    FrameBuffer {
        get => this.get_FrameBuffer()
    }

    /**
     * Connects using the specified transport stream.
     * @param {IRDPSRAPITransportStream} pStream The transport stream used for the connection.
     * @param {BSTR} bstrGroup The name of the group. The string must be unique for the session. Applications typically use the group name to separate attendees into groups that can be granted different authorization levels.
     * @param {BSTR} bstrAuthenticatedAttendeeName The name of the authenticated attendee.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession2-connectusingtransportstream
     */
    ConnectUsingTransportStream(pStream, bstrGroup, bstrAuthenticatedAttendeeName) {
        bstrGroup := bstrGroup is String ? BSTR.Alloc(bstrGroup).Value : bstrGroup
        bstrAuthenticatedAttendeeName := bstrAuthenticatedAttendeeName is String ? BSTR.Alloc(bstrAuthenticatedAttendeeName).Value : bstrAuthenticatedAttendeeName

        result := ComCall(21, this, "ptr", pStream, BSTR, bstrGroup, BSTR, bstrAuthenticatedAttendeeName, "HRESULT")
        return result
    }

    /**
     * Gets a frame buffer for this session.
     * @returns {IRDPSRAPIFrameBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession2-get_framebuffer
     */
    get_FrameBuffer() {
        result := ComCall(22, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIFrameBuffer(ppVal)
    }

    /**
     * Sends an OnControlLevelChangeResponse event.
     * @param {IRDPSRAPIAttendee} pAttendee Attendee that requests control.
     * @param {CTRL_LEVEL} RequestedLevel Level of control requested by the attendee. For possible values, see the <a href="https://docs.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-ctrl_level">CTRL_LEVEL</a> enumeration.
     * @param {Integer} ReasonCode Specifies the reason for the change.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession2-sendcontrollevelchangeresponse
     */
    SendControlLevelChangeResponse(pAttendee, RequestedLevel, ReasonCode) {
        result := ComCall(23, this, "ptr", pAttendee, CTRL_LEVEL, RequestedLevel, "int", ReasonCode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRDPSRAPISharingSession2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConnectUsingTransportStream := CallbackCreate(GetMethod(implObj, "ConnectUsingTransportStream"), flags, 4)
        this.vtbl.get_FrameBuffer := CallbackCreate(GetMethod(implObj, "get_FrameBuffer"), flags, 2)
        this.vtbl.SendControlLevelChangeResponse := CallbackCreate(GetMethod(implObj, "SendControlLevelChangeResponse"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConnectUsingTransportStream)
        CallbackFree(this.vtbl.get_FrameBuffer)
        CallbackFree(this.vtbl.SendControlLevelChangeResponse)
    }
}
