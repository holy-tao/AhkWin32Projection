#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Data\Xml\Dom\XmlDocument.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IHotspotCredentialsAuthenticationResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHotspotCredentialsAuthenticationResult
     * @type {Guid}
     */
    static IID => Guid("{e756c791-1005-4de5-83c7-de61d88831d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HasNetworkErrorOccurred", "get_ResponseCode", "get_LogoffUrl", "get_AuthenticationReplyXml"]

    /**
     * @type {Boolean} 
     */
    HasNetworkErrorOccurred {
        get => this.get_HasNetworkErrorOccurred()
    }

    /**
     * @type {Integer} 
     */
    ResponseCode {
        get => this.get_ResponseCode()
    }

    /**
     * @type {Uri} 
     */
    LogoffUrl {
        get => this.get_LogoffUrl()
    }

    /**
     * @type {XmlDocument} 
     */
    AuthenticationReplyXml {
        get => this.get_AuthenticationReplyXml()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasNetworkErrorOccurred() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResponseCode() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_LogoffUrl() {
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
    get_AuthenticationReplyXml() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XmlDocument(value)
    }
}
