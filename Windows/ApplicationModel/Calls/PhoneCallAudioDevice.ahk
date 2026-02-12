#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a hands-free (HF) phone call audio device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallaudiodevice
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallAudioDevice extends Win32Enum{

    /**
     * Specifies that the kind of device is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Specifies the device where the calling app is running. For example, a personal computer (PC).
     * @type {Integer (Int32)}
     */
    static LocalDevice => 1

    /**
     * Specifies a device that is connected to the local device via Bluetooth Hands-Free Profile (HFP) transport media. The remote device of interest in this case is a telephony device (phone).
     * @type {Integer (Int32)}
     */
    static RemoteDevice => 2
}
