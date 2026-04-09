#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION_TYPE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION_TYPE}
     */
    OperationType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _Map extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {Integer}
         */
        BaseAddress {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        SizeInBytes {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }

        /**
         * @type {Integer}
         */
        hAllocation {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }

        /**
         * @type {Integer}
         */
        AllocationOffsetInBytes {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }

        /**
         * @type {Integer}
         */
        AllocationSizeInBytes {
            get => NumGet(this, 32, "uint")
            set => NumPut("uint", value, this, 32)
        }
    }

    class _MapProtect extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        /**
         * @type {Integer}
         */
        BaseAddress {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        SizeInBytes {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }

        /**
         * @type {Integer}
         */
        hAllocation {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }

        /**
         * @type {Integer}
         */
        AllocationOffsetInBytes {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }

        /**
         * @type {Integer}
         */
        AllocationSizeInBytes {
            get => NumGet(this, 32, "uint")
            set => NumPut("uint", value, this, 32)
        }

        /**
         * @type {Pointer}
         */
        Protection {
            get => NumGet(this, 40, "ptr")
            set => NumPut("ptr", value, this, 40)
        }

        /**
         * @type {Integer}
         */
        DriverProtection {
            get => NumGet(this, 48, "uint")
            set => NumPut("uint", value, this, 48)
        }
    }

    class _Unmap extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        BaseAddress {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        SizeInBytes {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }

        /**
         * @type {Pointer}
         */
        Protection {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    }

    class _Copy extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        SourceAddress {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        SizeInBytes {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }

        /**
         * @type {Integer}
         */
        DestAddress {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    }

    /**
     * @type {_Map}
     */
    Map {
        get {
            if(!this.HasProp("__Map"))
                this.__Map := D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION._Map(8, this)
            return this.__Map
        }
    }

    /**
     * @type {_MapProtect}
     */
    MapProtect {
        get {
            if(!this.HasProp("__MapProtect"))
                this.__MapProtect := D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION._MapProtect(8, this)
            return this.__MapProtect
        }
    }

    /**
     * @type {_Unmap}
     */
    Unmap {
        get {
            if(!this.HasProp("__Unmap"))
                this.__Unmap := D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION._Unmap(8, this)
            return this.__Unmap
        }
    }

    /**
     * @type {_Copy}
     */
    Copy {
        get {
            if(!this.HasProp("__Copy"))
                this.__Copy := D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION._Copy(8, this)
            return this.__Copy
        }
    }
}
