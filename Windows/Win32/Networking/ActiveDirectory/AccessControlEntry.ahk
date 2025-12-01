#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IADsAccessControlEntry interface is a dual interface that enables directory clients to access and manipulate individual access-control entries (ACEs) of the owning object.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsaccesscontrolentry
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class AccessControlEntry extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
