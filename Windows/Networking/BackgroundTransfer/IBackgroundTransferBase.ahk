#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Security\Credentials\PasswordCredential.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a background transfer operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferbase
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundTransferBase extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTransferBase
     * @type {Guid}
     */
    static IID => Guid("{2a9da250-c769-458c-afe8-feb8d4d3b2ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRequestHeader", "get_ServerCredential", "put_ServerCredential", "get_ProxyCredential", "put_ProxyCredential", "get_Method", "put_Method", "get_Group", "put_Group", "get_CostPolicy", "put_CostPolicy"]

    /**
     * Gets or sets the credentials used to authenticate with the origin server.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferbase.servercredential
     * @type {PasswordCredential} 
     */
    ServerCredential {
        get => this.get_ServerCredential()
        set => this.put_ServerCredential(value)
    }

    /**
     * Gets or sets the proxy credentials for the background transfer.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferbase.proxycredential
     * @type {PasswordCredential} 
     */
    ProxyCredential {
        get => this.get_ProxyCredential()
        set => this.put_ProxyCredential(value)
    }

    /**
     * Gets or sets the method to use for the background transfer.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferbase.method
     * @type {HSTRING} 
     */
    Method {
        get => this.get_Method()
        set => this.put_Method(value)
    }

    /**
     * > [!NOTE]
     * > Group may be altered or unavailable for releases after Windows 8.1. Instead, use the relevant [DownloadOperation](downloadoperation.md) or [UploadOperation](uploadoperation.md) TransferGroup.
     * 
     * Gets are sets a string value indicating the group the transfer will belong to.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferbase.group
     * @type {HSTRING} 
     */
    Group {
        get => this.get_Group()
        set => this.put_Group(value)
    }

    /**
     * Gets or sets the cost policy for the background transfer operation.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferbase.costpolicy
     * @type {Integer} 
     */
    CostPolicy {
        get => this.get_CostPolicy()
        set => this.put_CostPolicy(value)
    }

    /**
     * Sets the request headers.
     * @remarks
     * This method allows the caller to set request headers. This method can be called multiple times for the same header. The values will then be concatenated.
     * @param {HSTRING} headerName The header name.
     * @param {HSTRING} headerValue The header value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferbase.setrequestheader
     */
    SetRequestHeader(headerName, headerValue) {
        if(headerName is String) {
            pin := HSTRING.Create(headerName)
            headerName := pin.Value
        }
        headerName := headerName is Win32Handle ? NumGet(headerName, "ptr") : headerName
        if(headerValue is String) {
            pin := HSTRING.Create(headerValue)
            headerValue := pin.Value
        }
        headerValue := headerValue is Win32Handle ? NumGet(headerValue, "ptr") : headerValue

        result := ComCall(6, this, "ptr", headerName, "ptr", headerValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_ServerCredential() {
        result := ComCall(7, this, "ptr*", &credential := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(credential)
    }

    /**
     * 
     * @param {PasswordCredential} credential 
     * @returns {HRESULT} 
     */
    put_ServerCredential(credential) {
        result := ComCall(8, this, "ptr", credential, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_ProxyCredential() {
        result := ComCall(9, this, "ptr*", &credential := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(credential)
    }

    /**
     * 
     * @param {PasswordCredential} credential 
     * @returns {HRESULT} 
     */
    put_ProxyCredential(credential) {
        result := ComCall(10, this, "ptr", credential, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Method() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Method(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Group() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Group(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CostPolicy() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CostPolicy(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
