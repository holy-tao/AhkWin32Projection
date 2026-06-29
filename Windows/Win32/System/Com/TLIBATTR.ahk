#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SYSKIND.ahk

/**
 * Contains information about a type library. Information from this structure is used to identify the type library and to provide national language support for member names.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-tlibattr
 * @namespace Windows.Win32.System.Com
 */
class TLIBATTR extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * The globally unique identifier.
     * @type {Guid}
     */
    guid {
        get {
            if(!this.HasProp("__guid"))
                this.__guid := Guid(0, this)
            return this.__guid
        }
    }

    /**
     * The locale identifier.
     * @type {Integer}
     */
    lcid {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The target hardware platform.
     * @type {SYSKIND}
     */
    syskind {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * The major version number.
     * @type {Integer}
     */
    wMajorVerNum {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * The minor version number.
     * @type {Integer}
     */
    wMinorVerNum {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * The library flags.
     * @type {Integer}
     */
    wLibFlags {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }
}
