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
     * 
     * @returns {HRESULT} 
     */
    Open() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} colorDepth 
     * @returns {HRESULT} 
     */
    put_ColorDepth(colorDepth) {
        result := ComCall(9, this, "int", colorDepth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pColorDepth 
     * @returns {HRESULT} 
     */
    get_ColorDepth(pColorDepth) {
        result := ComCall(10, this, "int*", pColorDepth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPISessionProperties>} ppVal 
     * @returns {HRESULT} 
     */
    get_Properties(ppVal) {
        result := ComCall(11, this, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIAttendeeManager>} ppVal 
     * @returns {HRESULT} 
     */
    get_Attendees(ppVal) {
        result := ComCall(12, this, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIInvitationManager>} ppVal 
     * @returns {HRESULT} 
     */
    get_Invitations(ppVal) {
        result := ComCall(13, this, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIApplicationFilter>} ppVal 
     * @returns {HRESULT} 
     */
    get_ApplicationFilter(ppVal) {
        result := ComCall(14, this, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIVirtualChannelManager>} ppVal 
     * @returns {HRESULT} 
     */
    get_VirtualChannelManager(ppVal) {
        result := ComCall(15, this, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrConnectionString 
     * @returns {HRESULT} 
     */
    ConnectToClient(bstrConnectionString) {
        bstrConnectionString := bstrConnectionString is String ? BSTR.Alloc(bstrConnectionString).Value : bstrConnectionString

        result := ComCall(18, this, "ptr", bstrConnectionString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} left 
     * @param {Integer} top 
     * @param {Integer} right 
     * @param {Integer} bottom 
     * @returns {HRESULT} 
     */
    SetDesktopSharedRect(left, top, right, bottom) {
        result := ComCall(19, this, "int", left, "int", top, "int", right, "int", bottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pleft 
     * @param {Pointer<Int32>} ptop 
     * @param {Pointer<Int32>} pright 
     * @param {Pointer<Int32>} pbottom 
     * @returns {HRESULT} 
     */
    GetDesktopSharedRect(pleft, ptop, pright, pbottom) {
        result := ComCall(20, this, "int*", pleft, "int*", ptop, "int*", pright, "int*", pbottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
