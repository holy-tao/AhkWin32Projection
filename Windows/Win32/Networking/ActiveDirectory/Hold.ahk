#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IADsHold interface provides methods for an ADSI client to access the Hold attribute.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadshold
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class Hold extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
