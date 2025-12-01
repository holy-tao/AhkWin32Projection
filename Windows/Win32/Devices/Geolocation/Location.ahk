#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The Location attribute is the geographic location of the radio station or \ 0034;Net only \ 0034;.
 * @remarks
 * This attribute is stored only in the library.
 * 
 * To determine whether you can change the value of this attribute, use the [Media.isReadOnlyItem](media-isreadonlyitem.md) method.
 * @see https://learn.microsoft.com/windows/win32/WMP/location-attribute
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class Location extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
