#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a local action that can be performed by a remote desktop client app.
  * 
  * > [!IMPORTANT]
  * > The **RemoteDesktopLocalAction** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * This enumeration is used by the [PerformLocalActionRequestedEventArgs](/uwp/api/windows.system.remotedesktop.provider.performlocalactionrequestedeventargs) class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.remotedesktoplocalaction
 * @namespace Windows.System.RemoteDesktop.Provider
 * @version WindowsRuntime 1.4
 */
class RemoteDesktopLocalAction extends Win32Enum{

    /**
     * Show Bluetooth settings.
     * @type {Integer (Int32)}
     */
    static ShowBluetoothSettings => 0

    /**
     * @type {Integer (Int32)}
     */
    static ShowSystemSoundSettings => 1

    /**
     * @type {Integer (Int32)}
     */
    static ShowSystemDisplaySettings => 2

    /**
     * @type {Integer (Int32)}
     */
    static ShowSystemAccountSettings => 3

    /**
     * @type {Integer (Int32)}
     */
    static ShowLocalSettings => 4
}
