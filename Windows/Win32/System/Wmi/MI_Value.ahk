#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MI_Timestamp.ahk
#Include .\MI_Interval.ahk
#Include .\MI_Datetime.ahk
#Include .\MI_BooleanA.ahk
#Include .\MI_Uint8A.ahk
#Include .\MI_Sint8A.ahk
#Include .\MI_Uint16A.ahk
#Include .\MI_Sint16A.ahk
#Include .\MI_Uint32A.ahk
#Include .\MI_Sint32A.ahk
#Include .\MI_Uint64A.ahk
#Include .\MI_Sint64A.ahk
#Include .\MI_Real32A.ahk
#Include .\MI_Real64A.ahk
#Include .\MI_Char16A.ahk
#Include .\MI_DatetimeA.ahk
#Include .\MI_StringA.ahk
#Include .\MI_ReferenceA.ahk
#Include .\MI_InstanceA.ahk
#Include .\MI_Array.ahk

/**
 * A union of all CIM data types.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_value
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Value extends Win32Struct
{
    static sizeof => 392

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    boolean {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    uint8 {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    sint8 {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    uint16 {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    sint16 {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    uint32 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    sint32 {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    uint64 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    sint64 {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * 
     * @type {Float}
     */
    real32 {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * 
     * @type {Float}
     */
    real64 {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    char16 {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * 
     * @type {MI_Datetime}
     */
    datetime{
        get {
            if(!this.HasProp("__datetime"))
                this.__datetime := MI_Datetime(0, this)
            return this.__datetime
        }
    }

    /**
     * 
     * @type {Pointer<Integer>}
     */
    string {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * 
     * @type {Pointer<MI_Instance>}
     */
    instance {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * 
     * @type {Pointer<MI_Instance>}
     */
    reference {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * 
     * @type {MI_BooleanA}
     */
    booleana{
        get {
            if(!this.HasProp("__booleana"))
                this.__booleana := MI_BooleanA(0, this)
            return this.__booleana
        }
    }

    /**
     * 
     * @type {MI_Uint8A}
     */
    uint8a{
        get {
            if(!this.HasProp("__uint8a"))
                this.__uint8a := MI_Uint8A(0, this)
            return this.__uint8a
        }
    }

    /**
     * 
     * @type {MI_Sint8A}
     */
    sint8a{
        get {
            if(!this.HasProp("__sint8a"))
                this.__sint8a := MI_Sint8A(0, this)
            return this.__sint8a
        }
    }

    /**
     * 
     * @type {MI_Uint16A}
     */
    uint16a{
        get {
            if(!this.HasProp("__uint16a"))
                this.__uint16a := MI_Uint16A(0, this)
            return this.__uint16a
        }
    }

    /**
     * 
     * @type {MI_Sint16A}
     */
    sint16a{
        get {
            if(!this.HasProp("__sint16a"))
                this.__sint16a := MI_Sint16A(0, this)
            return this.__sint16a
        }
    }

    /**
     * 
     * @type {MI_Uint32A}
     */
    uint32a{
        get {
            if(!this.HasProp("__uint32a"))
                this.__uint32a := MI_Uint32A(0, this)
            return this.__uint32a
        }
    }

    /**
     * 
     * @type {MI_Sint32A}
     */
    sint32a{
        get {
            if(!this.HasProp("__sint32a"))
                this.__sint32a := MI_Sint32A(0, this)
            return this.__sint32a
        }
    }

    /**
     * 
     * @type {MI_Uint64A}
     */
    uint64a{
        get {
            if(!this.HasProp("__uint64a"))
                this.__uint64a := MI_Uint64A(0, this)
            return this.__uint64a
        }
    }

    /**
     * 
     * @type {MI_Sint64A}
     */
    sint64a{
        get {
            if(!this.HasProp("__sint64a"))
                this.__sint64a := MI_Sint64A(0, this)
            return this.__sint64a
        }
    }

    /**
     * 
     * @type {MI_Real32A}
     */
    real32a{
        get {
            if(!this.HasProp("__real32a"))
                this.__real32a := MI_Real32A(0, this)
            return this.__real32a
        }
    }

    /**
     * 
     * @type {MI_Real64A}
     */
    real64a{
        get {
            if(!this.HasProp("__real64a"))
                this.__real64a := MI_Real64A(0, this)
            return this.__real64a
        }
    }

    /**
     * 
     * @type {MI_Char16A}
     */
    char16a{
        get {
            if(!this.HasProp("__char16a"))
                this.__char16a := MI_Char16A(0, this)
            return this.__char16a
        }
    }

    /**
     * 
     * @type {MI_DatetimeA}
     */
    datetimea{
        get {
            if(!this.HasProp("__datetimea"))
                this.__datetimea := MI_DatetimeA(0, this)
            return this.__datetimea
        }
    }

    /**
     * 
     * @type {MI_StringA}
     */
    stringa{
        get {
            if(!this.HasProp("__stringa"))
                this.__stringa := MI_StringA(0, this)
            return this.__stringa
        }
    }

    /**
     * 
     * @type {MI_ReferenceA}
     */
    referencea{
        get {
            if(!this.HasProp("__referencea"))
                this.__referencea := MI_ReferenceA(0, this)
            return this.__referencea
        }
    }

    /**
     * 
     * @type {MI_InstanceA}
     */
    instancea{
        get {
            if(!this.HasProp("__instancea"))
                this.__instancea := MI_InstanceA(0, this)
            return this.__instancea
        }
    }

    /**
     * 
     * @type {MI_Array}
     */
    array{
        get {
            if(!this.HasProp("__array"))
                this.__array := MI_Array(0, this)
            return this.__array
        }
    }
}
