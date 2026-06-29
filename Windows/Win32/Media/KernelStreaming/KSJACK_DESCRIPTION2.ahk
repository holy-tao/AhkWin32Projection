#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The KSJACK_DESCRIPTION2 structure describes an audio jack.To get the description of an audio jack of a connector, call IKsJackDescription2::GetJackDescription2.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/ns-devicetopology-ksjack_description2
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSJACK_DESCRIPTION2 {
    #StructPack 4

    /**
     * Reserved for future use.
     */
    DeviceStateInfo : UInt32

    /**
     * Stores the audio jack's capabilities: jack presence detection capability 
     *                                        or dynamic format changing capability. The constants that can be stored in this member of the structure are defined in Ksmedia.h as follows:
     * 
     * <ul>
     * <li>JACKDESC2_PRESENCE_DETECT_CAPABILITY       (0x00000001)</li>
     * <li>JACKDESC2_DYNAMIC_FORMAT_CHANGE_CAPABILITY (0x00000002)
     * </li>
     * </ul>
     */
    JackCapabilities : UInt32

}
