#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the object's properties and methods.
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/ns-oleauto-interfacedata
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class INTERFACEDATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An array of METHODDATA structures.
     * @type {Pointer<METHODDATA>}
     */
    pmethdata {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The count of members.
     * @type {Integer}
     */
    cMembers {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
