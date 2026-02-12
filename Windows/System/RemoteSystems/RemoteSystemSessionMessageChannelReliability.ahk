#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values that describe the reliability type of a remote session messaging channel.
 * @remarks
 * The ordering of messages is not guaranteed for channels of either reliability type.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionmessagechannelreliability
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionMessageChannelReliability extends Win32Enum{

    /**
     * The channel is connection-based. Delivery of packets is guaranteed as long as the connection remains open.
     * @type {Integer (Int32)}
     */
    static Reliable => 0

    /**
     * The channel is connectionless. Delivery of packets is not guaranteed.
     * @type {Integer (Int32)}
     */
    static Unreliable => 1
}
