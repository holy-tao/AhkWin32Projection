#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the status of the audio device module command, executed with a call to [AudioDeviceModule.SendCommand](audiodevicemodule_sendcommandasync_78202797.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.sendcommandstatus
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class SendCommandStatus extends Win32Enum{

    /**
     * The command was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The command failed because device is not available.
     * @type {Integer (Int32)}
     */
    static DeviceNotAvailable => 1
}
