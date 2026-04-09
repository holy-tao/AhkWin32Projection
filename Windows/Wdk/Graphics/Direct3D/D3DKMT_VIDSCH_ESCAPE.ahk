#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMT_VIDSCHESCAPETYPE.ahk
#Include .\D3DKMT_ESCAPE_PFN_CONTROL_COMMAND.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_VIDSCH_ESCAPE extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {D3DKMT_VIDSCHESCAPETYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _TdrControl2 extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        TdrControl {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        NodeOrdinal {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    }

    class _TdrLimit extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Count {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        Time {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    }

    /**
     * @type {BOOL}
     */
    PreemptionControl {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    EnableContextDelay {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {_TdrControl2}
     */
    TdrControl2 {
        get {
            if(!this.HasProp("__TdrControl2"))
                this.__TdrControl2 := D3DKMT_VIDSCH_ESCAPE._TdrControl2(4, this)
            return this.__TdrControl2
        }
    }

    /**
     * @type {BOOL}
     */
    SuspendScheduler {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    TdrControl {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    SuspendTime {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {_TdrLimit}
     */
    TdrLimit {
        get {
            if(!this.HasProp("__TdrLimit"))
                this.__TdrLimit := D3DKMT_VIDSCH_ESCAPE._TdrLimit(4, this)
            return this.__TdrLimit
        }
    }

    /**
     * @type {D3DKMT_ESCAPE_PFN_CONTROL_COMMAND}
     */
    PfnControl {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Pointer}
     */
    VirtualRefreshRateControl {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
