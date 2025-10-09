#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains event data or property values.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ns-winevt-evt_variant
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_VARIANT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

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
    SByteVal {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Int16Val {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Int32Val {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Int64Val {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ByteVal {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    UInt16Val {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
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
    UInt64Val {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Float}
     */
    SingleVal {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    DoubleVal {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    FileTimeVal {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<SYSTEMTIME>}
     */
    SysTimeVal {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    GuidVal {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Char>}
     */
    StringVal {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Byte>}
     */
    AnsiStringVal {
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
     * @type {Pointer<Void>}
     */
    SidVal {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    SizeTVal {
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
     * @type {Pointer<SByte>}
     */
    SByteArr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Int16>}
     */
    Int16Arr {
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
     * @type {Pointer<Int64>}
     */
    Int64Arr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Byte>}
     */
    ByteArr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    UInt16Arr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    UInt32Arr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<UInt64>}
     */
    UInt64Arr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Single>}
     */
    SingleArr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Double>}
     */
    DoubleArr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<FILETIME>}
     */
    FileTimeArr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<SYSTEMTIME>}
     */
    SysTimeArr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    GuidArr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Char>}
     */
    StringArr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Byte>}
     */
    AnsiStringArr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    SidArr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<UIntPtr>}
     */
    SizeTArr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    EvtHandleVal {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Char>}
     */
    XmlVal {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Char>}
     */
    XmlValArr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of elements in the array of values. Use <b>Count</b> if the <b>Type</b> member has the <b>EVT_VARIANT_TYPE_ARRAY</b> flag set.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A flag that specifies the data type of the variant. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_variant_type">EVT_VARIANT_TYPE</a> enumeration.
     * 
     * The variant contains an array of values, if the <b>EVT_VARIANT_TYPE_ARRAY</b> flag is set. The members that end in "Arr" contain arrays of values. For example, you would use the <b>StringArr</b> member to access the variant data if the type is EvtVarTypeString and the <b>EVT_VARIANT_TYPE_ARRAY</b> flag is set.
     * 
     * You can use the <a href="https://docs.microsoft.com/windows/desktop/WES/windows-event-log-constants">EVT_VARIANT_TYPE_MASK</a> constant to mask out the array bit to determine the variant's type.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
