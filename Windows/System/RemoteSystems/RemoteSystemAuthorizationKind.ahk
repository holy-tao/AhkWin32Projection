#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values specifying whether the client device can discover only same-user devices or other users' devices as well. Cross-user devices must be available through a proximal connection in order to be discovered (see [RemoteSystemDiscoveryType](remotesystemdiscoverytype.md) for details).
 * @remarks
 * If a [RemoteSystemAuthorizationKindFilter](RemoteSystemAuthorizationKindFilter.md) is not used in device discovery, the default behavior is to discover same-user devices only.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemauthorizationkind
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemAuthorizationKind extends Win32Enum{

    /**
     * The client device can only discover devices signed in by the same user.
     * @type {Integer (Int32)}
     */
    static SameUser => 0

    /**
     * The client device can discover other users' devices, provided they are available for proximal connection.
     * @type {Integer (Int32)}
     */
    static Anonymous => 1
}
