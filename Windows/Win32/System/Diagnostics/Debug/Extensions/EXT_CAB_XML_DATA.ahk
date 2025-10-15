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

    class _SUBTAGS extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {PWSTR}
         */
        SubTag{
            get {
                if(!this.HasProp("__SubTag"))
                    this.__SubTag := PWSTR(this.ptr + 0)
                return this.__SubTag
            }
        }
    
        /**
         * @type {PWSTR}
         */
        MatchPattern{
            get {
                if(!this.HasProp("__MatchPattern"))
                    this.__MatchPattern := PWSTR(this.ptr + 8)
                return this.__MatchPattern
            }
        }
    
        /**
         * @type {PWSTR}
         */
        ReturnText{
            get {
                if(!this.HasProp("__ReturnText"))
                    this.__ReturnText := PWSTR(this.ptr + 16)
                return this.__ReturnText
            }
        }
    
        /**
         * @type {Integer}
         */
        ReturnTextSize {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * This bitfield backs the following members:
         * - MatchType
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 28, "uint")
            set => NumPut("uint", value, this, 28)
        }
    
        /**
         * @type {Integer}
         */
        MatchType {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 3) & 0x1FFFFFFF
            set => this._bitfield := ((value & 0x1FFFFFFF) << 3) | (this._bitfield & ~(0x1FFFFFFF << 3))
        }
    
        /**
         * @type {Integer}
         */
        Reserved2 {
            get => NumGet(this, 32, "uint")
            set => NumPut("uint", value, this, 32)
        }
    
    }

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
     * @type {Array<_SUBTAGS>}
     */
    SubTags{
        get {
            if(!this.HasProp("__SubTagsProxyArray"))
                this.__SubTagsProxyArray := Win32FixedArray(this.ptr + 24, 1, %this.__Class%._SUBTAGS, "")
            return this.__SubTagsProxyArray
        }
    }
}
