#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PTP_POOL.ahk" { PTP_POOL }
#Import ".\PTP_CLEANUP_GROUP.ahk" { PTP_CLEANUP_GROUP }
#Import ".\TP_CALLBACK_PRIORITY.ahk" { TP_CALLBACK_PRIORITY }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct TP_CALLBACK_ENVIRON_V3 {
    #StructPack 8


    struct _u {

        struct _s {
            /**
             * This bitfield backs the following members:
             * - LongFunction
             * - Persistent
             * - Private
             */
            _bitfield : Int32


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

        Flags : UInt32

        static __New() {
            DefineProp(this.Prototype, 's', { type: TP_CALLBACK_ENVIRON_V3._u._s, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Version : UInt32

    Pool : PTP_POOL

    CleanupGroup : PTP_CLEANUP_GROUP

    CleanupGroupCancelCallback : IntPtr

    RaceDll : IntPtr

    ActivationContext : IntPtr

    FinalizationCallback : IntPtr

    u : TP_CALLBACK_ENVIRON_V3._u

    CallbackPriority : TP_CALLBACK_PRIORITY

    Size : UInt32

}
