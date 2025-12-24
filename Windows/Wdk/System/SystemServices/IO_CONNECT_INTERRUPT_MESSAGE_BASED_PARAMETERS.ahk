#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IO_CONNECT_INTERRUPT_MESSAGE_BASED_PARAMETERS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    class _ConnectionContext_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<Pointer<Void>>}
         */
        Generic {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<Pointer<IO_INTERRUPT_MESSAGE_INFO>>}
         */
        InterruptMessageTable {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<PKINTERRUPT>}
         */
        InterruptObject {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    /**
     * @type {Pointer<DEVICE_OBJECT>}
     */
    PhysicalDeviceObject {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {_ConnectionContext_e__Union}
     */
    ConnectionContext{
        get {
            if(!this.HasProp("__ConnectionContext"))
                this.__ConnectionContext := %this.__Class%._ConnectionContext_e__Union(8, this)
            return this.__ConnectionContext
        }
    }

    /**
     * @type {Pointer<PKMESSAGE_SERVICE_ROUTINE>}
     */
    MessageServiceRoutine {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    ServiceContext {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Pointer>}
     */
    SpinLock {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    SynchronizeIrql {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }

    /**
     * @type {BOOLEAN}
     */
    FloatingSave {
        get => NumGet(this, 41, "char")
        set => NumPut("char", value, this, 41)
    }

    /**
     * @type {Pointer<PKSERVICE_ROUTINE>}
     */
    FallBackServiceRoutine {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
