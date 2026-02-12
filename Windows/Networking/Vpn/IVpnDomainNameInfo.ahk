#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\HostName.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Factory to create [VpnDomainNameInfo](vpndomainnameinfo.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpndomainnameinfofactory
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnDomainNameInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnDomainNameInfo
     * @type {Guid}
     */
    static IID => Guid("{ad2eb82f-ea8e-4f7a-843e-1a87e32e1b9a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_DomainName", "get_DomainName", "put_DomainNameType", "get_DomainNameType", "get_DnsServers", "get_WebProxyServers"]

    /**
     * @type {HostName} 
     */
    DomainName {
        get => this.get_DomainName()
        set => this.put_DomainName(value)
    }

    /**
     * @type {Integer} 
     */
    DomainNameType {
        get => this.get_DomainNameType()
        set => this.put_DomainNameType(value)
    }

    /**
     * @type {IVector<HostName>} 
     */
    DnsServers {
        get => this.get_DnsServers()
    }

    /**
     * @type {IVector<HostName>} 
     */
    WebProxyServers {
        get => this.get_WebProxyServers()
    }

    /**
     * 
     * @param {HostName} value 
     * @returns {HRESULT} 
     */
    put_DomainName(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_DomainName() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DomainNameType(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DomainNameType() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<HostName>} 
     */
    get_DnsServers() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(HostName, value)
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
