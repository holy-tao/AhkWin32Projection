#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values representing the status of a DNS-SD registration attempt.
  * 
  * > [!NOTE]
  * > Win32 DNS Service Discovery (DNS-SD) APIs are declared in the [windns.h header](/windows/win32/api/windns/). For example, the Win32 APIs for announcing and discovering services are [DnsServiceRegister](/windows/win32/api/windns/nf-windns-dnsserviceregister) and [DnsServiceBrowse](/windows/win32/api/windns/nf-windns-dnsservicebrowse).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdregistrationstatus
 * @namespace Windows.Networking.ServiceDiscovery.Dnssd
 * @version WindowsRuntime 1.4
 */
class DnssdRegistrationStatus extends Win32Enum{

    /**
     * The service has been registered successfully.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The service was not registered because the service name provided is not valid.
     * @type {Integer (Int32)}
     */
    static InvalidServiceName => 1

    /**
     * The service was not registered because of an error on the DNS server.
     * @type {Integer (Int32)}
     */
    static ServerError => 2

    /**
     * The service was not registered because security settings did not allow it.
     * @type {Integer (Int32)}
     */
    static SecurityError => 3
}
