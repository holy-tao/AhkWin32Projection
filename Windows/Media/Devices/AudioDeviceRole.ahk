#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the role of an audio device.
 * @remarks
 * The AudioDeviceRole enumeration is used by the [GetDefaultAudioCaptureId](mediadevice_getdefaultaudiocaptureid_14449156.md) and [GetDefaultAudioRenderId](mediadevice_getdefaultaudiorenderid_1952019825.md) methods to specify the type of default audio device for capture or rendering.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicerole
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class AudioDeviceRole extends Win32Enum{

    /**
     * The audio device is used in the default role.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The audio device is used for communications.
     * @type {Integer (Int32)}
     */
    static Communications => 1
}
