#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a type library. Information from this structure is used to identify the type library and to provide national language support for member names.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-tlibattr
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class TLIBATTR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The globally unique identifier.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The locale identifier.
     * @type {Integer}
     */
    lcid {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The target hardware platform.
     * @type {Integer}
     */
    syskind {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The major version number.
     * @type {Integer}
     */
    wMajorVerNum {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * The minor version number.
     * @type {Integer}
     */
    wMinorVerNum {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * The library flags.
     * @type {Integer}
     */
    wLibFlags {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }
}
