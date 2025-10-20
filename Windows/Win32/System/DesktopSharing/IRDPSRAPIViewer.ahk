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
     * 
     * @param {BSTR} bstrConnectionString 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrPassword 
     * @returns {HRESULT} 
     */
    Connect(bstrConnectionString, bstrName, bstrPassword) {
        bstrConnectionString := bstrConnectionString is String ? BSTR.Alloc(bstrConnectionString).Value : bstrConnectionString
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(7, this, "ptr", bstrConnectionString, "ptr", bstrName, "ptr", bstrPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disconnect() {
        result := ComCall(8, this, "int")
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
        result := ComCall(9, this, "ptr", ppVal, "int")
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
        result := ComCall(10, this, "ptr", ppVal, "int")
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
        result := ComCall(11, this, "ptr", ppVal, "int")
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
        result := ComCall(12, this, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbSmartSizing 
     * @returns {HRESULT} 
     */
    put_SmartSizing(vbSmartSizing) {
        result := ComCall(13, this, "short", vbSmartSizing, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbSmartSizing 
     * @returns {HRESULT} 
     */
    get_SmartSizing(pvbSmartSizing) {
        result := ComCall(14, this, "ptr", pvbSmartSizing, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CtrlLevel 
     * @returns {HRESULT} 
     */
    RequestControl(CtrlLevel) {
        result := ComCall(15, this, "int", CtrlLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDisconnectedText 
     * @returns {HRESULT} 
     */
    put_DisconnectedText(bstrDisconnectedText) {
        bstrDisconnectedText := bstrDisconnectedText is String ? BSTR.Alloc(bstrDisconnectedText).Value : bstrDisconnectedText

        result := ComCall(16, this, "ptr", bstrDisconnectedText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDisconnectedText 
     * @returns {HRESULT} 
     */
    get_DisconnectedText(pbstrDisconnectedText) {
        result := ComCall(17, this, "ptr", pbstrDisconnectedText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Bpp 
     * @returns {HRESULT} 
     */
    RequestColorDepthChange(Bpp) {
        result := ComCall(18, this, "int", Bpp, "int")
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
        result := ComCall(19, this, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrConnectionString 
     * @param {BSTR} bstrUserName 
     * @param {BSTR} bstrPassword 
     * @param {Pointer<BSTR>} pbstrReverseConnectString 
     * @returns {HRESULT} 
     */
    StartReverseConnectListener(bstrConnectionString, bstrUserName, bstrPassword, pbstrReverseConnectString) {
        bstrConnectionString := bstrConnectionString is String ? BSTR.Alloc(bstrConnectionString).Value : bstrConnectionString
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(20, this, "ptr", bstrConnectionString, "ptr", bstrUserName, "ptr", bstrPassword, "ptr", pbstrReverseConnectString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
