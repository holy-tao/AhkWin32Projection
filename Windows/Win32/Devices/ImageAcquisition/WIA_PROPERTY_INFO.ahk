#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class WIA_PROPERTY_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    lAccessFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    vt {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    class _Range extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Min {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Nom {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        Max {
            get => NumGet(this, 8, "int")
            set => NumPut("int", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        Inc {
            get => NumGet(this, 12, "int")
            set => NumPut("int", value, this, 12)
        }
    
    }

    class _RangeFloat extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Float}
         */
        Min {
            get => NumGet(this, 0, "double")
            set => NumPut("double", value, this, 0)
        }
    
        /**
         * @type {Float}
         */
        Nom {
            get => NumGet(this, 8, "double")
            set => NumPut("double", value, this, 8)
        }
    
        /**
         * @type {Float}
         */
        Max {
            get => NumGet(this, 16, "double")
            set => NumPut("double", value, this, 16)
        }
    
        /**
         * @type {Float}
         */
        Inc {
            get => NumGet(this, 24, "double")
            set => NumPut("double", value, this, 24)
        }
    
    }

    class _List extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        cNumList {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Nom {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
        /**
         * @type {Pointer<Byte>}
         */
        pList {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _ListFloat extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        cNumList {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Float}
         */
        Nom {
            get => NumGet(this, 8, "double")
            set => NumPut("double", value, this, 8)
        }
    
        /**
         * @type {Pointer<Byte>}
         */
        pList {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    class _ListGuid extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        cNumList {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Pointer<Guid>}
         */
        Nom {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer<Guid>}
         */
        pList {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    class _ListBStr extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        cNumList {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        Nom {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        pList {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    class _Flag extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Nom {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ValidBits {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
    }

    /**
     * @type {_Range}
     */
    Range{
        get {
            if(!this.HasProp("__Range"))
                this.__Range := %this.__Class%._Range(this.ptr + 8)
            return this.__Range
        }
    }

    /**
     * @type {_RangeFloat}
     */
    RangeFloat{
        get {
            if(!this.HasProp("__RangeFloat"))
                this.__RangeFloat := %this.__Class%._RangeFloat(this.ptr + 8)
            return this.__RangeFloat
        }
    }

    /**
     * @type {_List}
     */
    List{
        get {
            if(!this.HasProp("__List"))
                this.__List := %this.__Class%._List(this.ptr + 8)
            return this.__List
        }
    }

    /**
     * @type {_ListFloat}
     */
    ListFloat{
        get {
            if(!this.HasProp("__ListFloat"))
                this.__ListFloat := %this.__Class%._ListFloat(this.ptr + 8)
            return this.__ListFloat
        }
    }

    /**
     * @type {_ListGuid}
     */
    ListGuid{
        get {
            if(!this.HasProp("__ListGuid"))
                this.__ListGuid := %this.__Class%._ListGuid(this.ptr + 8)
            return this.__ListGuid
        }
    }

    /**
     * @type {_ListBStr}
     */
    ListBStr{
        get {
            if(!this.HasProp("__ListBStr"))
                this.__ListBStr := %this.__Class%._ListBStr(this.ptr + 8)
            return this.__ListBStr
        }
    }

    /**
     * @type {_Flag}
     */
    Flag{
        get {
            if(!this.HasProp("__Flag"))
                this.__Flag := %this.__Class%._Flag(this.ptr + 8)
            return this.__Flag
        }
    }

    /**
     * @type {Integer}
     */
    None {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
