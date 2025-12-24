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
     * Starts the actual connection to the sharer.
     * @param {BSTR} bstrConnectionString Type: <b>BSTR</b>
     * 
     * The connection string used to connect to the sharer and authenticate the viewer.
     * @param {BSTR} bstrName Type: <b>BSTR</b>
     * 
     * Name for the viewer. The name is sent to the sharer and other viewers. The string is limited to 255 characters.
     * @param {BSTR} bstrPassword Type: <b>BSTR</b>
     * 
     * Password used for authentication. The password is sent out-of-band from the sharer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-connect
     */
    Connect(bstrConnectionString, bstrName, bstrPassword) {
        bstrConnectionString := bstrConnectionString is String ? BSTR.Alloc(bstrConnectionString).Value : bstrConnectionString
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(7, this, "ptr", bstrConnectionString, "ptr", bstrName, "ptr", bstrPassword, "HRESULT")
        return result
    }

    /**
     * Initiates a disconnect of the viewer from the sharer.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-disconnect
     */
    Disconnect() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Returns an object implementing the IRDPSRAPIAttendeeManager interface.
     * @returns {IRDPSRAPIAttendeeManager} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_attendees
     */
    get_Attendees() {
        result := ComCall(9, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIAttendeeManager(ppVal)
    }

    /**
     * Returns an object implementing the IRDPSRAPIInvitationManager interface.
     * @returns {IRDPSRAPIInvitationManager} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_invitations
     */
    get_Invitations() {
        result := ComCall(10, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIInvitationManager(ppVal)
    }

    /**
     * Returns an object implementing the IRDPSRAPIApplicationFilter interface.
     * @returns {IRDPSRAPIApplicationFilter} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_applicationfilter
     */
    get_ApplicationFilter() {
        result := ComCall(11, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIApplicationFilter(ppVal)
    }

    /**
     * Returns an object implementing the IRDPSRAPIVirtualChannelManager interface.
     * @returns {IRDPSRAPIVirtualChannelManager} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_virtualchannelmanager
     */
    get_VirtualChannelManager() {
        result := ComCall(12, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIVirtualChannelManager(ppVal)
    }

    /**
     * Gets or sets the smart sizing property of the viewer ActiveX control.
     * @param {VARIANT_BOOL} vbSmartSizing 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-put_smartsizing
     */
    put_SmartSizing(vbSmartSizing) {
        result := ComCall(13, this, "short", vbSmartSizing, "HRESULT")
        return result
    }

    /**
     * Gets or sets the smart sizing property of the viewer ActiveX control.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_smartsizing
     */
    get_SmartSizing() {
        result := ComCall(14, this, "short*", &pvbSmartSizing := 0, "HRESULT")
        return pvbSmartSizing
    }

    /**
     * Requests the sharer to change the control level of the viewer.
     * @param {Integer} CtrlLevel Type: <b>CTRL_LEVEL</b>
     * 
     * One of the values of the <a href="https://docs.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-ctrl_level">CTRL_LEVEL</a> enumeration.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-requestcontrol
     */
    RequestControl(CtrlLevel) {
        result := ComCall(15, this, "int", CtrlLevel, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the text that appears centered in the control before a connection is terminated.
     * @remarks
     * 
     * Setting <b>DisconnectedText</b> is optional. If it is not specified, the control appears blank before a connection is established.
     * 
     * The <b>DisconnectedText</b> property can be set only if the control is not in the connected state. The method returns <b>E_FAIL</b> if it is called after the control is connected.
     * 
     * 
     * @param {BSTR} bstrDisconnectedText 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-put_disconnectedtext
     */
    put_DisconnectedText(bstrDisconnectedText) {
        bstrDisconnectedText := bstrDisconnectedText is String ? BSTR.Alloc(bstrDisconnectedText).Value : bstrDisconnectedText

        result := ComCall(16, this, "ptr", bstrDisconnectedText, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the text that appears centered in the control before a connection is terminated.
     * @remarks
     * 
     * Setting <b>DisconnectedText</b> is optional. If it is not specified, the control appears blank before a connection is established.
     * 
     * The <b>DisconnectedText</b> property can be set only if the control is not in the connected state. The method returns <b>E_FAIL</b> if it is called after the control is connected.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_disconnectedtext
     */
    get_DisconnectedText() {
        pbstrDisconnectedText := BSTR()
        result := ComCall(17, this, "ptr", pbstrDisconnectedText, "HRESULT")
        return pbstrDisconnectedText
    }

    /**
     * Requests a color depth change on the sharer Winlogon user session.
     * @param {Integer} Bpp Type: <b>long</b>
     * 
     * Specifies  the color depth of the session in bits per pixel.  Possible values are 16 and 24. If you specify a value of 8, the color depth is set to 16 bits per pixel.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>Possible values are 8, 16, and 24.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-requestcolordepthchange
     */
    RequestColorDepthChange(Bpp) {
        result := ComCall(18, this, "int", Bpp, "HRESULT")
        return result
    }

    /**
     * Returns an object implementing the IRDPSRAPISessionProperties interface.
     * @returns {IRDPSRAPISessionProperties} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-get_properties
     */
    get_Properties() {
        result := ComCall(19, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPISessionProperties(ppVal)
    }

    /**
     * Initiates a listener for accepting reverse connections from the sharer to the viewer, or obtains the connection string that the sharer uses to reverse connect to the viewer.
     * @param {BSTR} bstrConnectionString Type: <b>BSTR</b>
     * 
     * The connection string that the sharer will use to start the listener.
     * @param {BSTR} bstrUserName Type: <b>BSTR</b>
     * 
     * The user name to use for authentication.
     * @param {BSTR} bstrPassword Type: <b>BSTR</b>
     * 
     * The password to use for authentication.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * A pointer to a <b>BSTR</b> that receives the connection string that the sharer can use to reverse connect to the viewer by using the <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nf-rdpencomapi-irdpsrapisharingsession-connecttoclient">IRDPSRAPISharingSession::ConnectToClient</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiviewer-startreverseconnectlistener
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
