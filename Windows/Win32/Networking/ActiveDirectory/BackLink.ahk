#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IADsBackLink interface provides methods for an ADSI client to access the Back Link attribute. You can call the property methods of this interface to obtain and modify the attribute.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsbacklink
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class BackLink extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
