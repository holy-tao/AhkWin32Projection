#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\HostName.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * **IVpnNamespaceInfoFactory** is not supported and may be altered or unavailable in the future. Instead, use [IVpnDomainNameInfoFactory](ivpndomainnameinfofactory.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnnamespaceinfofactory
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnNamespaceInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnNamespaceInfo
     * @type {Guid}
     */
    static IID => Guid("{30edfb43-444f-44c5-8167-a35a91f1af94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Namespace", "get_Namespace", "put_DnsServers", "get_DnsServers", "put_WebProxyServers", "get_WebProxyServers"]

    /**
     * @type {HSTRING} 
     */
    Namespace {
        get => this.get_Namespace()
        set => this.put_Namespace(value)
    }

    /**
     * @type {IVector<HostName>} 
     */
    DnsServers {
        get => this.get_DnsServers()
        set => this.put_DnsServers(value)
    }

    /**
     * @type {IVector<HostName>} 
     */
    WebProxyServers {
        get => this.get_WebProxyServers()
        set => this.put_WebProxyServers(value)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Namespace(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Namespace() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IVector<HostName>} value 
     * @returns {HRESULT} 
     */
    put_DnsServers(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HostName>} 
     */
    get_DnsServers() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(HostName, value)
    }

    /**
     * 
     * @param {IVector<HostName>} value 
     * @returns {HRESULT} 
     */
    put_WebProxyServers(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HostName>} 
     */
    get_WebProxyServers() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(HostName, value)
    }
}
