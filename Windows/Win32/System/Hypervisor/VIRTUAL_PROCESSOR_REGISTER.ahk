#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class VIRTUAL_PROCESSOR_REGISTER extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    class _Reg128 extends Win32Struct {
        static sizeof => 48
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Low64 {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        High64 {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    /**
     * @type {Integer}
     */
    Reg64 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reg32 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reg16 {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reg8 {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {_Reg128}
     */
    Reg128{
        get {
            if(!this.HasProp("__Reg128"))
                this.__Reg128 := %this.__Class%._Reg128(this.ptr + 0)
            return this.__Reg128
        }
    }

    class _Segment extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Base {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Limit {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        Selector {
            get => NumGet(this, 12, "ushort")
            set => NumPut("ushort", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        Attributes {
            get => NumGet(this, 14, "ushort")
            set => NumPut("ushort", value, this, 14)
        }
    
        /**
         * @type {Integer}
         */
        Anonymous {
            get => NumGet(this, 14, "ushort")
            set => NumPut("ushort", value, this, 14)
        }
    
    }

    class _Table extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Limit {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Base {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    class _FpControlStatus extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        FpControl {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        FpStatus {
            get => NumGet(this, 2, "ushort")
            set => NumPut("ushort", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        FpTag {
            get => NumGet(this, 4, "char")
            set => NumPut("char", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => NumGet(this, 5, "char")
            set => NumPut("char", value, this, 5)
        }
    
        /**
         * @type {Integer}
         */
        LastFpOp {
            get => NumGet(this, 6, "ushort")
            set => NumPut("ushort", value, this, 6)
        }
    
        /**
         * @type {Integer}
         */
        LastFpRip {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        LastFpEip {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        LastFpCs {
            get => NumGet(this, 12, "ushort")
            set => NumPut("ushort", value, this, 12)
        }
    
    }

    class _XmmControlStatus extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        LastFpRdp {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        LastFpDp {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        LastFpDs {
            get => NumGet(this, 4, "ushort")
            set => NumPut("ushort", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        XmmStatusControl {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        XmmStatusControlMask {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
    }

    /**
     * @type {_Segment}
     */
    Segment{
        get {
            if(!this.HasProp("__Segment"))
                this.__Segment := %this.__Class%._Segment(this.ptr + 0)
            return this.__Segment
        }
    }

    /**
     * @type {_Table}
     */
    Table{
        get {
            if(!this.HasProp("__Table"))
                this.__Table := %this.__Class%._Table(this.ptr + 0)
            return this.__Table
        }
    }

    /**
     * @type {_FpControlStatus}
     */
    FpControlStatus{
        get {
            if(!this.HasProp("__FpControlStatus"))
                this.__FpControlStatus := %this.__Class%._FpControlStatus(this.ptr + 0)
            return this.__FpControlStatus
        }
    }

    /**
     * @type {_XmmControlStatus}
     */
    XmmControlStatus{
        get {
            if(!this.HasProp("__XmmControlStatus"))
                this.__XmmControlStatus := %this.__Class%._XmmControlStatus(this.ptr + 0)
            return this.__XmmControlStatus
        }
    }
}
