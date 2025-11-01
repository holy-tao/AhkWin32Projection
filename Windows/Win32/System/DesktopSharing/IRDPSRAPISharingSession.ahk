#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-open
     */
    Open() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-close
     */
    Close() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} colorDepth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-put_colordepth
     */
    put_ColorDepth(colorDepth) {
        result := ComCall(9, this, "int", colorDepth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pColorDepth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_colordepth
     */
    get_ColorDepth(pColorDepth) {
        pColorDepthMarshal := pColorDepth is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pColorDepthMarshal, pColorDepth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPISessionProperties>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_properties
     */
    get_Properties(ppVal) {
        result := ComCall(11, this, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIAttendeeManager>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_attendees
     */
    get_Attendees(ppVal) {
        result := ComCall(12, this, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIInvitationManager>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_invitations
     */
    get_Invitations(ppVal) {
        result := ComCall(13, this, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIApplicationFilter>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_applicationfilter
     */
    get_ApplicationFilter(ppVal) {
        result := ComCall(14, this, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIVirtualChannelManager>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-get_virtualchannelmanager
     */
    get_VirtualChannelManager(ppVal) {
        result := ComCall(15, this, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-pause
     */
    Pause() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-resume
     */
    Resume() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrConnectionString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-connecttoclient
     */
    ConnectToClient(bstrConnectionString) {
        bstrConnectionString := bstrConnectionString is String ? BSTR.Alloc(bstrConnectionString).Value : bstrConnectionString

        result := ComCall(18, this, "ptr", bstrConnectionString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} left 
     * @param {Integer} top 
     * @param {Integer} right 
     * @param {Integer} bottom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-setdesktopsharedrect
     */
    SetDesktopSharedRect(left, top, right, bottom) {
        result := ComCall(19, this, "int", left, "int", top, "int", right, "int", bottom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pleft 
     * @param {Pointer<Integer>} ptop 
     * @param {Pointer<Integer>} pright 
     * @param {Pointer<Integer>} pbottom 
     * @returns {HRESULT} 
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
}
