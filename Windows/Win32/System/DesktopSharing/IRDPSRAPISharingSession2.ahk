#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRDPSRAPIFrameBuffer.ahk
#Include .\IRDPSRAPISharingSession.ahk

/**
 * The main object that an application must create to start a collaboration session.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapisharingsession2
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPISharingSession2 extends IRDPSRAPISharingSession{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPISharingSession2
     * @type {Guid}
     */
    static IID => Guid("{fee4ee57-e3e8-4205-8fb0-8fd1d0675c21}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectUsingTransportStream", "get_FrameBuffer", "SendControlLevelChangeResponse"]

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
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession2-connectusingtransportstream
     */
    ConnectUsingTransportStream(pStream, bstrGroup, bstrAuthenticatedAttendeeName) {
        bstrGroup := bstrGroup is String ? BSTR.Alloc(bstrGroup).Value : bstrGroup
        bstrAuthenticatedAttendeeName := bstrAuthenticatedAttendeeName is String ? BSTR.Alloc(bstrAuthenticatedAttendeeName).Value : bstrAuthenticatedAttendeeName

        result := ComCall(21, this, "ptr", pStream, "ptr", bstrGroup, "ptr", bstrAuthenticatedAttendeeName, "HRESULT")
        return result
    }

    /**
     * Gets a frame buffer for this session.
     * @returns {IRDPSRAPIFrameBuffer} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession2-get_framebuffer
     */
    get_FrameBuffer() {
        result := ComCall(22, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIFrameBuffer(ppVal)
    }

    /**
     * Sends an OnControlLevelChangeResponse event.
     * @param {IRDPSRAPIAttendee} pAttendee Attendee that requests control.
     * @param {Integer} RequestedLevel Level of control requested by the attendee. For possible values, see the <a href="https://docs.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-ctrl_level">CTRL_LEVEL</a> enumeration.
     * @param {Integer} ReasonCode Specifies the reason for the change.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession2-sendcontrollevelchangeresponse
     */
    SendControlLevelChangeResponse(pAttendee, RequestedLevel, ReasonCode) {
        result := ComCall(23, this, "ptr", pAttendee, "int", RequestedLevel, "int", ReasonCode, "HRESULT")
        return result
    }
}
