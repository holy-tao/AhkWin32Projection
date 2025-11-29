#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PTP_POOL.ahk
#Include .\PTP_CLEANUP_GROUP.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class TP_CALLBACK_ENVIRON_V3 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    class _u_e__Union extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        class _s extends Win32Struct {
            static sizeof => 4
            static packingSize => 4
    
            /**
             * This bitfield backs the following members:
             * - LongFunction
             * - Persistent
             * - Private
             * @type {Integer}
             */
            _bitfield {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            LongFunction {
                get => (this._bitfield >> 0) & 0x1
                set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
            }
        
            /**
             * @type {Integer}
             */
            Persistent {
                get => (this._bitfield >> 1) & 0x1
                set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
            }
        
            /**
             * @type {Integer}
             */
            Private {
                get => (this._bitfield >> 2) & 0x3FFFFFFF
                set => this._bitfield := ((value & 0x3FFFFFFF) << 2) | (this._bitfield & ~(0x3FFFFFFF << 2))
            }
        
        }
    
        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {_s}
         */
        s{
            get {
                if(!this.HasProp("__s"))
                    this.__s := %this.__Class%._s(0, this)
                return this.__s
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PTP_POOL}
     */
    Pool{
        get {
            if(!this.HasProp("__Pool"))
                this.__Pool := PTP_POOL(8, this)
            return this.__Pool
        }
    }

    /**
     * @type {PTP_CLEANUP_GROUP}
     */
    CleanupGroup{
        get {
            if(!this.HasProp("__CleanupGroup"))
                this.__CleanupGroup := PTP_CLEANUP_GROUP(16, this)
            return this.__CleanupGroup
        }
    }

    /**
     * @type {Pointer<PTP_CLEANUP_GROUP_CANCEL_CALLBACK>}
     */
    CleanupGroupCancelCallback {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    RaceDll {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer}
     */
    ActivationContext {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PTP_SIMPLE_CALLBACK>}
     */
    FinalizationCallback {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {_u_e__Union}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u_e__Union(56, this)
            return this.__u
        }
    }

    /**
     * @type {Integer}
     */
    CallbackPriority {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
