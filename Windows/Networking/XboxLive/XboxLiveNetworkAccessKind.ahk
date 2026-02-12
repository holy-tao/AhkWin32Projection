#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the different levels of peer-to-peer network access observed for **XboxLiveEndpointPair** communication. **XboxLiveNetworkAccessKind** is used to describe peer-to-peer connections established through the Xbox Live Multiplayer Networking API, and is not applicable to connections to Xbox Live web services or to peer-to-peer connections established outside of the Xbox Live Multiplayer Networking API.
  * 
  * > [!IMPORTANT]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivenetworkaccesskind
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class XboxLiveNetworkAccessKind extends Win32Enum{

    /**
     * NAT type is open. Players behind these network address translation (NAT) types can usually connect to any other player.
     * @type {Integer (Int32)}
     */
    static Open => 0

    /**
     * NAT type is moderate. Players behind these NAT types can usually connect to others behind **Open** or **Moderate** types.
     * @type {Integer (Int32)}
     */
    static Moderate => 1

    /**
     * NAT type is strict. Players behind this NAT type frequently experience connectivity problems with others unless those players are behind **Open** type devices.
     * @type {Integer (Int32)}
     */
    static Strict => 2
}
