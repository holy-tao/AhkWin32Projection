#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IADsTypedName interface provides methods for an ADSI client to access the Typed Name attribute.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadstypedname
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class TypedName extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
