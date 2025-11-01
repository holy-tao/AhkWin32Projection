#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {IRDPSRAPITransportStream} pStream 
     * @param {BSTR} bstrGroup 
     * @param {BSTR} bstrAuthenticatedAttendeeName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession2-connectusingtransportstream
     */
    ConnectUsingTransportStream(pStream, bstrGroup, bstrAuthenticatedAttendeeName) {
        bstrGroup := bstrGroup is String ? BSTR.Alloc(bstrGroup).Value : bstrGroup
        bstrAuthenticatedAttendeeName := bstrAuthenticatedAttendeeName is String ? BSTR.Alloc(bstrAuthenticatedAttendeeName).Value : bstrAuthenticatedAttendeeName

        result := ComCall(21, this, "ptr", pStream, "ptr", bstrGroup, "ptr", bstrAuthenticatedAttendeeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIFrameBuffer>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession2-get_framebuffer
     */
    get_FrameBuffer(ppVal) {
        result := ComCall(22, this, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRDPSRAPIAttendee} pAttendee 
     * @param {Integer} RequestedLevel 
     * @param {Integer} ReasonCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession2-sendcontrollevelchangeresponse
     */
    SendControlLevelChangeResponse(pAttendee, RequestedLevel, ReasonCode) {
        result := ComCall(23, this, "ptr", pAttendee, "int", RequestedLevel, "int", ReasonCode, "HRESULT")
        return result
    }
}
