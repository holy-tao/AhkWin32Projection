#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSEVENTDATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NotificationType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    class _EventHandle extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        Event {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Array<UIntPtr>}
         */
        Reserved{
            get {
                if(!this.HasProp("__ReservedProxyArray"))
                    this.__ReservedProxyArray := Win32FixedArray(this.ptr + 8, 2, Primitive, "ptr")
                return this.__ReservedProxyArray
            }
        }
    
    }

    class _SemaphoreHandle extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        Semaphore {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        Adjustment {
            get => NumGet(this, 12, "int")
            set => NumPut("int", value, this, 12)
        }
    
    }

    class _Alignment extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        Unused {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Array<IntPtr>}
         */
        Alignment{
            get {
                if(!this.HasProp("__AlignmentProxyArray"))
                    this.__AlignmentProxyArray := Win32FixedArray(this.ptr + 8, 2, Primitive, "ptr")
                return this.__AlignmentProxyArray
            }
        }
    
    }

    /**
     * @type {_EventHandle}
     */
    EventHandle{
        get {
            if(!this.HasProp("__EventHandle"))
                this.__EventHandle := %this.__Class%._EventHandle(this.ptr + 8)
            return this.__EventHandle
        }
    }

    /**
     * @type {_SemaphoreHandle}
     */
    SemaphoreHandle{
        get {
            if(!this.HasProp("__SemaphoreHandle"))
                this.__SemaphoreHandle := %this.__Class%._SemaphoreHandle(this.ptr + 8)
            return this.__SemaphoreHandle
        }
    }

    /**
     * @type {_Alignment}
     */
    Alignment{
        get {
            if(!this.HasProp("__Alignment"))
                this.__Alignment := %this.__Class%._Alignment(this.ptr + 8)
            return this.__Alignment
        }
    }
}
