#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains the values that describe how remote systems are able to be discovered.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemdiscoverytype
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemDiscoveryType extends Win32Enum{

    /**
     * Remote systems are discoverable both through a proximal connection and through cloud connection.
     * @type {Integer (Int32)}
     */
    static Any => 0

    /**
     * Remote systems are only discoverable through a proximal connection, such as a local network or Bluetooth connection.
     * @type {Integer (Int32)}
     */
    static Proximal => 1

    /**
     * Remote systems are only discoverable through cloud connection.
     * @type {Integer (Int32)}
     */
    static Cloud => 2

    /**
     * Remote systems are discoverable through a proximal connection and are expected to be spatially near to the client device.
     * @type {Integer (Int32)}
     */
    static SpatiallyProximal => 3
}
