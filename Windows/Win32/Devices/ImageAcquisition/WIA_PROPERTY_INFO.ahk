#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARENUM.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
class WIA_PROPERTY_INFO extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    class _ValidVal extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        class _Range extends Win32Struct {
            static sizeof => 16
            static packingSize => 4

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
            static sizeof => 32
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
            static sizeof => 16
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
             * @type {Pointer<Integer>}
             */
            pList {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }
        }

        class _ListFloat extends Win32Struct {
            static sizeof => 24
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
             * @type {Pointer<Integer>}
             */
            pList {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        }

        class _ListGuid extends Win32Struct {
            static sizeof => 32
            static packingSize => 8

            /**
             * @type {Integer}
             */
            cNumList {
                get => NumGet(this, 0, "int")
                set => NumPut("int", value, this, 0)
            }

            /**
             * @type {Guid}
             */
            Nom {
                get {
                    if(!this.HasProp("__Nom"))
                        this.__Nom := Guid(4, this)
                    return this.__Nom
                }
            }

            /**
             * @type {Pointer<Guid>}
             */
            pList {
                get => NumGet(this, 24, "ptr")
                set => NumPut("ptr", value, this, 24)
            }
        }

        class _ListBStr extends Win32Struct {
            static sizeof => 24
            static packingSize => 8

            /**
             * @type {Integer}
             */
            cNumList {
                get => NumGet(this, 0, "int")
                set => NumPut("int", value, this, 0)
            }

            /**
             * @type {BSTR}
             */
            Nom {
                get {
                    if(!this.HasProp("__Nom"))
                        this.__Nom := BSTR(8, this)
                    return this.__Nom
                }
            }

            /**
             * @type {Pointer<BSTR>}
             */
            pList {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        }

        class _Flag extends Win32Struct {
            static sizeof => 8
            static packingSize => 4

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

        class _None extends Win32Struct {
            static sizeof => 4
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Dummy {
                get => NumGet(this, 0, "int")
                set => NumPut("int", value, this, 0)
            }
        }

        /**
         * @type {_Range}
         */
        Range {
            get {
                if(!this.HasProp("__Range"))
                    this.__Range := WIA_PROPERTY_INFO._ValidVal._Range(0, this)
                return this.__Range
            }
        }

        /**
         * @type {_RangeFloat}
         */
        RangeFloat {
            get {
                if(!this.HasProp("__RangeFloat"))
                    this.__RangeFloat := WIA_PROPERTY_INFO._ValidVal._RangeFloat(0, this)
                return this.__RangeFloat
            }
        }

        /**
         * @type {_List}
         */
        List {
            get {
                if(!this.HasProp("__List"))
                    this.__List := WIA_PROPERTY_INFO._ValidVal._List(0, this)
                return this.__List
            }
        }

        /**
         * @type {_ListFloat}
         */
        ListFloat {
            get {
                if(!this.HasProp("__ListFloat"))
                    this.__ListFloat := WIA_PROPERTY_INFO._ValidVal._ListFloat(0, this)
                return this.__ListFloat
            }
        }

        /**
         * @type {_ListGuid}
         */
        ListGuid {
            get {
                if(!this.HasProp("__ListGuid"))
                    this.__ListGuid := WIA_PROPERTY_INFO._ValidVal._ListGuid(0, this)
                return this.__ListGuid
            }
        }

        /**
         * @type {_ListBStr}
         */
        ListBStr {
            get {
                if(!this.HasProp("__ListBStr"))
                    this.__ListBStr := WIA_PROPERTY_INFO._ValidVal._ListBStr(0, this)
                return this.__ListBStr
            }
        }

        /**
         * @type {_Flag}
         */
        Flag {
            get {
                if(!this.HasProp("__Flag"))
                    this.__Flag := WIA_PROPERTY_INFO._ValidVal._Flag(0, this)
                return this.__Flag
            }
        }

        /**
         * @type {_None}
         */
        None {
            get {
                if(!this.HasProp("__None"))
                    this.__None := WIA_PROPERTY_INFO._ValidVal._None(0, this)
                return this.__None
            }
        }
    }

    /**
     * @type {Integer}
     */
    lAccessFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {VARENUM}
     */
    vt {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {_ValidVal}
     */
    ValidVal {
        get {
            if(!this.HasProp("__ValidVal"))
                this.__ValidVal := WIA_PROPERTY_INFO._ValidVal(8, this)
            return this.__ValidVal
        }
    }
}
