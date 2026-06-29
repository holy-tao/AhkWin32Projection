#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PHONESTATUS structure describes the current status of a phone device. The phoneGetStatus and TSPI_phoneGetStatus functions return this structure.
 * @remarks
 * Device-specific extensions should use the DevSpecific (<b>dwDevSpecificSize</b> and <b>dwDevSpecificOffset</b>) variably sized area of this data structure.
 * 
 * The <b>dwPhoneFeatures</b> member is available only to applications that open the phone device with an API version of 2.0 or later.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-phonestatus
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct PHONESTATUS {
    #StructPack 4

    /**
     * Total size allocated to this data structure, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * Size for this data structure that is needed to hold all the returned information, in bytes.
     */
    dwNeededSize : UInt32

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     */
    dwUsedSize : UInt32

    /**
     * Status flags for this phone device. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonestatusflags--constants">PHONESTATUSFLAGS_ Constants</a>.
     */
    dwStatusFlags : UInt32

    /**
     * Number of application modules with owner privilege for the phone.
     */
    dwNumOwners : UInt32

    /**
     * Number of application modules with monitor privilege for the phone.
     */
    dwNumMonitors : UInt32

    /**
     * Current ring mode of a phone device.
     */
    dwRingMode : UInt32

    /**
     * Current ring volume of a phone device. This is a value between 0x00000000 (silence) and 0x0000FFFF (maximum volume).
     */
    dwRingVolume : UInt32

    /**
     * Current hookswitch mode of the phone's handset. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchmode--constants">PHONEHOOKSWITCHMODE_ Constants</a>.
     */
    dwHandsetHookSwitchMode : UInt32

    /**
     * Current speaker volume of the phone's handset device. This is a value between 0x00000000 (silence) and 0x0000FFFF (maximum volume).
     */
    dwHandsetVolume : UInt32

    /**
     * Current microphone gain of the phone's handset device. This is a value between 0x00000000 (silence) and 0x0000FFFF (maximum gain).
     */
    dwHandsetGain : UInt32

    /**
     * Current hookswitch mode of the phone's speakerphone. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchmode--constants">PHONEHOOKSWITCHMODE_ Constants</a>.
     */
    dwSpeakerHookSwitchMode : UInt32

    /**
     * Current speaker volume of the phone's speaker device. This is a value between 0x00000000 (silence) and 0x0000FFFF (maximum volume).
     */
    dwSpeakerVolume : UInt32

    /**
     * Current microphone gain of the phone's speaker device. This is a value between 0x00000000 (silence) and 0x0000FFFF (maximum gain).
     */
    dwSpeakerGain : UInt32

    /**
     * Current hookswitch mode of the phone's headset. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchmode--constants">PHONEHOOKSWITCHMODE_ Constants</a>.
     */
    dwHeadsetHookSwitchMode : UInt32

    /**
     * Current speaker volume of the phone's headset device. This is a value between 0x00000000 (silence) and 0x0000FFFF (maximum volume).
     */
    dwHeadsetVolume : UInt32

    /**
     * Current microphone gain of the phone's headset device. This is a value between 0x00000000 (silence) and 0x0000FFFF (maximum gain).
     */
    dwHeadsetGain : UInt32

    /**
     * Size of the display information, in bytes.
     */
    dwDisplaySize : UInt32

    /**
     * Offset from the beginning of this structure to the variably sized field containing the phone's current display information. The size of the field is specified by <b>dwDisplaySize</b>.
     */
    dwDisplayOffset : UInt32

    /**
     * Size of the current lamp modes array, in bytes.
     */
    dwLampModesSize : UInt32

    /**
     * Offset from the beginning of this structure to the variably sized field containing the phone's current lamp modes. The size of the field is specified by <b>dwLampModesSize</b>.
     */
    dwLampModesOffset : UInt32

    /**
     * Size of the name of the current owner, including the <b>null</b> terminator, in bytes.
     */
    dwOwnerNameSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized field containing the name of the application that is the current owner of the phone device. The name is the application name provided by the application when it invoked with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phoneinitialize">phoneInitialize</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phoneinitializeexa">phoneInitializeEx</a>. If no application name was supplied, the application's filename is used instead. The size of the field is specified by <b>dwOwnerNameSize</b>. If the phone currently has no owner, <b>dwOwnerNameSize</b> is zero.
     */
    dwOwnerNameOffset : UInt32

    /**
     * Size of the device-specific field, in bytes. If the device-specific information is a pointer to a string, the size must include the <b>null</b> terminator.
     */
    dwDevSpecificSize : UInt32

    /**
     * Offset from the beginning of this structure to the variably sized device-specific field. The size of the field is specified by <b>dwDevSpecificSize</b>.
     */
    dwDevSpecificOffset : UInt32

    /**
     * Flags that indicate which Telephony API functions can be invoked on the phone, considering the availability of the feature in the device capabilities, the current device state, and device ownership of the invoking application. A zero indicates the corresponding feature cannot be invoked by the application on the phone in its current state; a one indicates the feature can be invoked. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonefeature--constants">PHONEFEATURE_ Constants</a>.
     */
    dwPhoneFeatures : UInt32

}
