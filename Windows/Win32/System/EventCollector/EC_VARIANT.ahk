#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains event collector data (subscription data) or property values.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/ns-evcoll-ec_variant
 * @namespace Windows.Win32.System.EventCollector
 * @version v4.0.30319
 */
class EC_VARIANT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    BooleanVal {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    UInt32Val {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DateTimeVal {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    StringVal {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Byte>}
     */
    BinaryVal {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Int32>}
     */
    BooleanArr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Int32>}
     */
    Int32Arr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    StringArr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    PropertyHandleVal {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of elements (not length) in bytes. Used for arrays and binary or string types.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The type of the data in the structure. Use a value from the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_variant_type">EC_VARIANT_TYPE</a> enumeration to specify the type. When the type is specified, you can use any of the union members to access the  actual value. For example, if the type is <b>EcVarTypeDateTime</b>, then the value is <b>DateTimeVal</b> in the <b>EC_VARIANT</b> structure.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
