#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IO_INTERRUPT_MESSAGE_INFO.ahk
#Include ..\..\Foundation\PKINTERRUPT.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IO_REPORT_INTERRUPT_ACTIVE_STATE_PARAMETERS extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    class _ConnectionContext extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        Generic {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {PKINTERRUPT}
         */
        InterruptObject {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {Pointer<IO_INTERRUPT_MESSAGE_INFO>}
         */
        InterruptMessageTable {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
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
     * @type {_ConnectionContext}
     */
    ConnectionContext {
        get {
            if(!this.HasProp("__ConnectionContext"))
                this.__ConnectionContext := IO_REPORT_INTERRUPT_ACTIVE_STATE_PARAMETERS._ConnectionContext(8, this)
            return this.__ConnectionContext
        }
    }
}
