#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\VpnNamespaceInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * **IVpnNamespaceInfoFactory** is not supported and may be altered or unavailable in the future. Instead, use [IVpnDomainNameInfoFactory](ivpndomainnameinfofactory.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnnamespaceinfofactory
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnNamespaceInfoFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnNamespaceInfoFactory
     * @type {Guid}
     */
    static IID => Guid("{cb3e951a-b0ce-442b-acbb-5f99b202c31c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVpnNamespaceInfo"]

    /**
     * Not supported.
     * @param {HSTRING} name Not supported.
     * @param {IVector<HostName>} dnsServerList Not supported.
     * @param {IVector<HostName>} proxyServerList Not supported.
     * @returns {VpnNamespaceInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnnamespaceinfofactory.createvpnnamespaceinfo
     */
    CreateVpnNamespaceInfo(name, dnsServerList, proxyServerList) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr", dnsServerList, "ptr", proxyServerList, "ptr*", &namespaceInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnNamespaceInfo(namespaceInfo)
    }
}
