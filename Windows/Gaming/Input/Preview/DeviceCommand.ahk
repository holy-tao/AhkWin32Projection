#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Commands that can be executed on a GIP (Gaming Input Protocol) headset.
 * @remarks
 * > [!CAUTION]
 * > To avoid damaging devices, the headset control APIs should only be used with hardware you have developed.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.devicecommand
 * @namespace Windows.Gaming.Input.Preview
 * @version WindowsRuntime 1.4
 */
class DeviceCommand extends Win32Enum{

    /**
     * Resets the headset.
     * @type {Integer (Int32)}
     */
    static Reset => 0
}
