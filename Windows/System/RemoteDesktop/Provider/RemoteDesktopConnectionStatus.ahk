#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the connection status of a remote desktop connection.
  * 
  * > [!IMPORTANT]
  * > The **RemoteDesktopConnectionStatus** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * Remote desktop providers inform the OS of the current status of a remote desktop connection by calling [SetConnectionStatus](/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectioninfo.setconnectionstatus)).
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectionstatus
 * @namespace Windows.System.RemoteDesktop.Provider
 * @version WindowsRuntime 1.4
 */
class RemoteDesktopConnectionStatus extends Win32Enum{

    /**
     * The connection is in the process of connecting.
     * @type {Integer (Int32)}
     */
    static Connecting => 0

    /**
     * The connection is active.
     * @type {Integer (Int32)}
     */
    static Connected => 1

    /**
     * User input is needed to complete the connection.
     * @type {Integer (Int32)}
     */
    static UserInputNeeded => 2

    /**
     * The connection is disconnected.
     * @type {Integer (Int32)}
     */
    static Disconnected => 3
}
