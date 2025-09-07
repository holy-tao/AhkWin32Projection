#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ROUTING_PROTOCOL_CONFIG structure describes the routing protocol configuration information that is passed to the multicast group manager when a protocol registers with the multicast group manager.
 * @see https://learn.microsoft.com/windows/win32/api/mgm/ns-mgm-routing_protocol_config
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class ROUTING_PROTOCOL_CONFIG extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwCallbackFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Callback into a routing protocol to perform an RPF check.
     * @type {Pointer<Ptr>}
     */
    pfnRpfCallback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Callback into a routing protocol to determine the subset of interfaces owned by the routing protocol on which a multicast packet from a new source or to a new group should be forwarded.
     * @type {Pointer<Ptr>}
     */
    pfnCreationAlertCallback {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Callback into a routing protocol to notify the protocol that receivers for the specified source and group are no longer present on an interface owned by other routing protocols.
     * @type {Pointer<Ptr>}
     */
    pfnPruneAlertCallback {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Callback into a routing protocol to notify the protocol that new receivers for the specified source and group are present on an interface owned by another routing protocol.
     * @type {Pointer<Ptr>}
     */
    pfnJoinAlertCallback {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Callback into a routing protocol to notify the protocol that a packet has been received from the specified source and for the specified group on the wrong interface.
     * @type {Pointer<Ptr>}
     */
    pfnWrongIfCallback {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Callback into a routing protocol to notify the protocol that IGMP has detected new receivers for a group on an interface.
     * @type {Pointer<Ptr>}
     */
    pfnLocalJoinCallback {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Callback into a routing protocol to notify the protocol that IGMP has detected that there are no more receivers for a group on an interface.
     * @type {Pointer<Ptr>}
     */
    pfnLocalLeaveCallback {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Callback into IGMP to notify IGMP that a protocol is taking or releasing ownership of an interface on which IGMP is enabled.
     * @type {Pointer<Ptr>}
     */
    pfnDisableIgmpCallback {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Callback into IGMP to notify IGMP that a protocol has finished taking or releasing ownership of an interface on which IGMP is enabled.
     * @type {Pointer<Ptr>}
     */
    pfnEnableIgmpCallback {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
