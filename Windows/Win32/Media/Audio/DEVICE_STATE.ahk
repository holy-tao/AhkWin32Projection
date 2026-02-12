#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DEVICE\_STATE\_XXX constants indicate the current state of an audio endpoint device.
 * @remarks
 * The [**IMMDeviceEnumerator::EnumAudioEndpoints**](/windows/desktop/api/Mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-enumaudioendpoints), [**IMMDevice::GetState**](/windows/desktop/api/Mmdeviceapi/nf-mmdeviceapi-immdevice-getstate), and [**IMMNotificationClient::OnDeviceStateChanged**](/windows/desktop/api/Mmdeviceapi/nf-mmdeviceapi-immnotificationclient-ondevicestatechanged) methods use the DEVICE\_STATE\_XXX constants. These methods enable clients to obtain information about endpoint devices that are in any of the states represented by the DEVICE\_STATE\_XXX constants.
 * 
 * However, a client can open a stream (for example, by obtaining an [**IAudioClient**](/windows/desktop/api/Audioclient/nn-audioclient-iaudioclient) interface for the device) only on a device that is in the DEVICE\_STATE\_ACTIVE state.
 * 
 * The Windows multimedia control panel, Mmsys.cpl, displays the audio endpoint devices in the system. Disabling a device in Mmsys.cpl hides the device from the device-discovery mechanisms in higher-level audio APIs, but it does not invalidate any stream objects that a client might have instantiated before the device was disabled. For example, if a stream is playing on the device when the user disables it in Mmsys.cpl, the stream continues to play uninterrupted.
 * 
 * In contrast, disabling a device in Device Manager effectively removes the device from the system.
 * 
 * To use Mmsys.cpl to view the rendering devices, open a Command Prompt window and enter the following command:
 * 
 * **control mmsys.cpl,,0**
 * 
 * To view the capture devices, enter the following command:
 * 
 * **control mmsys.cpl,,1**
 * 
 * Alternatively, you can view the rendering devices or the capture devices in Mmsys.cpl by right-clicking the speaker icon in the notification area, which is located on the right side of the taskbar, and selecting **Playback Devices** or **Recording Devices**.
 * 
 * Mmsys.cpl always displays endpoint devices that are in the DEVICE\_STATE\_ACTIVE state. In addition, it can be configured to display disabled and disconnected devices.
 * 
 * To view endpoint devices that are in the DEVICE\_STATE\_DISABLED and DEVICE\_STATE\_NOTPRESENT states, right-click in the Mmsys.cpl window and select the **Show Disabled Devices** option.
 * 
 * To view endpoint devices that are in the DEVICE\_STATE\_UNPLUGGED state, right-click in the Mmsys.cpl window and select the **Show Disconnected Devices** option.
 * 
 * To view only endpoint devices that are in the DEVICE\_STATE\_ACTIVE state, deselect both the **Show Disabled Devices** and **Show Disconnected Devices** options.
 * 
 * To enable or disable an endpoint device in Mmsys.cpl, click **Playback** or **Recording**, depending on whether the device is a playback or recording device. Next, select the device and click **Properties**. In the **Properties** window, next to **Device usage**, select either **Use this device (enable)** or **Don't use this device (disable)**.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/CoreAudio/device-state-xxx-constants
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class DEVICE_STATE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_STATE_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_STATE_DISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_STATE_NOTPRESENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_STATE_UNPLUGGED => 8
}
