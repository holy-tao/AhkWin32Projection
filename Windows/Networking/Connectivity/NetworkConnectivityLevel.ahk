#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the level of connectivity currently available.
 * @remarks
 * > [!IMPORTANT]
 * > The network status reported by Windows APIs is only a hint - its accuracy may vary depending on the local network
 * > topology and conditions. Apps should attempt to connect to their services whenever `LocalAccess` or higher connectivity
 * > is reported.
 * 
 * For a complete implementation demonstrating connection attempts with any level of local connectivity, see the 
 * [NetworkConnectivity sample](https://github.com/microsoft/Windows-universal-samples/tree/main/Samples/NetworkConnectivity).
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkconnectivitylevel
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class NetworkConnectivityLevel extends Win32Enum{

    /**
     * No connectivity.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Local network access only.
     * @type {Integer (Int32)}
     */
    static LocalAccess => 1

    /**
     * Limited internet access.
     * 
     * This value is an indication that the connection is constrained, possibly due to a captive portal. Or possibly due to some other reason; for example, a proxy between the client and the internet that's modifying the HTTP header in some unknown way. In the case of captive portal connectivity, local access to a web portal is provided, but access to the internet requires that specific credentials are provided via the portal.
     * 
     * This level of connectivity (limited internet access) is generally encountered when using connections hosted in public locations (for example, coffee shops and book stores).
     * 
     * > [!NOTE]
     * > As mentioned, this doesn't necessarily mean that a captive portal has been detected. You should also test whether the captive portal can be reached by using a URL for the captive portal, or by attempting access to a public web site, which will then redirect to the captive portal when Windows reports `LocalAccess` as the current `NetworkConnectivityLevel`.
     * @type {Integer (Int32)}
     */
    static ConstrainedInternetAccess => 2

    /**
     * Local and internet access.
     * @type {Integer (Int32)}
     */
    static InternetAccess => 3
}
