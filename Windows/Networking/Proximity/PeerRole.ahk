#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the role of the peer app when connected to multiple peers.
 * @remarks
 * The [Role](peerfinder_role.md) property is used in multi-peer app connections to identify whether the peer app is the **Host** or **Client**, or if the peer app is participating in a two-peer connection as a **Peer**. For multi-peer app connections, you must set the [Role](peerfinder_role.md) property before calling the [Start](peerfinder_start_119778276.md) method. If the Role property is not set, the default is **Peer**.
 * 
 * In a multi-peer app scenario, the Role identifies the capability of the apps to connect. A **Host** app can connect to up to four **Client** apps. **Host** apps can only discover apps that advertise as **Client** apps. **Client** apps can only discover apps that advertise as **Host** apps. The **Peer** role identifies a two-app scenario. Therefore, **Peer** apps can only discover other **Peer** apps. The same rules apply for peer apps connected using a tap gesture. For example, apps advertising as **Host** apps can only tap to connect with apps advertising as **Client** apps.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerrole
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class PeerRole extends Win32Enum{

    /**
     * The app is part of a two-peer connection.
     * @type {Integer (Int32)}
     */
    static Peer => 0

    /**
     * The app is the host peer app in a multi-peer connection.
     * @type {Integer (Int32)}
     */
    static Host => 1

    /**
     * The app is a client peer app in a multi-peer connection.
     * @type {Integer (Int32)}
     */
    static Client => 2
}
