#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CXL_HDM_DECODER_CONTROL_REGISTER.ahk
#Include .\CXL_HDM_DECODER_DPA_SKIP_LOW_REGISTER.ahk
#Include .\CXL_HDM_DECODER_TARGET_LIST_HIGH_REGISTER.ahk
#Include .\CXL_HDM_DECODER_TARGET_LIST_LOW_REGISTER.ahk
#Include .\CXL_HDM_MEMORY_BASE_LOW.ahk
#Include .\CXL_HDM_MEMORY_SIZE_LOW.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_HDM_DECODER_REGISTERS extends Win32Struct {
    static sizeof => 52

    static packingSize => 4

    class _u1 extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {CXL_HDM_DECODER_TARGET_LIST_LOW_REGISTER}
         */
        TargetListLow {
            get {
                if(!this.HasProp("__TargetListLow"))
                    this.__TargetListLow := CXL_HDM_DECODER_TARGET_LIST_LOW_REGISTER(0, this)
                return this.__TargetListLow
            }
        }

        /**
         * @type {CXL_HDM_DECODER_DPA_SKIP_LOW_REGISTER}
         */
        DpaSkipLow {
            get {
                if(!this.HasProp("__DpaSkipLow"))
                    this.__DpaSkipLow := CXL_HDM_DECODER_DPA_SKIP_LOW_REGISTER(0, this)
                return this.__DpaSkipLow
            }
        }
    }

    class _u2 extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {CXL_HDM_DECODER_TARGET_LIST_HIGH_REGISTER}
         */
        TargetListHigh {
            get {
                if(!this.HasProp("__TargetListHigh"))
                    this.__TargetListHigh := CXL_HDM_DECODER_TARGET_LIST_HIGH_REGISTER(0, this)
                return this.__TargetListHigh
            }
        }

        /**
         * @type {Integer}
         */
        DpaSkipHigh {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    /**
     * @type {CXL_HDM_MEMORY_BASE_LOW}
     */
    MemoryBaseLow {
        get {
            if(!this.HasProp("__MemoryBaseLow"))
                this.__MemoryBaseLow := CXL_HDM_MEMORY_BASE_LOW(0, this)
            return this.__MemoryBaseLow
        }
    }

    /**
     * @type {Integer}
     */
    MemoryBaseHigh {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {CXL_HDM_MEMORY_SIZE_LOW}
     */
    MemorySizeLow {
        get {
            if(!this.HasProp("__MemorySizeLow"))
                this.__MemorySizeLow := CXL_HDM_MEMORY_SIZE_LOW(12, this)
            return this.__MemorySizeLow
        }
    }

    /**
     * @type {Integer}
     */
    MemorySizeHigh {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {CXL_HDM_DECODER_CONTROL_REGISTER}
     */
    Control {
        get {
            if(!this.HasProp("__Control"))
                this.__Control := CXL_HDM_DECODER_CONTROL_REGISTER(24, this)
            return this.__Control
        }
    }

    /**
     * @type {_u1}
     */
    u1 {
        get {
            if(!this.HasProp("__u1"))
                this.__u1 := CXL_HDM_DECODER_REGISTERS._u1(32, this)
            return this.__u1
        }
    }

    /**
     * @type {_u2}
     */
    u2 {
        get {
            if(!this.HasProp("__u2"))
                this.__u2 := CXL_HDM_DECODER_REGISTERS._u2(40, this)
            return this.__u2
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
