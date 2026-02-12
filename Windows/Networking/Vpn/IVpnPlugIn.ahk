#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides an interface to implement specific third party VPN client operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnplugin
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnPlugIn extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnPlugIn
     * @type {Guid}
     */
    static IID => Guid("{ceb78d07-d0a8-4703-a091-c8c2c0915bc4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Disconnect", "GetKeepAlivePayload", "Encapsulate", "Decapsulate"]

    /**
     * This method instructs the VPN plug-in to connect to the VPN server and establish the VPN channel.
     * @param {VpnChannel} channel The VPN channel object representing the instance VPN connection of the VPN plug-in to the VPN server.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnplugin.connect
     */
    Connect(channel) {
        result := ComCall(6, this, "ptr", channel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method instructs the VPN plug-in to disconnect from the VPN server and destroy the VPN channel.
     * @param {VpnChannel} channel The VPN channel object representing the instance VPN connection of the VPN plug-in to the VPN server.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnplugin.disconnect
     */
    Disconnect(channel) {
        result := ComCall(7, this, "ptr", channel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method instructs the VPN plug-in to compute and return a Keep alive payload ready to be sent to the VPN server.
     * @remarks
     * This method is only called at a time determined by the VPN infrastructure to be the optimal for the network in which the client machine is connected. If an error occurs the VPN infrastructure will skip sending the keep alive payload.
     * @param {VpnChannel} channel The VPN channel object representing the instance VPN connection of the VPN plug-in to the VPN server.
     * @param {Pointer<VpnPacketBuffer>} keepAlivePacket An VPN protocol specific message payload used by the VPN Plug-in to indicate to the server that the client and its VPN connection are still alive.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnplugin.getkeepalivepayload
     */
    GetKeepAlivePayload(channel, keepAlivePacket) {
        result := ComCall(8, this, "ptr", channel, "ptr", keepAlivePacket, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method instructs the VPN plug-in to prepare the indicated L3 IP packet for transmission to the VPN server. The process might include any encapsulation specific to the VPN protocol.
     * @remarks
     * If an error occurs the packets will simply be dropped. It is required that any **IVpnPacketBuffer** object, either passed to the method in the *packets* parameter or requested by the plugin, be returned to the VPN framework. The VPN framework will then send the **IVpnPacketBuffer** objects in *encapsulatedPackets* via one of the transports specified during Connect and will clean up the remaining **IVpnPacketBuffer** objects in *packets*.
     * @param {VpnChannel} channel The VPN channel object representing the instance VPN connection of the VPN plug-in to the VPN server.
     * @param {VpnPacketBufferList} packets An L3 IP packets originated by the client machine TCP/IP stack and that needs to be processed to be sent to the corporate network.
     * @param {VpnPacketBufferList} encapulatedPackets 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnplugin.encapsulate
     */
    Encapsulate(channel, packets, encapulatedPackets) {
        result := ComCall(9, this, "ptr", channel, "ptr", packets, "ptr", encapulatedPackets, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method instructs the VPN plug-in to prepare receive a buffer from the VPN server **outerTunnelTransport**, extract any number of IP packets encapsulated in the buffer, and return the IP packets together with any other reply buffers that are needed to be sent back through the **outerTunnelTransport** to the VPN server.
     * @remarks
     * If an error occurs the packets will simply be dropped. It is required that any **IVpnPacketBuffer** objects requested by the plugin be returned to the VPN framework via either the *decapsulatedPackets* chain, to inject into the client TCP/IP stack, or the *controlPacketsToSend* chain, to reply back to the VPN server. The VPN framework will send all the [VpnPacketBufferList](vpnpacketbufferlist.md) chained on *decapsulatedPackets* as unique IP packets to the VPN interface.
     * @param {VpnChannel} channel The VPN channel object representing the instance VPN connection of the VPN plug-in to the VPN server.
     * @param {VpnPacketBuffer} encapBuffer A buffer originated from the VPN server and received through the **outerTunnelTransport.**
     * @param {VpnPacketBufferList} decapsulatedPackets An **IVpnPacketBuffer** chain representing any L3 IP packets extracted and decapsulated from the buffer and which need to be injected through the VPN interface to be received by the client machine's TCP/IP stack.
     * @param {VpnPacketBufferList} controlPacketsToSend An **IVpnPacketBuffer** chain representing any control messages that VPN plug-in is required by its protocol specification to reply back to the VPN server.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnplugin.decapsulate
     */
    Decapsulate(channel, encapBuffer, decapsulatedPackets, controlPacketsToSend) {
        result := ComCall(10, this, "ptr", channel, "ptr", encapBuffer, "ptr", decapsulatedPackets, "ptr", controlPacketsToSend, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
