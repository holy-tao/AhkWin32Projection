#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PHONECAPS structure describes the capabilities of a phone device. The phoneGetDevCaps and TSPI_phoneGetDevCaps functions return this structure.
 * @remarks
 * 
 * Device-specific extensions should use the DevSpecific (<b>dwDevSpecificSize</b> and <b>dwDevSpecificOffset</b>) variably sized area of this data structure.
 * 
 * The members <b>dwDeviceClassesSize</b> through <b>dwMonitoredHeadsetHookSwitchModes</b> are available only to applications that open the phone device with an API version of 2.0 or later.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-phonecaps
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONECAPS extends Win32Struct
{
    static sizeof => 192

    static packingSize => 8

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
     * Size of the provider-specific information, in bytes. If the provider-specific information is a pointer to a string, the size must include the <b>null</b> terminator.
     * @type {Integer}
     */
    dwProviderInfoSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Offset from the beginning of the structure to the variably sized field containing service provider-specific information. 
     * 
     * 
     * 
     * 
     * This member provides information about the provider hardware and/or software, such as the vendor name and version numbers of hardware and software. This information can be useful when a user needs to call customer service with problems regarding the provider. The size of the field is specified by <b>dwProviderInfoSize</b>.
     * @type {Integer}
     */
    dwProviderInfoOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Size of the phone-specific information, in bytes. If the phone-specific information is a pointer to a string, the size must include the <b>null</b> terminator.
     * @type {Integer}
     */
    dwPhoneInfoSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Offset from the beginning of the structure to the variably sized device field containing phone-specific information. 
     * 
     * 
     * 
     * 
     * This member provides information about the attached phone device, such as the phone device manufacturer, the model name, the software version, and so on. This information can be useful when a user needs to call customer service with problems regarding the phone. The size of the field is specified by <b>dwPhoneInfoSize</b>.
     * @type {Integer}
     */
    dwPhoneInfoOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Permanent identifier by which the phone device is known in the system's configuration.
     * @type {Integer}
     */
    dwPermanentPhoneID {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Size of the configurable name for the phone, including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwPhoneNameSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Offset from the beginning of the structure to the variably sized device field containing a user configurable name for this phone device. This name can be configured by the user when configuring the phone device's service provider and is provided for the user's convenience. The size of the field is specified by <b>dwPhoneNameSize</b>.
     * @type {Integer}
     */
    dwPhoneNameOffset {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * String format to be used with this phone device. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/stringformat--constants">STRINGFORMAT_ Constants</a>.
     * @type {Integer}
     */
    dwStringFormat {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * State changes for this phone device for which the application can be notified in a 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phone-state">PHONE_STATE</a> message. This member one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonestate--constants">PHONESTATE_ Constants</a>.
     * @type {Integer}
     */
    dwPhoneStates {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Phone's hookswitch devices. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchdev--constants">PHONEHOOKSWITCHDEV_ Constants</a>.
     * @type {Integer}
     */
    dwHookSwitchDevs {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Hookswitch mode of the handset. The member is only meaningful if the hookswitch device is listed in <b>dwHookSwitchDevs</b>. It uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchmode--constants">PHONEHOOKSWITCHMODE_ Constants</a>.
     * @type {Integer}
     */
    dwHandsetHookSwitchModes {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Hookswitch mode of the speaker. The member is only meaningful if the hookswitch device is listed in <b>dwHookSwitchDevs</b>. It uses one of the PHONEHOOKSWITCHMODE_ Constants.
     * @type {Integer}
     */
    dwSpeakerHookSwitchModes {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Hookswitch mode of the headset. The member is only meaningful if the hookswitch device is listed in <b>dwHookSwitchDevs</b>. It uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchmode--constants">PHONEHOOKSWITCHMODE_ Constants</a>.
     * @type {Integer}
     */
    dwHeadsetHookSwitchModes {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Volume-setting capabilities of the phone device's speaker components. If the bit in position PHONEHOOKSWITCHDEV_ is <b>TRUE</b>, the volume of the corresponding hookswitch device's speaker component can be adjusted with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonesetvolume">phoneSetVolume</a>.
     * @type {Integer}
     */
    dwVolumeFlags {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Gain-setting capabilities of the phone device's microphone components. If the bit position PHONEHOOKSWITCHDEV_ is <b>TRUE</b>, the volume of the corresponding hookswitch device's microphone component can be adjusted with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonesetgain">phoneSetGain</a>.
     * @type {Integer}
     */
    dwGainFlags {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Display capabilities of the phone device by describing the number of rows in the phone display. The <b>dwDisplayNumRows</b> and <b>dwDisplayNumColumns</b> members are both zero for a phone device without a display.
     * @type {Integer}
     */
    dwDisplayNumRows {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Display capabilities of the phone device by describing the number of columns in the phone display. The <b>dwDisplayNumRows</b> and <b>dwDisplayNumColumns</b> members are both zero for a phone device without a display.
     * @type {Integer}
     */
    dwDisplayNumColumns {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Ring capabilities of the phone device. The phone is able to ring with <b>dwNumRingModes</b> different ring patterns, identified as 1, 2, through <b>dwNumRingModes</b> minus one. If the value of this member is 0, applications have no control over the ring mode of the phone. If the value of this member is greater than 0, it indicates the number of ring modes in addition to silence that are supported by the service provider. A value of 0 in the <i>lpdwRingMode</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetring">phoneGetRing</a> or the <i>dwRingMode</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonesetring">phoneSetRing</a> indicates silence (the phone is not ringing or should not be rung), and <i>dwRingMode</i> values of 1 to <b>dwNumRingModes</b> are valid ring modes for the phone device.
     * @type {Integer}
     */
    dwNumRingModes {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Number of button/lamps on the phone device that are detectable in TAPI. Button/lamps are identified by their identifier. Valid button/lamp identifiers range from zero to <b>dwNumButtonLamps</b> minus one. The keypad buttons '0', through '9', '*', and '#' are assigned the identifiers 0 through 12.
     * @type {Integer}
     */
    dwNumButtonLamps {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Size of the button modes array, in bytes.
     * @type {Integer}
     */
    dwButtonModesSize {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Offset from the beginning of this structure to the variably sized field containing the button modes of the phone's buttons. The array is indexed by button/lamp identifier. This array uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonebuttonmode--constants">PHONEBUTTONMODE_ Constants</a>. The size of the array is specified by <b>dwButtonModesSize</b>.
     * @type {Integer}
     */
    dwButtonModesOffset {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Size of the button functions field, in bytes.
     * @type {Integer}
     */
    dwButtonFunctionsSize {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Offset from the beginning of this structure to the variably sized field containing the button functions of the phone's buttons. The array is indexed by button/lamp identifier. This array uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonebuttonfunction--constants">PHONEBUTTONFUNCTION_ Constants</a>. The size of the array is specified by <b>dwButtonFunctionsSize</b>.
     * @type {Integer}
     */
    dwButtonFunctionsOffset {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Size of the lamp modes array, in bytes.
     * @type {Integer}
     */
    dwLampModesSize {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Offset from the beginning of this structure to the variably sized field containing the lamp modes of the phone's lamps. The array is indexed by button/lamp identifier. This array uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonelampmode--constants">PHONELAMPMODE_ Constants</a>. The size of the array is specified by <b>dwLampModesSize</b>.
     * @type {Integer}
     */
    dwLampModesOffset {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Number of different download areas in the phone device. The different areas are referred to using the data IDs 0, 1, , <b>dwNumSetData</b> minus one. If this member is zero, the phone does not support the download capability.
     * @type {Integer}
     */
    dwNumSetData {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Size of the data size array, in bytes.
     * @type {Integer}
     */
    dwSetDataSize {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Offset from the beginning of this structure to the variably sized field containing the sizes (in bytes) of the phone's download data areas. This is an array with <b>DWORD</b>-sized elements indexed by data identifier. The size of the array is specified by <b>dwSetDataSize</b>.
     * @type {Integer}
     */
    dwSetDataOffset {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Number of different upload areas in the phone device. The different areas are referred to using the data IDs 0, 1, , <b>dwNumGetData</b> minus one. If this field is zero, the phone does not support the upload capability.
     * @type {Integer}
     */
    dwNumGetData {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * Size of the data size array, in bytes.
     * @type {Integer}
     */
    dwGetDataSize {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Offset from the beginning of this structure to the variably sized field containing the sizes (in bytes) of the phone's upload data areas. This is an array with <b>DWORD</b>-sized elements indexed by data identifier. The size of the array is specified by <b>dwGetDataSize</b>.
     * @type {Integer}
     */
    dwGetDataOffset {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Size of the device-specific field, in bytes. If the device specific information is a pointer to a string, the size must include the <b>null</b> terminator.
     * @type {Integer}
     */
    dwDevSpecificSize {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Offset from the beginning of this structure to the variably sized device-specific field. The size of the field is specified by <b>dwDevSpecificSize</b>.
     * @type {Integer}
     */
    dwDevSpecificOffset {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * Size of the supported device class identifiers, in bytes.
     * @type {Integer}
     */
    dwDeviceClassesSize {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * Offset from the beginning of this structure to a string consisting of the device class identifiers supported on this device for use with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetid">phoneGetID</a>. The identifiers are separated by <b>NULL</b>s, and the last identifier in the list is followed by two <b>NULL</b>s. The size of the field is specified by <b>dwDeviceClassesSize</b>.
     * @type {Integer}
     */
    dwDeviceClassesOffset {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * Flags that indicate which Telephony API functions can be invoked on the phone. A zero indicates the corresponding feature is not implemented and can never be invoked by the application on the phone; a one indicates the feature may be invoked depending on the device state and other factors. This member uses 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonefeature--constants">PHONEFEATURE_ Constants</a>.
     * @type {Integer}
     */
    dwPhoneFeatures {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchmode--constants">PHONEHOOKSWITCHMODE_</a> values that can be set on the handset using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonesethookswitch">phoneSetHookSwitch</a>.
     * @type {Integer}
     */
    dwSettableHandsetHookSwitchModes {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * PHONEHOOKSWITCHMODE_ values that can be set on the speakerphone using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonesethookswitch">phoneSetHookSwitch</a>.
     * @type {Integer}
     */
    dwSettableSpeakerHookSwitchModes {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * PHONEHOOKSWITCHMODE_ values that can be set on the headset using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonesethookswitch">phoneSetHookSwitch</a>.
     * @type {Integer}
     */
    dwSettableHeadsetHookSwitchModes {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * PHONEHOOKSWITCHMODE_ values that can be detected and reported for the handset in a 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phone-state">PHONE_STATE</a> message and by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegethookswitch">phoneGetHookSwitch</a>.
     * @type {Integer}
     */
    dwMonitoredHandsetHookSwitchModes {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * PHONEHOOKSWITCHMODE_ values that can be detected and reported for the speakerphone in a PHONE_STATE message and by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonesethookswitch">phoneSetHookSwitch</a>.
     * @type {Integer}
     */
    dwMonitoredSpeakerHookSwitchModes {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phonehookswitchmode--constants">PHONEHOOKSWITCHMODE_</a> values that can be detected and reported for the headset in a PHONE_STATE message and by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonesethookswitch">phoneSetHookSwitch</a>.
     * @type {Integer}
     */
    dwMonitoredHeadsetHookSwitchModes {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * The GUID permanently associated with this phone.
     * @type {Pointer<Guid>}
     */
    PermanentPhoneGuid {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }
}
