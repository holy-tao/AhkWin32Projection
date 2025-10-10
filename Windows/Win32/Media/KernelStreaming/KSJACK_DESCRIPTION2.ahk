#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The KSJACK_DESCRIPTION2 structure describes an audio jack.To get the description of an audio jack of a connector, call IKsJackDescription2::GetJackDescription2.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/ns-devicetopology-ksjack_description2
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSJACK_DESCRIPTION2 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    DeviceStateInfo {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Stores the audio jack's capabilities: jack presence detection capability 
     *                                        or dynamic format changing capability. The constants that can be stored in this member of the structure are defined in Ksmedia.h as follows:
     * 
     * <ul>
     * <li>JACKDESC2_PRESENCE_DETECT_CAPABILITY       (0x00000001)</li>
     * <li>JACKDESC2_DYNAMIC_FORMAT_CHANGE_CAPABILITY (0x00000002)
     * </li>
     * </ul>
     * @type {Integer}
     */
    JackCapabilities {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
