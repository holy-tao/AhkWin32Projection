#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/WMP/location-attribute
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class Location extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
