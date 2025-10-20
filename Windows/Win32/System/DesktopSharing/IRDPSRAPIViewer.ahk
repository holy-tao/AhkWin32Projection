#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The ActiveX interface that is used on the viewer side.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiviewer
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIViewer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIViewer
     * @type {Guid}
     */
    static IID => Guid("{c6bfcd38-8ce9-404d-8ae8-f31d00c65cb5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Disconnect", "get_Attendees", "get_Invitations", "get_ApplicationFilter", "get_VirtualChannelManager", "put_SmartSizing", "get_SmartSizing", "RequestControl", "put_DisconnectedText", "get_DisconnectedText", "RequestColorDepthChange", "get_Properties", "StartReverseConnectListener"]

    /**
     * 
     * @param {BSTR} bstrConnectionString 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-connect
     */
    Connect(bstrConnectionString, bstrName, bstrPassword) {
        bstrConnectionString := bstrConnectionString is String ? BSTR.Alloc(bstrConnectionString).Value : bstrConnectionString
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(7, this, "ptr", bstrConnectionString, "ptr", bstrName, "ptr", bstrPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-disconnect
     */
    Disconnect() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIAttendeeManager>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_attendees
     */
    get_Attendees(ppVal) {
        result := ComCall(9, this, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIInvitationManager>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_invitations
     */
    get_Invitations(ppVal) {
        result := ComCall(10, this, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIApplicationFilter>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_applicationfilter
     */
    get_ApplicationFilter(ppVal) {
        result := ComCall(11, this, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIVirtualChannelManager>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_virtualchannelmanager
     */
    get_VirtualChannelManager(ppVal) {
        result := ComCall(12, this, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbSmartSizing 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-put_smartsizing
     */
    put_SmartSizing(vbSmartSizing) {
        result := ComCall(13, this, "short", vbSmartSizing, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbSmartSizing 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_smartsizing
     */
    get_SmartSizing(pvbSmartSizing) {
        result := ComCall(14, this, "ptr", pvbSmartSizing, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CtrlLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-requestcontrol
     */
    RequestControl(CtrlLevel) {
        result := ComCall(15, this, "int", CtrlLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDisconnectedText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-put_disconnectedtext
     */
    put_DisconnectedText(bstrDisconnectedText) {
        bstrDisconnectedText := bstrDisconnectedText is String ? BSTR.Alloc(bstrDisconnectedText).Value : bstrDisconnectedText

        result := ComCall(16, this, "ptr", bstrDisconnectedText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDisconnectedText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_disconnectedtext
     */
    get_DisconnectedText(pbstrDisconnectedText) {
        result := ComCall(17, this, "ptr", pbstrDisconnectedText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Bpp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-requestcolordepthchange
     */
    RequestColorDepthChange(Bpp) {
        result := ComCall(18, this, "int", Bpp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPISessionProperties>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_properties
     */
    get_Properties(ppVal) {
        result := ComCall(19, this, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrConnectionString 
     * @param {BSTR} bstrUserName 
     * @param {BSTR} bstrPassword 
     * @param {Pointer<BSTR>} pbstrReverseConnectString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-startreverseconnectlistener
     */
    StartReverseConnectListener(bstrConnectionString, bstrUserName, bstrPassword, pbstrReverseConnectString) {
        bstrConnectionString := bstrConnectionString is String ? BSTR.Alloc(bstrConnectionString).Value : bstrConnectionString
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(20, this, "ptr", bstrConnectionString, "ptr", bstrUserName, "ptr", bstrPassword, "ptr", pbstrReverseConnectString, "HRESULT")
        return result
    }
}
