#Requires AutoHotkey v2.0.0 64-bit

/**
 * The EDataFlow enumeration defines constants that indicate the direction in which audio data flows between an audio endpoint device and an application.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-edataflow">IMMDeviceEnumerator::GetDefaultAudioEndpoint</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-enumaudioendpoints">IMMDeviceEnumerator::EnumAudioEndpoints</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immendpoint-getdataflow">IMMEndpoint::GetDataFlow</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immnotificationclient-ondefaultdevicechanged">IMMNotificationClient::OnDefaultDeviceChanged</a> methods use the constants defined in the <b>EDataFlow</b> enumeration.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/ne-mmdeviceapi-edataflow
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class EDataFlow{

    /**
     * Audio rendering stream. Audio data flows from the application to the audio endpoint device, which renders the stream.
     * @type {Integer (Int32)}
     */
    static eRender => 0

    /**
     * Audio capture stream. Audio data flows from the audio endpoint device that captures the stream, to the application.
     * @type {Integer (Int32)}
     */
    static eCapture => 1

    /**
     * Audio rendering or capture stream. Audio data can flow either from the application to the audio endpoint device, or from the audio endpoint device to the application.
     * @type {Integer (Int32)}
     */
    static eAll => 2

    /**
     * The number of members in the <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-edataflow">EDataFlow</a> enumeration (not counting the EDataFlow_enum_count member).
     * @type {Integer (Int32)}
     */
    static EDataFlow_enum_count => 3
}
