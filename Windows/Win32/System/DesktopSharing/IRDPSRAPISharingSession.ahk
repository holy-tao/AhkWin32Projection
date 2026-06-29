#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRDPSRAPIVirtualChannelManager.ahk" { IRDPSRAPIVirtualChannelManager }
#Import ".\IRDPSRAPIApplicationFilter.ahk" { IRDPSRAPIApplicationFilter }
#Import ".\IRDPSRAPIAttendeeManager.ahk" { IRDPSRAPIAttendeeManager }
#Import ".\IRDPSRAPISessionProperties.ahk" { IRDPSRAPISessionProperties }
#Import ".\IRDPSRAPIInvitationManager.ahk" { IRDPSRAPIInvitationManager }

/**
 * The main object that an application must create to start a collaboration session. (IRDPSRAPISharingSession)
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapisharingsession
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPISharingSession extends IDispatch {
    /**
     * The interface identifier for IRDPSRAPISharingSession
     * @type {Guid}
     */
    static IID := Guid("{eeb20886-e470-4cf6-842b-2739c0ec5cfb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPISharingSession interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Open                      : IntPtr
        Close                     : IntPtr
        put_ColorDepth            : IntPtr
        get_ColorDepth            : IntPtr
        get_Properties            : IntPtr
        get_Attendees             : IntPtr
        get_Invitations           : IntPtr
        get_ApplicationFilter     : IntPtr
        get_VirtualChannelManager : IntPtr
        Pause                     : IntPtr
        Resume                    : IntPtr
        ConnectToClient           : IntPtr
        SetDesktopSharedRect      : IntPtr
        GetDesktopSharedRect      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPISharingSession.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-open
     */
    Open() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Disconnects all attendees from the session and stops listening to incoming connections.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-close
     */
    Close() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the color depth for the shared session. (Put)
     * @param {Integer} colorDepth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-put_colordepth
     */
    put_ColorDepth(colorDepth) {
        result := ComCall(9, this, "int", colorDepth, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the color depth for the shared session. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_colordepth
     */
    get_ColorDepth() {
        result := ComCall(10, this, "int*", &pColorDepth := 0, "HRESULT")
        return pColorDepth
    }

    /**
     * Retrieves an object implementing the IRDPSRAPISessionProperties interface.
     * @returns {IRDPSRAPISessionProperties} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_properties
     */
    get_Properties() {
        result := ComCall(11, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPISessionProperties(ppVal)
    }

    /**
     * Returns an object implementing the IRDPSRAPIAttendeeManager interface. (IRDPSRAPISharingSession.get_Attendees)
     * @returns {IRDPSRAPIAttendeeManager} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_attendees
     */
    get_Attendees() {
        result := ComCall(12, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIAttendeeManager(ppVal)
    }

    /**
     * Returns an object implementing the IRDPSRAPIInvitationManager interface. (IRDPSRAPISharingSession.get_Invitations)
     * @returns {IRDPSRAPIInvitationManager} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_invitations
     */
    get_Invitations() {
        result := ComCall(13, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIInvitationManager(ppVal)
    }

    /**
     * Returns an object implementing the IRDPSRAPIApplicationFilter interface. (IRDPSRAPISharingSession.get_ApplicationFilter)
     * @returns {IRDPSRAPIApplicationFilter} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_applicationfilter
     */
    get_ApplicationFilter() {
        result := ComCall(14, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIApplicationFilter(ppVal)
    }

    /**
     * Retrieves an object implementing the IRDPSRAPIVirtualChannelManager interface.
     * @returns {IRDPSRAPIVirtualChannelManager} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_virtualchannelmanager
     */
    get_VirtualChannelManager() {
        result := ComCall(15, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIVirtualChannelManager(ppVal)
    }

    /**
     * Pauses the graphics stream that is sent to all viewers from the sharer until IRDPSRAPISharingSession::Resume is called.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-pause
     */
    Pause() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Causes the graphics stream that is sent to all viewers from the sharer to resume until either IRDPSRAPISharingSession::Pause or IRDPSRAPISharingSession::Close is called.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-resume
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
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-connecttoclient
     */
    ConnectToClient(bstrConnectionString) {
        bstrConnectionString := bstrConnectionString is String ? BSTR.Alloc(bstrConnectionString).Value : bstrConnectionString

        result := ComCall(18, this, BSTR, bstrConnectionString, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-setdesktopsharedrect
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
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-getdesktopsharedrect
     */
    GetDesktopSharedRect(pleft, ptop, pright, pbottom) {
        pleftMarshal := pleft is VarRef ? "int*" : "ptr"
        ptopMarshal := ptop is VarRef ? "int*" : "ptr"
        prightMarshal := pright is VarRef ? "int*" : "ptr"
        pbottomMarshal := pbottom is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pleftMarshal, pleft, ptopMarshal, ptop, prightMarshal, pright, pbottomMarshal, pbottom, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRDPSRAPISharingSession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Open := CallbackCreate(GetMethod(implObj, "Open"), flags, 1)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
        this.vtbl.put_ColorDepth := CallbackCreate(GetMethod(implObj, "put_ColorDepth"), flags, 2)
        this.vtbl.get_ColorDepth := CallbackCreate(GetMethod(implObj, "get_ColorDepth"), flags, 2)
        this.vtbl.get_Properties := CallbackCreate(GetMethod(implObj, "get_Properties"), flags, 2)
        this.vtbl.get_Attendees := CallbackCreate(GetMethod(implObj, "get_Attendees"), flags, 2)
        this.vtbl.get_Invitations := CallbackCreate(GetMethod(implObj, "get_Invitations"), flags, 2)
        this.vtbl.get_ApplicationFilter := CallbackCreate(GetMethod(implObj, "get_ApplicationFilter"), flags, 2)
        this.vtbl.get_VirtualChannelManager := CallbackCreate(GetMethod(implObj, "get_VirtualChannelManager"), flags, 2)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 1)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 1)
        this.vtbl.ConnectToClient := CallbackCreate(GetMethod(implObj, "ConnectToClient"), flags, 2)
        this.vtbl.SetDesktopSharedRect := CallbackCreate(GetMethod(implObj, "SetDesktopSharedRect"), flags, 5)
        this.vtbl.GetDesktopSharedRect := CallbackCreate(GetMethod(implObj, "GetDesktopSharedRect"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Open)
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.put_ColorDepth)
        CallbackFree(this.vtbl.get_ColorDepth)
        CallbackFree(this.vtbl.get_Properties)
        CallbackFree(this.vtbl.get_Attendees)
        CallbackFree(this.vtbl.get_Invitations)
        CallbackFree(this.vtbl.get_ApplicationFilter)
        CallbackFree(this.vtbl.get_VirtualChannelManager)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.Resume)
        CallbackFree(this.vtbl.ConnectToClient)
        CallbackFree(this.vtbl.SetDesktopSharedRect)
        CallbackFree(this.vtbl.GetDesktopSharedRect)
    }
}
