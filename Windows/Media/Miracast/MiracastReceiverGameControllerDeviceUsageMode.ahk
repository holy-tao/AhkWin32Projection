#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies how game controller input is being used when transmitted to a Miracast Transmitter. Game controller input can be transmitted as-is, or it can be mapped to mouse and keyboard input.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivergamecontrollerdeviceusagemode
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverGameControllerDeviceUsageMode extends Win32Enum{

    /**
     * Input from the game controller is used as-is.
     * @type {Integer (Int32)}
     */
    static AsGameController => 0

    /**
     * Input from the game controller is converted to mouse and keyboard input.
     * @type {Integer (Int32)}
     */
    static AsMouseAndKeyboard => 1
}
