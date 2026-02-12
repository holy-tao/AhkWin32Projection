#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Connectivity\NetworkAdapter.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Data\Xml\Dom\XmlDocument.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IHotspotAuthenticationContext extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHotspotAuthenticationContext
     * @type {Guid}
     */
    static IID => Guid("{e756c791-1003-4de5-83c7-de61d88831d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WirelessNetworkId", "get_NetworkAdapter", "get_RedirectMessageUrl", "get_RedirectMessageXml", "get_AuthenticationUrl", "IssueCredentials", "AbortAuthentication", "SkipAuthentication", "TriggerAttentionRequired"]

    /**
     */
    WirelessNetworkId {
        get => this.get_WirelessNetworkId()
    }

    /**
     * @type {NetworkAdapter} 
     */
    NetworkAdapter {
        get => this.get_NetworkAdapter()
    }

    /**
     * @type {Uri} 
     */
    RedirectMessageUrl {
        get => this.get_RedirectMessageUrl()
    }

    /**
     * @type {XmlDocument} 
     */
    RedirectMessageXml {
        get => this.get_RedirectMessageXml()
    }

    /**
     * @type {Uri} 
     */
    AuthenticationUrl {
        get => this.get_AuthenticationUrl()
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_WirelessNetworkId(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {NetworkAdapter} 
     */
    get_NetworkAdapter() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NetworkAdapter(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_RedirectMessageUrl() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {XmlDocument} 
     */
    get_RedirectMessageXml() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlDocument(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_AuthenticationUrl() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {HSTRING} userName 
     * @param {HSTRING} password 
     * @param {HSTRING} extraParameters 
     * @param {Boolean} markAsManualConnectOnFailure 
     * @returns {HRESULT} 
     */
    IssueCredentials(userName, password, extraParameters, markAsManualConnectOnFailure) {
        if(userName is String) {
            pin := HSTRING.Create(userName)
            userName := pin.Value
        }
        userName := userName is Win32Handle ? NumGet(userName, "ptr") : userName
        if(password is String) {
            pin := HSTRING.Create(password)
            password := pin.Value
        }
        password := password is Win32Handle ? NumGet(password, "ptr") : password
        if(extraParameters is String) {
            pin := HSTRING.Create(extraParameters)
            extraParameters := pin.Value
        }
        extraParameters := extraParameters is Win32Handle ? NumGet(extraParameters, "ptr") : extraParameters

        result := ComCall(11, this, "ptr", userName, "ptr", password, "ptr", extraParameters, "int", markAsManualConnectOnFailure, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} markAsManual 
     * @returns {HRESULT} 
     */
    AbortAuthentication(markAsManual) {
        result := ComCall(12, this, "int", markAsManual, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SkipAuthentication() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} packageRelativeApplicationId 
     * @param {HSTRING} applicationParameters 
     * @returns {HRESULT} 
     */
    TriggerAttentionRequired(packageRelativeApplicationId, applicationParameters) {
        if(packageRelativeApplicationId is String) {
            pin := HSTRING.Create(packageRelativeApplicationId)
            packageRelativeApplicationId := pin.Value
        }
        packageRelativeApplicationId := packageRelativeApplicationId is Win32Handle ? NumGet(packageRelativeApplicationId, "ptr") : packageRelativeApplicationId
        if(applicationParameters is String) {
            pin := HSTRING.Create(applicationParameters)
            applicationParameters := pin.Value
        }
        applicationParameters := applicationParameters is Win32Handle ? NumGet(applicationParameters, "ptr") : applicationParameters

        result := ComCall(14, this, "ptr", packageRelativeApplicationId, "ptr", applicationParameters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
