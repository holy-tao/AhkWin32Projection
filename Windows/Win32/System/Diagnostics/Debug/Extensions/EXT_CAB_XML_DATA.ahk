#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class EXT_CAB_XML_DATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    XmlObjectTag{
        get {
            if(!this.HasProp("__XmlObjectTag"))
                this.__XmlObjectTag := PWSTR(this.ptr + 8)
            return this.__XmlObjectTag
        }
    }

    /**
     * @type {Integer}
     */
    NumSubTags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    SubTag{
        get {
            if(!this.HasProp("__SubTag"))
                this.__SubTag := PWSTR(this.ptr + 24)
            return this.__SubTag
        }
    }

    /**
     * @type {PWSTR}
     */
    MatchPattern{
        get {
            if(!this.HasProp("__MatchPattern"))
                this.__MatchPattern := PWSTR(this.ptr + 32)
            return this.__MatchPattern
        }
    }

    /**
     * @type {PWSTR}
     */
    ReturnText{
        get {
            if(!this.HasProp("__ReturnText"))
                this.__ReturnText := PWSTR(this.ptr + 40)
            return this.__ReturnText
        }
    }

    /**
     * @type {Integer}
     */
    ReturnTextSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
