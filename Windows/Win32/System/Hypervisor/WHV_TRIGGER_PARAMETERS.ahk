#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_TRIGGER_TYPE.ahk" { WHV_TRIGGER_TYPE }
#Import ".\WHV_SYNIC_EVENT_PARAMETERS.ahk" { WHV_SYNIC_EVENT_PARAMETERS }
#Import ".\WHV_INTERRUPT_CONTROL.ahk" { WHV_INTERRUPT_CONTROL }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_TRIGGER_PARAMETERS {
    #StructPack 8


    struct _DeviceInterrupt {
        LogicalDeviceId : Int64

        MsiAddress : Int64

        MsiData : UInt32

        Reserved : UInt32

    }

    TriggerType : WHV_TRIGGER_TYPE

    Reserved : UInt32

    Interrupt : WHV_INTERRUPT_CONTROL

    static __New() {
        DefineProp(this.Prototype, 'SynicEvent', { type: WHV_SYNIC_EVENT_PARAMETERS, offset: 8 })
        DefineProp(this.Prototype, 'DeviceInterrupt', { type: WHV_TRIGGER_PARAMETERS._DeviceInterrupt, offset: 8 })
        this.DeleteProp("__New")
    }
}
