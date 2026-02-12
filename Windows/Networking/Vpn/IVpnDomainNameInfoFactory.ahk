#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\VpnDomainNameInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Factory to create [VpnDomainNameInfo](vpndomainnameinfo.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpndomainnameinfofactory
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnDomainNameInfoFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnDomainNameInfoFactory
     * @type {Guid}
     */
    static IID => Guid("{2507bb75-028f-4688-8d3a-c4531df37da8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVpnDomainNameInfo"]

    /**
     * Creates a [VpnDomainNameInfo](vpndomainnameinfo.md) object.
     * @param {HSTRING} name The domain name. This could be an FQDN, or a DNS suffix.
     * @param {Integer} nameType An enum value indicating whether the namespace in question is a FQDN, or a DNS suffix.
     * @param {IIterable<HostName>} dnsServerList A list of DNS servers to perform DNS resolution against when resolving a name in the namespace.
     * @param {IIterable<HostName>} proxyServerList A list of web proxy servers to be used when connecting to a resource in the specified namespace.
     * @returns {VpnDomainNameInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpndomainnameinfofactory.createvpndomainnameinfo
     */
    CreateVpnDomainNameInfo(name, nameType, dnsServerList, proxyServerList) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "int", nameType, "ptr", dnsServerList, "ptr", proxyServerList, "ptr*", &domainNameInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnDomainNameInfo(domainNameInfo)
    }
}
