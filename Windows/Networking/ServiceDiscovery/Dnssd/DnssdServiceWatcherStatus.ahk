#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values representing the status of a [DnssdServiceWatcher](dnssdservicewatcher.md).
  * 
  * > [!NOTE]
  * > DnssdServiceWatcher is not supported and may be altered or unavailable in the future. Instead, use the Windows.Devices.Enumeration API.
  * 
  * > [!NOTE]
  * > Win32 DNS Service Discovery (DNS-SD) APIs are declared in the [windns.h header](/windows/win32/api/windns/). For example, the Win32 APIs for announcing and discovering services are [DnsServiceRegister](/windows/win32/api/windns/nf-windns-dnsserviceregister) and [DnsServiceBrowse](/windows/win32/api/windns/nf-windns-dnsservicebrowse).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdservicewatcherstatus
 * @namespace Windows.Networking.ServiceDiscovery.Dnssd
 * @version WindowsRuntime 1.4
 */
class DnssdServiceWatcherStatus extends Win32Enum{

    /**
     * The watcher has been created.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * The watcher has acknowledged receiving a start command.
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * The watcher has finished enumerating service instances.
     * @type {Integer (Int32)}
     */
    static EnumerationCompleted => 2

    /**
     * The watcher has acknowledged receiving a stop command.
     * @type {Integer (Int32)}
     */
    static Stopping => 3

    /**
     * The watcher has completed processing a stop command.
     * @type {Integer (Int32)}
     */
    static Stopped => 4

    /**
     * The watcher has been aborted in the process of enumerating service instances.
     * @type {Integer (Int32)}
     */
    static Aborted => 5
}
