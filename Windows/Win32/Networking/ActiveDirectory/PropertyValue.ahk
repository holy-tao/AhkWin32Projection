#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to represent the value of an IADsPropertyEntry object in a predefined data type.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadspropertyvalue
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class PropertyValue extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
