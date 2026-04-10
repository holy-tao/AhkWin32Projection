#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IADsDNWithBinary interface provides methods for an ADSI client to associate a distinguished name (DN) with the GUID of an object.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsdnwithbinary
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
class DNWithBinary extends Win32Struct {
    static sizeof => 0

    static packingSize => 1
}
