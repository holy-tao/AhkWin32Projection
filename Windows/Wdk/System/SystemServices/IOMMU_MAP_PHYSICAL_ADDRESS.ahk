#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IOMMU_MAP_PHYSICAL_ADDRESS_TYPE.ahk
#Include ..\..\Foundation\MDL.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IOMMU_MAP_PHYSICAL_ADDRESS extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {IOMMU_MAP_PHYSICAL_ADDRESS_TYPE}
     */
    MapType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _Mdl extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<MDL>}
         */
        Mdl {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    }

    class _ContiguousRange extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Base {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        Size {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    }

    class _PfnArray extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer<Integer>}
         */
        PageFrame {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer}
         */
        NumberOfPages {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    }

    /**
     * @type {_Mdl}
     */
    Mdl {
        get {
            if(!this.HasProp("__Mdl"))
                this.__Mdl := IOMMU_MAP_PHYSICAL_ADDRESS._Mdl(8, this)
            return this.__Mdl
        }
    }

    /**
     * @type {_ContiguousRange}
     */
    ContiguousRange {
        get {
            if(!this.HasProp("__ContiguousRange"))
                this.__ContiguousRange := IOMMU_MAP_PHYSICAL_ADDRESS._ContiguousRange(8, this)
            return this.__ContiguousRange
        }
    }

    /**
     * @type {_PfnArray}
     */
    PfnArray {
        get {
            if(!this.HasProp("__PfnArray"))
                this.__PfnArray := IOMMU_MAP_PHYSICAL_ADDRESS._PfnArray(8, this)
            return this.__PfnArray
        }
    }
}
