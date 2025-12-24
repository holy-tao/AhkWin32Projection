#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRDPSRAPISessionProperties.ahk
#Include .\IRDPSRAPIAttendeeManager.ahk
#Include .\IRDPSRAPIInvitationManager.ahk
#Include .\IRDPSRAPIApplicationFilter.ahk
#Include .\IRDPSRAPIVirtualChannelManager.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The main object that an application must create to start a collaboration session.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapisharingsession
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPISharingSession extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPISharingSession
     * @type {Guid}
     */
    static IID => Guid("{eeb20886-e470-4cf6-842b-2739c0ec5cfb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "put_ColorDepth", "get_ColorDepth", "get_Properties", "get_Attendees", "get_Invitations", "get_ApplicationFilter", "get_VirtualChannelManager", "Pause", "Resume", "ConnectToClient", "SetDesktopSharedRect", "GetDesktopSharedRect"]

    /**
     * @type {Integer} 
     */
    ColorDepth {
        get => this.get_ColorDepth()
        set => this.put_ColorDepth(value)
    }

    /**
     * @type {IRDPSRAPISessionProperties} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {IRDPSRAPIAttendeeManager} 
     */
    Attendees {
        get => this.get_Attendees()
    }

    /**
     * @type {IRDPSRAPIInvitationManager} 
     */
    Invitations {
        get => this.get_Invitations()
    }

    /**
     * @type {IRDPSRAPIApplicationFilter} 
     */
    ApplicationFilter {
        get => this.get_ApplicationFilter()
    }

    /**
     * @type {IRDPSRAPIVirtualChannelManager} 
     */
    VirtualChannelManager {
        get => this.get_VirtualChannelManager()
    }

    /**
     * Puts the session in an active state.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code. The following are possible values.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-open
     */
    Open() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Disconnects all attendees from the session and stops listening to incoming connections.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-close
     */
    Close() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the color depth for the shared session.
     * @param {Integer} colorDepth 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-put_colordepth
     */
    put_ColorDepth(colorDepth) {
        result := ComCall(9, this, "int", colorDepth, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the color depth for the shared session.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_colordepth
     */
    get_ColorDepth() {
        result := ComCall(10, this, "int*", &pColorDepth := 0, "HRESULT")
        return pColorDepth
    }

    /**
     * Retrieves an object implementing the IRDPSRAPISessionProperties interface.
     * @returns {IRDPSRAPISessionProperties} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_properties
     */
    get_Properties() {
        result := ComCall(11, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPISessionProperties(ppVal)
    }

    /**
     * Returns an object implementing the IRDPSRAPIAttendeeManager interface.
     * @returns {IRDPSRAPIAttendeeManager} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_attendees
     */
    get_Attendees() {
        result := ComCall(12, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIAttendeeManager(ppVal)
    }

    /**
     * Returns an object implementing the IRDPSRAPIInvitationManager interface.
     * @returns {IRDPSRAPIInvitationManager} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_invitations
     */
    get_Invitations() {
        result := ComCall(13, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIInvitationManager(ppVal)
    }

    /**
     * Returns an object implementing the IRDPSRAPIApplicationFilter interface.
     * @returns {IRDPSRAPIApplicationFilter} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_applicationfilter
     */
    get_ApplicationFilter() {
        result := ComCall(14, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIApplicationFilter(ppVal)
    }

    /**
     * Retrieves an object implementing the IRDPSRAPIVirtualChannelManager interface.
     * @returns {IRDPSRAPIVirtualChannelManager} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_virtualchannelmanager
     */
    get_VirtualChannelManager() {
        result := ComCall(15, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIVirtualChannelManager(ppVal)
    }

    /**
     * Pauses the graphics stream that is sent to all viewers from the sharer until IRDPSRAPISharingSession::Resume is called.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-pause
     */
    Pause() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Causes the graphics stream that is sent to all viewers from the sharer to resume until either IRDPSRAPISharingSession::Pause or IRDPSRAPISharingSession::Close is called.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-resume
     */
    Resume() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Used for reverse connect mode, where the sharer connects to the viewer.
     * @param {BSTR} bstrConnectionString Type: <b>BSTR</b>
     * 
     * Connection string that the viewer sends to the sharer out-of-band through IM or email.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-connecttoclient
     */
    ConnectToClient(bstrConnectionString) {
        bstrConnectionString := bstrConnectionString is String ? BSTR.Alloc(bstrConnectionString).Value : bstrConnectionString

        result := ComCall(18, this, "ptr", bstrConnectionString, "HRESULT")
        return result
    }

    /**
     * Sets the desktop region that will be shared.
     * @param {Integer} left Type: <b>long</b>
     * 
     * X-coordinate of the upper-left corner of the shared rectangle.
     * @param {Integer} top Type: <b>long</b>
     * 
     * Y-coordinate of the upper-left corner of the shared rectangle.
     * @param {Integer} right Type: <b>long</b>
     * 
     * X-coordinate of the lower-right corner of the shared rectangle.
     * @param {Integer} bottom Type: <b>long</b>
     * 
     * Y-coordinate of the lower-right corner of the shared rectangle.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-setdesktopsharedrect
     */
    SetDesktopSharedRect(left, top, right, bottom) {
        result := ComCall(19, this, "int", left, "int", top, "int", right, "int", bottom, "HRESULT")
        return result
    }

    /**
     * Retrieves the current desktop region being shared.
     * @param {Pointer<Integer>} pleft Type: <b>long*</b>
     * 
     * X-coordinate of the upper-left corner of the shared rectangle.
     * @param {Pointer<Integer>} ptop Type: <b>long*</b>
     * 
     * Y-coordinate of the upper-left corner of the shared rectangle.
     * @param {Pointer<Integer>} pright Type: <b>long*</b>
     * 
     * X-coordinate of the lower-right corner of the shared rectangle.
     * @param {Pointer<Integer>} pbottom Type: <b>long*</b>
     * 
     * Y-coordinate of the lower-right corner of the shared rectangle.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-getdesktopsharedrect
     */
    GetDesktopSharedRect(pleft, ptop, pright, pbottom) {
        pleftMarshal := pleft is VarRef ? "int*" : "ptr"
        ptopMarshal := ptop is VarRef ? "int*" : "ptr"
        prightMarshal := pright is VarRef ? "int*" : "ptr"
        pbottomMarshal := pbottom is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pleftMarshal, pleft, ptopMarshal, ptop, prightMarshal, pright, pbottomMarshal, pbottom, "HRESULT")
        return result
    }
}
