#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\LIFE_TIME.ahk
#Include .\DIAG_SOCKADDR.ahk
#Include .\OCTET_STRING.ahk

/**
 * The HELPER_ATTRIBUTE structure contains all NDF supported data types.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ns-ndattrib-helper_attribute
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class HELPER_ATTRIBUTE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>[string] LPWSTR</b>
     * 
     * A pointer to a null-terminated string that contains the name of the attribute.
     * @type {Pointer<Ptr>}
     */
    pwszName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ne-ndattrib-attribute_type">ATTRIBUTE_TYPE</a></b>
     * 
     * The type of helper attribute.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Boolean {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Char {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Byte {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Short {
        get => NumGet(this, 12, "short")
        set => NumPut("short", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Word {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Int {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    DWord {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Int64 {
        get => NumGet(this, 12, "int64")
        set => NumPut("int64", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    UInt64 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    PWStr {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Pointer<Guid>}
     */
    Guid {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {LIFE_TIME}
     */
    LifeTime{
        get {
            if(!this.HasProp("__LifeTime"))
                this.__LifeTime := LIFE_TIME(this.ptr + 12)
            return this.__LifeTime
        }
    }

    /**
     * @type {DIAG_SOCKADDR}
     */
    Address{
        get {
            if(!this.HasProp("__Address"))
                this.__Address := DIAG_SOCKADDR(this.ptr + 12)
            return this.__Address
        }
    }

    /**
     * @type {OCTET_STRING}
     */
    OctetString{
        get {
            if(!this.HasProp("__OctetString"))
                this.__OctetString := OCTET_STRING(this.ptr + 12)
            return this.__OctetString
        }
    }
}
