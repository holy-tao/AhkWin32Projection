#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The following GUIDS define the different types of sensor profiles.
 * @see https://learn.microsoft.com/windows/win32/medfound/sensor-profile-guids
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class Sensor extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
