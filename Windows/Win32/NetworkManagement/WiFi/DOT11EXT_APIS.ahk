#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_APIS {
    #StructPack 8

    Dot11ExtAllocateBuffer : IntPtr

    Dot11ExtFreeBuffer : IntPtr

    Dot11ExtSetProfileCustomUserData : IntPtr

    Dot11ExtGetProfileCustomUserData : IntPtr

    Dot11ExtSetCurrentProfile : IntPtr

    Dot11ExtSendUIRequest : IntPtr

    Dot11ExtPreAssociateCompletion : IntPtr

    Dot11ExtPostAssociateCompletion : IntPtr

    Dot11ExtSendNotification : IntPtr

    Dot11ExtSendPacket : IntPtr

    Dot11ExtSetEtherTypeHandling : IntPtr

    Dot11ExtSetAuthAlgorithm : IntPtr

    Dot11ExtSetUnicastCipherAlgorithm : IntPtr

    Dot11ExtSetMulticastCipherAlgorithm : IntPtr

    Dot11ExtSetDefaultKey : IntPtr

    Dot11ExtSetKeyMappingKey : IntPtr

    Dot11ExtSetDefaultKeyId : IntPtr

    Dot11ExtNicSpecificExtension : IntPtr

    Dot11ExtSetExcludeUnencrypted : IntPtr

    Dot11ExtStartOneX : IntPtr

    Dot11ExtStopOneX : IntPtr

    Dot11ExtProcessSecurityPacket : IntPtr

}
