#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRDPSRAPIAttendeeManager.ahk
#Include .\IRDPSRAPIInvitationManager.ahk
#Include .\IRDPSRAPIApplicationFilter.ahk
#Include .\IRDPSRAPIVirtualChannelManager.ahk
#Include .\IRDPSRAPISessionProperties.ahk
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
     * @type {VARIANT_BOOL} 
     */
    SmartSizing {
        get => this.get_SmartSizing()
        set => this.put_SmartSizing(value)
    }

    /**
     * @type {BSTR} 
     */
    DisconnectedText {
        get => this.get_DisconnectedText()
        set => this.put_DisconnectedText(value)
    }

    /**
     * @type {IRDPSRAPISessionProperties} 
     */
    Properties {
        get => this.get_Properties()
    }

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
     * @returns {IRDPSRAPIAttendeeManager} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_attendees
     */
    get_Attendees() {
        result := ComCall(9, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIAttendeeManager(ppVal)
    }

    /**
     * 
     * @returns {IRDPSRAPIInvitationManager} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_invitations
     */
    get_Invitations() {
        result := ComCall(10, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIInvitationManager(ppVal)
    }

    /**
     * 
     * @returns {IRDPSRAPIApplicationFilter} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_applicationfilter
     */
    get_ApplicationFilter() {
        result := ComCall(11, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIApplicationFilter(ppVal)
    }

    /**
     * 
     * @returns {IRDPSRAPIVirtualChannelManager} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_virtualchannelmanager
     */
    get_VirtualChannelManager() {
        result := ComCall(12, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIVirtualChannelManager(ppVal)
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_smartsizing
     */
    get_SmartSizing() {
        result := ComCall(14, this, "short*", &pvbSmartSizing := 0, "HRESULT")
        return pvbSmartSizing
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_disconnectedtext
     */
    get_DisconnectedText() {
        pbstrDisconnectedText := BSTR()
        result := ComCall(17, this, "ptr", pbstrDisconnectedText, "HRESULT")
        return pbstrDisconnectedText
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
     * @returns {IRDPSRAPISessionProperties} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_properties
     */
    get_Properties() {
        result := ComCall(19, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPISessionProperties(ppVal)
    }

    /**
     * 
     * @param {BSTR} bstrConnectionString 
     * @param {BSTR} bstrUserName 
     * @param {BSTR} bstrPassword 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-startreverseconnectlistener
     */
    StartReverseConnectListener(bstrConnectionString, bstrUserName, bstrPassword) {
        bstrConnectionString := bstrConnectionString is String ? BSTR.Alloc(bstrConnectionString).Value : bstrConnectionString
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        pbstrReverseConnectString := BSTR()
        result := ComCall(20, this, "ptr", bstrConnectionString, "ptr", bstrUserName, "ptr", bstrPassword, "ptr", pbstrReverseConnectString, "HRESULT")
        return pbstrReverseConnectString
    }
}
