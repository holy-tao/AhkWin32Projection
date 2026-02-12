#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the possible states of the VPN packet buffer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpacketbufferstatus
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnPacketBufferStatus extends Win32Enum{

    /**
     * Specifies that the state is ok.
     * @type {Integer (Int32)}
     */
    static Ok => 0

    /**
     * Specifies an invalid buffer size.
     * @type {Integer (Int32)}
     */
    static InvalidBufferSize => 1
}
