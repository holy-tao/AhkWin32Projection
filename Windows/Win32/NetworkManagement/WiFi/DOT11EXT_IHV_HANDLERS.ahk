#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_IHV_HANDLERS {
    #StructPack 8

    Dot11ExtIhvDeinitService : IntPtr

    Dot11ExtIhvInitAdapter : IntPtr

    Dot11ExtIhvDeinitAdapter : IntPtr

    Dot11ExtIhvPerformPreAssociate : IntPtr

    Dot11ExtIhvAdapterReset : IntPtr

    Dot11ExtIhvPerformPostAssociate : IntPtr

    Dot11ExtIhvStopPostAssociate : IntPtr

    Dot11ExtIhvValidateProfile : IntPtr

    Dot11ExtIhvPerformCapabilityMatch : IntPtr

    Dot11ExtIhvCreateDiscoveryProfiles : IntPtr

    Dot11ExtIhvProcessSessionChange : IntPtr

    Dot11ExtIhvReceiveIndication : IntPtr

    Dot11ExtIhvReceivePacket : IntPtr

    Dot11ExtIhvSendPacketCompletion : IntPtr

    Dot11ExtIhvIsUIRequestPending : IntPtr

    Dot11ExtIhvProcessUIResponse : IntPtr

    Dot11ExtIhvQueryUIRequest : IntPtr

    Dot11ExtIhvOnexIndicateResult : IntPtr

    Dot11ExtIhvControl : IntPtr

}
