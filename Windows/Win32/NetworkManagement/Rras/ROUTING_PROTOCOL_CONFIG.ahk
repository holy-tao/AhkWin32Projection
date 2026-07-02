#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PMGM_JOIN_ALERT_CALLBACK.ahk" { PMGM_JOIN_ALERT_CALLBACK }
#Import ".\PMGM_ENABLE_IGMP_CALLBACK.ahk" { PMGM_ENABLE_IGMP_CALLBACK }
#Import ".\PMGM_PRUNE_ALERT_CALLBACK.ahk" { PMGM_PRUNE_ALERT_CALLBACK }
#Import ".\PMGM_LOCAL_JOIN_CALLBACK.ahk" { PMGM_LOCAL_JOIN_CALLBACK }
#Import ".\PMGM_RPF_CALLBACK.ahk" { PMGM_RPF_CALLBACK }
#Import ".\PMGM_DISABLE_IGMP_CALLBACK.ahk" { PMGM_DISABLE_IGMP_CALLBACK }
#Import ".\PMGM_WRONG_IF_CALLBACK.ahk" { PMGM_WRONG_IF_CALLBACK }
#Import ".\PMGM_CREATION_ALERT_CALLBACK.ahk" { PMGM_CREATION_ALERT_CALLBACK }
#Import ".\PMGM_LOCAL_LEAVE_CALLBACK.ahk" { PMGM_LOCAL_LEAVE_CALLBACK }

/**
 * The ROUTING_PROTOCOL_CONFIG structure describes the routing protocol configuration information that is passed to the multicast group manager when a protocol registers with the multicast group manager.
 * @see https://learn.microsoft.com/windows/win32/api/mgm/ns-mgm-routing_protocol_config
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct ROUTING_PROTOCOL_CONFIG {
    #StructPack 8

    /**
     * Reserved for future use.
     */
    dwCallbackFlags : UInt32

    /**
     * Callback into a routing protocol to perform an RPF check.
     */
    pfnRpfCallback : PMGM_RPF_CALLBACK

    /**
     * Callback into a routing protocol to determine the subset of interfaces owned by the routing protocol on which a multicast packet from a new source or to a new group should be forwarded.
     */
    pfnCreationAlertCallback : PMGM_CREATION_ALERT_CALLBACK

    /**
     * Callback into a routing protocol to notify the protocol that receivers for the specified source and group are no longer present on an interface owned by other routing protocols.
     */
    pfnPruneAlertCallback : PMGM_PRUNE_ALERT_CALLBACK

    /**
     * Callback into a routing protocol to notify the protocol that new receivers for the specified source and group are present on an interface owned by another routing protocol.
     */
    pfnJoinAlertCallback : PMGM_JOIN_ALERT_CALLBACK

    /**
     * Callback into a routing protocol to notify the protocol that a packet has been received from the specified source and for the specified group on the wrong interface.
     */
    pfnWrongIfCallback : PMGM_WRONG_IF_CALLBACK

    /**
     * Callback into a routing protocol to notify the protocol that IGMP has detected new receivers for a group on an interface.
     */
    pfnLocalJoinCallback : PMGM_LOCAL_JOIN_CALLBACK

    /**
     * Callback into a routing protocol to notify the protocol that IGMP has detected that there are no more receivers for a group on an interface.
     */
    pfnLocalLeaveCallback : PMGM_LOCAL_LEAVE_CALLBACK

    /**
     * Callback into IGMP to notify IGMP that a protocol is taking or releasing ownership of an interface on which IGMP is enabled.
     */
    pfnDisableIgmpCallback : PMGM_DISABLE_IGMP_CALLBACK

    /**
     * Callback into IGMP to notify IGMP that a protocol has finished taking or releasing ownership of an interface on which IGMP is enabled.
     */
    pfnEnableIgmpCallback : PMGM_ENABLE_IGMP_CALLBACK

}
