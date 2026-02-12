#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the transport protocol that the proximity detection process uses.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndproximitydetectiontype
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class NDProximityDetectionType extends Win32Enum{

    /**
     * Proximity detection uses the UDP transport protocol.
     * @type {Integer (Int32)}
     */
    static UDP => 1

    /**
     * Proximity detection uses the TCP transport protocol.
     * @type {Integer (Int32)}
     */
    static TCP => 2

    /**
     * Proximity detection can use either UDP or TCP as the transport protocol.
     * @type {Integer (Int32)}
     */
    static TransportAgnostic => 4
}
