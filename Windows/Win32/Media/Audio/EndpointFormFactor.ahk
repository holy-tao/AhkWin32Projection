#Requires AutoHotkey v2.0.0 64-bit

/**
 * The EndpointFormFactor enumeration defines constants that indicate the general physical attributes of an audio endpoint device.
 * @remarks
 * The constants in this enumeration are the values that can be assigned to the <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/pkey-audioendpoint-formfactor">PKEY_AudioEndpoint_FormFactor</a> property.
  * 
  * In digital pass-through mode, a digital interface transports blocks of non-PCM data through a connection without modifying them and without attempting to interpret their contents. For more information about digital pass-through mode, see the following documentation:
  * 
  * <ul>
  * <li>The descriptions of the WAVE_FORMAT_WMA_SPDIF and WAVE_FORMAT_DOLBY_AC3_SPDIF wave-format tags in the Windows DDK documentation.</li>
  * <li>The white paper titled "Audio Driver Support for the WMA Pro-over-S/PDIF Format" at the <a href="https://www.microsoft.com/whdc/device/audio/default.mspx">Audio Device Technologies for Windows</a> website.</li>
  * </ul>
  * For information about obtaining a description of the audio jack or connector through which an audio endpoint device connects to an audio adapter, see <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iksjackdescription-getjackdescription">IKsJackDescription::GetJackDescription</a> and <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iksjackdescription2-getjackdescription2">IKsJackDescription2::GetJackDescription2</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-endpointformfactor
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class EndpointFormFactor{

    /**
     * An audio endpoint device that the user accesses remotely through a network.
     * @type {Integer (Int32)}
     */
    static RemoteNetworkDevice => 0

    /**
     * A set of speakers.
     * @type {Integer (Int32)}
     */
    static Speakers => 1

    /**
     * An audio endpoint device that sends a line-level analog signal to a line-input jack on an audio adapter or that receives a line-level analog signal from a line-output jack on the adapter.
     * @type {Integer (Int32)}
     */
    static LineLevel => 2

    /**
     * A set of headphones.
     * @type {Integer (Int32)}
     */
    static Headphones => 3

    /**
     * A microphone.
     * @type {Integer (Int32)}
     */
    static Microphone => 4

    /**
     * An earphone or a pair of earphones with an attached mouthpiece for two-way communication.
     * @type {Integer (Int32)}
     */
    static Headset => 5

    /**
     * The part of a telephone that is held in the hand and that contains a speaker and a microphone for two-way communication.
     * @type {Integer (Int32)}
     */
    static Handset => 6

    /**
     * An audio endpoint device that connects to an audio adapter through a connector for a digital interface of unknown type that transmits non-PCM data in digital pass-through mode. For more information, see Remarks.
     * @type {Integer (Int32)}
     */
    static UnknownDigitalPassthrough => 7

    /**
     * An audio endpoint device that connects to an audio adapter through a Sony/Philips Digital Interface (S/PDIF) connector.
     * @type {Integer (Int32)}
     */
    static SPDIF => 8

    /**
     * An audio endpoint device that connects to an audio adapter through a High-Definition Multimedia Interface (HDMI) connector or a display port.
 * 
 * In <b>Windows Vista</b>, this value was named HDMI.
     * @type {Integer (Int32)}
     */
    static DigitalAudioDisplayDevice => 9

    /**
     * An audio endpoint device with unknown physical attributes.
     * @type {Integer (Int32)}
     */
    static UnknownFormFactor => 10

    /**
     * Windows 7: Maximum number of endpoint form factors.
     * @type {Integer (Int32)}
     */
    static EndpointFormFactor_enum_count => 11
}
