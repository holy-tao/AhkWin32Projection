#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\IO_STACK_LOCATION.ahk
#Include ..\..\Win32\Foundation\BOOLEAN.ahk
#Include .\_IORING_OBJECT.ahk
#Include .\MDL.ahk
#Include .\IRP.ahk
#Include .\PETHREAD.ahk
#Include .\FILE_OBJECT.ahk
#Include ..\..\Win32\System\IO\IO_STATUS_BLOCK.ahk
#Include ..\..\Win32\Foundation\PSTR.ahk
#Include .\KEVENT.ahk
#Include ..\..\Win32\Foundation\CHAR.ahk

/**
 * @namespace Windows.Wdk.Foundation
 */
class IRP extends Win32Struct {
    static sizeof => 176

    static packingSize => 8

    class _AssociatedIrp extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<IRP>}
         */
        MasterIrp {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        IrpCount {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {Pointer<Void>}
         */
        SystemBuffer {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    }

    class _Overlay extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        class _AsynchronousParameters extends Win32Struct {
            static sizeof => 16
            static packingSize => 8

            /**
             * @type {Pointer<PIO_APC_ROUTINE>}
             */
            UserApcRoutine {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }

            /**
             * @type {Pointer<Void>}
             */
            IssuingProcess {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }

            /**
             * @type {Pointer<Void>}
             */
            UserApcContext {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }

            /**
             * @type {Pointer<_IORING_OBJECT>}
             */
            IoRing {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }
        }

        /**
         * @type {_AsynchronousParameters}
         */
        AsynchronousParameters {
            get {
                if(!this.HasProp("__AsynchronousParameters"))
                    this.__AsynchronousParameters := IRP._Overlay._AsynchronousParameters(0, this)
                return this.__AsynchronousParameters
            }
        }

        /**
         * @type {Integer}
         */
        AllocationSize {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }
    }

    class _Tail extends Win32Struct {
        static sizeof => 72
        static packingSize => 8

        class _Overlay extends Win32Struct {
            static sizeof => 72
            static packingSize => 8

            /**
             * @type {Pointer}
             */
            DeviceQueueEntry {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }

            /**
             * @type {Array<Pointer<Void>>}
             */
            DriverContext {
                get {
                    if(!this.HasProp("__DriverContextProxyArray"))
                        this.__DriverContextProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "ptr")
                    return this.__DriverContextProxyArray
                }
            }

            /**
             * @type {PETHREAD}
             */
            Thread {
                get => NumGet(this, 32, "ptr")
                set => NumPut("ptr", value, this, 32)
            }

            /**
             * @type {PSTR}
             */
            AuxiliaryBuffer {
                get => NumGet(this, 40, "ptr")
                set => NumPut("ptr", value, this, 40)
            }

            /**
             * @type {Pointer}
             */
            ListEntry {
                get => NumGet(this, 48, "ptr")
                set => NumPut("ptr", value, this, 48)
            }

            /**
             * @type {Pointer<IO_STACK_LOCATION>}
             */
            CurrentStackLocation {
                get => NumGet(this, 56, "ptr")
                set => NumPut("ptr", value, this, 56)
            }

            /**
             * @type {Integer}
             */
            PacketType {
                get => NumGet(this, 56, "uint")
                set => NumPut("uint", value, this, 56)
            }

            /**
             * @type {Pointer<FILE_OBJECT>}
             */
            OriginalFileObject {
                get => NumGet(this, 64, "ptr")
                set => NumPut("ptr", value, this, 64)
            }
        }

        /**
         * @type {_Overlay}
         */
        Overlay {
            get {
                if(!this.HasProp("__Overlay"))
                    this.__Overlay := IRP._Tail._Overlay(0, this)
                return this.__Overlay
            }
        }

        /**
         * @type {Pointer}
         */
        Apc {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer<Void>}
         */
        CompletionKey {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Pointer<MDL>}
     */
    MdlAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {_AssociatedIrp}
     */
    AssociatedIrp {
        get {
            if(!this.HasProp("__AssociatedIrp"))
                this.__AssociatedIrp := IRP._AssociatedIrp(24, this)
            return this.__AssociatedIrp
        }
    }

    /**
     * @type {Pointer}
     */
    ThreadListEntry {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer}
     */
    IoStatus {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    RequestorMode {
        get => NumGet(this, 48, "char")
        set => NumPut("char", value, this, 48)
    }

    /**
     * @type {BOOLEAN}
     */
    PendingReturned {
        get => NumGet(this, 49, "char")
        set => NumPut("char", value, this, 49)
    }

    /**
     * @type {CHAR}
     */
    StackCount {
        get => NumGet(this, 50, "char")
        set => NumPut("char", value, this, 50)
    }

    /**
     * @type {CHAR}
     */
    CurrentLocation {
        get => NumGet(this, 51, "char")
        set => NumPut("char", value, this, 51)
    }

    /**
     * @type {BOOLEAN}
     */
    Cancel {
        get => NumGet(this, 52, "char")
        set => NumPut("char", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    CancelIrql {
        get => NumGet(this, 53, "char")
        set => NumPut("char", value, this, 53)
    }

    /**
     * @type {Integer}
     */
    ApcEnvironment {
        get => NumGet(this, 54, "char")
        set => NumPut("char", value, this, 54)
    }

    /**
     * @type {Integer}
     */
    AllocationFlags {
        get => NumGet(this, 55, "char")
        set => NumPut("char", value, this, 55)
    }

    /**
     * @type {Pointer<IO_STATUS_BLOCK>}
     */
    UserIosb {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Void>}
     */
    IoRingContext {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<KEVENT>}
     */
    UserEvent {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {_Overlay}
     */
    Overlay {
        get {
            if(!this.HasProp("__Overlay"))
                this.__Overlay := IRP._Overlay(72, this)
            return this.__Overlay
        }
    }

    /**
     * @type {Pointer<DRIVER_CANCEL>}
     */
    CancelRoutine {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<Void>}
     */
    UserBuffer {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {_Tail}
     */
    Tail {
        get {
            if(!this.HasProp("__Tail"))
                this.__Tail := IRP._Tail(104, this)
            return this.__Tail
        }
    }
}
