#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\System\Kernel\LIST_ENTRY.ahk
#Include ..\..\Win32\System\IO\IO_STATUS_BLOCK.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class IRP extends Win32Struct
{
    static sizeof => 208

    static packingSize => 8

    class _AssociatedIrp_e__Union extends Win32Struct {
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

    class _Overlay_e__Union extends Win32Struct {
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
        AsynchronousParameters{
            get {
                if(!this.HasProp("__AsynchronousParameters"))
                    this.__AsynchronousParameters := %this.__Class%._AsynchronousParameters(0, this)
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

    class _Tail_e__Union extends Win32Struct {
        static sizeof => 88
        static packingSize => 8

        class _Overlay extends Win32Struct {
            static sizeof => 88
            static packingSize => 8
    
            /**
             * @type {Pointer<KDEVICE_QUEUE_ENTRY>}
             */
            DeviceQueueEntry {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        
            /**
             * @type {Array<Void>}
             */
            DriverContext{
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
             * @type {LIST_ENTRY}
             */
            ListEntry{
                get {
                    if(!this.HasProp("__ListEntry"))
                        this.__ListEntry := LIST_ENTRY(48, this)
                    return this.__ListEntry
                }
            }
        
            /**
             * @type {Pointer<IO_STACK_LOCATION>}
             */
            CurrentStackLocation {
                get => NumGet(this, 64, "ptr")
                set => NumPut("ptr", value, this, 64)
            }
        
            /**
             * @type {Integer}
             */
            PacketType {
                get => NumGet(this, 64, "uint")
                set => NumPut("uint", value, this, 64)
            }
        
            /**
             * @type {Pointer<FILE_OBJECT>}
             */
            OriginalFileObject {
                get => NumGet(this, 80, "ptr")
                set => NumPut("ptr", value, this, 80)
            }
        
        }
    
        /**
         * @type {_Overlay}
         */
        Overlay{
            get {
                if(!this.HasProp("__Overlay"))
                    this.__Overlay := %this.__Class%._Overlay(0, this)
                return this.__Overlay
            }
        }
    
        /**
         * @type {Pointer<KAPC>}
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
     * @type {_AssociatedIrp_e__Union}
     */
    AssociatedIrp{
        get {
            if(!this.HasProp("__AssociatedIrp"))
                this.__AssociatedIrp := %this.__Class%._AssociatedIrp_e__Union(24, this)
            return this.__AssociatedIrp
        }
    }

    /**
     * @type {LIST_ENTRY}
     */
    ThreadListEntry{
        get {
            if(!this.HasProp("__ThreadListEntry"))
                this.__ThreadListEntry := LIST_ENTRY(32, this)
            return this.__ThreadListEntry
        }
    }

    /**
     * @type {IO_STATUS_BLOCK}
     */
    IoStatus{
        get {
            if(!this.HasProp("__IoStatus"))
                this.__IoStatus := IO_STATUS_BLOCK(48, this)
            return this.__IoStatus
        }
    }

    /**
     * @type {Integer}
     */
    RequestorMode {
        get => NumGet(this, 64, "char")
        set => NumPut("char", value, this, 64)
    }

    /**
     * @type {BOOLEAN}
     */
    PendingReturned {
        get => NumGet(this, 65, "char")
        set => NumPut("char", value, this, 65)
    }

    /**
     * @type {CHAR}
     */
    StackCount {
        get => NumGet(this, 66, "char")
        set => NumPut("char", value, this, 66)
    }

    /**
     * @type {CHAR}
     */
    CurrentLocation {
        get => NumGet(this, 67, "char")
        set => NumPut("char", value, this, 67)
    }

    /**
     * @type {BOOLEAN}
     */
    Cancel {
        get => NumGet(this, 68, "char")
        set => NumPut("char", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    CancelIrql {
        get => NumGet(this, 69, "char")
        set => NumPut("char", value, this, 69)
    }

    /**
     * @type {Integer}
     */
    ApcEnvironment {
        get => NumGet(this, 70, "char")
        set => NumPut("char", value, this, 70)
    }

    /**
     * @type {Integer}
     */
    AllocationFlags {
        get => NumGet(this, 71, "char")
        set => NumPut("char", value, this, 71)
    }

    /**
     * @type {Pointer<IO_STATUS_BLOCK>}
     */
    UserIosb {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<Void>}
     */
    IoRingContext {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<KEVENT>}
     */
    UserEvent {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {_Overlay_e__Union}
     */
    Overlay{
        get {
            if(!this.HasProp("__Overlay"))
                this.__Overlay := %this.__Class%._Overlay_e__Union(88, this)
            return this.__Overlay
        }
    }

    /**
     * @type {Pointer<DRIVER_CANCEL>}
     */
    CancelRoutine {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<Void>}
     */
    UserBuffer {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {_Tail_e__Union}
     */
    Tail{
        get {
            if(!this.HasProp("__Tail"))
                this.__Tail := %this.__Class%._Tail_e__Union(120, this)
            return this.__Tail
        }
    }
}
