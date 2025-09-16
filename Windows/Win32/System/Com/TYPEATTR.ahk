#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TYPEDESC.ahk
#Include .\IDLDESC.ahk

/**
 * Contains attributes of a type.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-typeattr
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class TYPEATTR extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The GUID of the type information.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The locale of member names and documentation strings.
     * @type {Integer}
     */
    lcid {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The constructor ID, or MEMBERID_NIL if none.
     * @type {Integer}
     */
    memidConstructor {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The destructor ID, or MEMBERID_NIL if none.
     * @type {Integer}
     */
    memidDestructor {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Reserved.
     * @type {Pointer<PWSTR>}
     */
    lpstrSchema {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The size of an instance of this type.
     * @type {Integer}
     */
    cbSizeInstance {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The kind of type.
     * @type {Integer}
     */
    typekind {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * The number of functions.
     * @type {Integer}
     */
    cFuncs {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * The number of variables or data members.
     * @type {Integer}
     */
    cVars {
        get => NumGet(this, 42, "ushort")
        set => NumPut("ushort", value, this, 42)
    }

    /**
     * The number of implemented interfaces.
     * @type {Integer}
     */
    cImplTypes {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * The size of this type's VTBL.
     * @type {Integer}
     */
    cbSizeVft {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }

    /**
     * The byte alignment for an instance of this type. A value of 0 indicates alignment on the 64K boundary; 1 indicates no special alignment. For other values, <i>n</i> indicates aligned on byte <i>n</i>.
     * @type {Integer}
     */
    cbAlignment {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * The type flags. See <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ne-oaidl-typeflags">TYPEFLAGS</a>.
     * @type {Integer}
     */
    wTypeFlags {
        get => NumGet(this, 50, "ushort")
        set => NumPut("ushort", value, this, 50)
    }

    /**
     * The major version number.
     * @type {Integer}
     */
    wMajorVerNum {
        get => NumGet(this, 52, "ushort")
        set => NumPut("ushort", value, this, 52)
    }

    /**
     * The minor version number.
     * @type {Integer}
     */
    wMinorVerNum {
        get => NumGet(this, 54, "ushort")
        set => NumPut("ushort", value, this, 54)
    }

    /**
     * If <b>typekind</b> is TKIND_ALIAS, specifies the type for which this type is an alias.
     * @type {TYPEDESC}
     */
    tdescAlias{
        get {
            if(!this.HasProp("__tdescAlias"))
                this.__tdescAlias := TYPEDESC(this.ptr + 56)
            return this.__tdescAlias
        }
    }

    /**
     * The IDL attributes of the described type.
     * @type {IDLDESC}
     */
    idldescType{
        get {
            if(!this.HasProp("__idldescType"))
                this.__idldescType := IDLDESC(this.ptr + 72)
            return this.__idldescType
        }
    }
}
