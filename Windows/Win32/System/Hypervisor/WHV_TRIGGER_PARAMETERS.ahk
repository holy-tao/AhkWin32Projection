#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_INTERRUPT_CONTROL.ahk
#Include .\WHV_SYNIC_EVENT_PARAMETERS.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_TRIGGER_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    TriggerType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    class _DeviceInterrupt extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        LogicalDeviceId {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        MsiAddress {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        MsiData {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    
    }

    /**
     * @type {WHV_INTERRUPT_CONTROL}
     */
    Interrupt{
        get {
            if(!this.HasProp("__Interrupt"))
                this.__Interrupt := WHV_INTERRUPT_CONTROL(this.ptr + 8)
            return this.__Interrupt
        }
    }

    /**
     * @type {WHV_SYNIC_EVENT_PARAMETERS}
     */
    SynicEvent{
        get {
            if(!this.HasProp("__SynicEvent"))
                this.__SynicEvent := WHV_SYNIC_EVENT_PARAMETERS(this.ptr + 8)
            return this.__SynicEvent
        }
    }

    /**
     * @type {_DeviceInterrupt}
     */
    DeviceInterrupt{
        get {
            if(!this.HasProp("__DeviceInterrupt"))
                this.__DeviceInterrupt := %this.__Class%._DeviceInterrupt(this.ptr + 8)
            return this.__DeviceInterrupt
        }
    }
}
