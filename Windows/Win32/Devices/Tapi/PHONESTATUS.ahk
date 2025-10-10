#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PHONESTATUS structure describes the current status of a phone device. The phoneGetStatus and TSPI_phoneGetStatus functions return this structure.
 * @remarks
 * 
  * Device-specific extensions should use the DevSpecific (<b>dwDevSpecificSize</b> and <b>dwDevSpecificOffset</b>) variably sized area of this data structure.
  * 
  * The <b>dwPhoneFeatures</b> member is available only to applications that open the phone device with an API version of 2.0 or later.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-phonestatus
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONESTATUS extends Win32Struct
{
    static sizeof => 104

    static packingSize => 4

    /**
     * Total size allocated to this data structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size for this data structure that is needed to hold all the returned information, in bytes.
     * @type {Integer}
     */
    dwNeededSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     * @type {Integer}
     */
    dwUsedSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Status flags for this phone device. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonestatusflags--constants">PHONESTATUSFLAGS_ Constants</a>.
     * @type {Integer}
     */
    dwStatusFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Number of application modules with owner privilege for the phone.
     * @type {Integer}
     */
    dwNumOwners {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of application modules with monitor privilege for the phone.
     * @type {Integer}
     */
    dwNumMonitors {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Current ring mode of a phone device.
     * @type {Integer}
     */
    dwRingMode {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Current ring volume of a phone device. This is a value between 0x00000000 (silence) and 0x0000FFFF (maximum volume).
     * @type {Integer}
     */
    dwRingVolume {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Current hookswitch mode of the phone's handset. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchmode--constants">PHONEHOOKSWITCHMODE_ Constants</a>.
     * @type {Integer}
     */
    dwHandsetHookSwitchMode {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Current speaker volume of the phone's handset device. This is a value between 0x00000000 (silence) and 0x0000FFFF (maximum volume).
     * @type {Integer}
     */
    dwHandsetVolume {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Current microphone gain of the phone's handset device. This is a value between 0x00000000 (silence) and 0x0000FFFF (maximum gain).
     * @type {Integer}
     */
    dwHandsetGain {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Current hookswitch mode of the phone's speakerphone. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchmode--constants">PHONEHOOKSWITCHMODE_ Constants</a>.
     * @type {Integer}
     */
    dwSpeakerHookSwitchMode {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Current speaker volume of the phone's speaker device. This is a value between 0x00000000 (silence) and 0x0000FFFF (maximum volume).
     * @type {Integer}
     */
    dwSpeakerVolume {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Current microphone gain of the phone's speaker device. This is a value between 0x00000000 (silence) and 0x0000FFFF (maximum gain).
     * @type {Integer}
     */
    dwSpeakerGain {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Current hookswitch mode of the phone's headset. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchmode--constants">PHONEHOOKSWITCHMODE_ Constants</a>.
     * @type {Integer}
     */
    dwHeadsetHookSwitchMode {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Current speaker volume of the phone's headset device. This is a value between 0x00000000 (silence) and 0x0000FFFF (maximum volume).
     * @type {Integer}
     */
    dwHeadsetVolume {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Current microphone gain of the phone's headset device. This is a value between 0x00000000 (silence) and 0x0000FFFF (maximum gain).
     * @type {Integer}
     */
    dwHeadsetGain {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Size of the display information, in bytes.
     * @type {Integer}
     */
    dwDisplaySize {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Offset from the beginning of this structure to the variably sized field containing the phone's current display information. The size of the field is specified by <b>dwDisplaySize</b>.
     * @type {Integer}
     */
    dwDisplayOffset {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Size of the current lamp modes array, in bytes.
     * @type {Integer}
     */
    dwLampModesSize {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Offset from the beginning of this structure to the variably sized field containing the phone's current lamp modes. The size of the field is specified by <b>dwLampModesSize</b>.
     * @type {Integer}
     */
    dwLampModesOffset {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Size of the name of the current owner, including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwOwnerNameSize {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field containing the name of the application that is the current owner of the phone device. The name is the application name provided by the application when it invoked with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phoneinitialize">phoneInitialize</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phoneinitializeexa">phoneInitializeEx</a>. If no application name was supplied, the application's filename is used instead. The size of the field is specified by <b>dwOwnerNameSize</b>. If the phone currently has no owner, <b>dwOwnerNameSize</b> is zero.
     * @type {Integer}
     */
    dwOwnerNameOffset {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Size of the device-specific field, in bytes. If the device-specific information is a pointer to a string, the size must include the <b>null</b> terminator.
     * @type {Integer}
     */
    dwDevSpecificSize {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Offset from the beginning of this structure to the variably sized device-specific field. The size of the field is specified by <b>dwDevSpecificSize</b>.
     * @type {Integer}
     */
    dwDevSpecificOffset {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Flags that indicate which Telephony API functions can be invoked on the phone, considering the availability of the feature in the device capabilities, the current device state, and device ownership of the invoking application. A zero indicates the corresponding feature cannot be invoked by the application on the phone in its current state; a one indicates the feature can be invoked. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonefeature--constants">PHONEFEATURE_ Constants</a>.
     * @type {Integer}
     */
    dwPhoneFeatures {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }
}
