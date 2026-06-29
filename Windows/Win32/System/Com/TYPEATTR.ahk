#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TYPEKIND.ahk
#Include .\IDLFLAGS.ahk
#Include ..\Ole\ARRAYDESC.ahk
#Include ..\Variant\VARENUM.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\TYPEDESC.ahk
#Include .\IDLDESC.ahk

/**
 * Contains attributes of a type.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-typeattr
 * @namespace Windows.Win32.System.Com
 */
class TYPEATTR extends Win32Struct {
    static sizeof => 96

    static packingSize => 8

    /**
     * The GUID of the type information.
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
     * The locale of member names and documentation strings.
     * @type {Integer}
     */
    lcid {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The constructor ID, or MEMBERID_NIL if none.
     * @type {Integer}
     */
    memidConstructor {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The destructor ID, or MEMBERID_NIL if none.
     * @type {Integer}
     */
    memidDestructor {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Reserved.
     * @type {PWSTR}
     */
    lpstrSchema {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The size of an instance of this type.
     * @type {Integer}
     */
    cbSizeInstance {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The kind of type.
     * @type {TYPEKIND}
     */
    typekind {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * The number of functions.
     * @type {Integer}
     */
    cFuncs {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * The number of variables or data members.
     * @type {Integer}
     */
    cVars {
        get => NumGet(this, 50, "ushort")
        set => NumPut("ushort", value, this, 50)
    }

    /**
     * The number of implemented interfaces.
     * @type {Integer}
     */
    cImplTypes {
        get => NumGet(this, 52, "ushort")
        set => NumPut("ushort", value, this, 52)
    }

    /**
     * The size of this type's VTBL.
     * @type {Integer}
     */
    cbSizeVft {
        get => NumGet(this, 54, "ushort")
        set => NumPut("ushort", value, this, 54)
    }

    /**
     * The byte alignment for an instance of this type. A value of 0 indicates alignment on the 64K boundary; 1 indicates no special alignment. For other values, <i>n</i> indicates aligned on byte <i>n</i>.
     * @type {Integer}
     */
    cbAlignment {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * The type flags. See <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ne-oaidl-typeflags">TYPEFLAGS</a>.
     * @type {Integer}
     */
    wTypeFlags {
        get => NumGet(this, 58, "ushort")
        set => NumPut("ushort", value, this, 58)
    }

    /**
     * The major version number.
     * @type {Integer}
     */
    wMajorVerNum {
        get => NumGet(this, 60, "ushort")
        set => NumPut("ushort", value, this, 60)
    }

    /**
     * The minor version number.
     * @type {Integer}
     */
    wMinorVerNum {
        get => NumGet(this, 62, "ushort")
        set => NumPut("ushort", value, this, 62)
    }

    /**
     * If <b>typekind</b> is TKIND_ALIAS, specifies the type for which this type is an alias.
     * @type {TYPEDESC}
     */
    tdescAlias {
        get {
            if(!this.HasProp("__tdescAlias"))
                this.__tdescAlias := TYPEDESC(64, this)
            return this.__tdescAlias
        }
    }

    /**
     * The IDL attributes of the described type.
     * @type {IDLDESC}
     */
    idldescType {
        get {
            if(!this.HasProp("__idldescType"))
                this.__idldescType := IDLDESC(80, this)
            return this.__idldescType
        }
    }
}
