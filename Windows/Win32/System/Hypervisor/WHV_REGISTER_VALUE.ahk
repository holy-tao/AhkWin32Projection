#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_X64_FP_CONTROL_STATUS_REGISTER.ahk" { WHV_X64_FP_CONTROL_STATUS_REGISTER }
#Import ".\WHV_X64_INTERRUPT_STATE_REGISTER.ahk" { WHV_X64_INTERRUPT_STATE_REGISTER }
#Import ".\WHV_X64_TABLE_REGISTER.ahk" { WHV_X64_TABLE_REGISTER }
#Import ".\WHV_UINT128.ahk" { WHV_UINT128 }
#Import ".\WHV_X64_FP_REGISTER.ahk" { WHV_X64_FP_REGISTER }
#Import ".\WHV_X64_PENDING_EXT_INT_EVENT.ahk" { WHV_X64_PENDING_EXT_INT_EVENT }
#Import ".\WHV_X64_PENDING_DEBUG_EXCEPTION.ahk" { WHV_X64_PENDING_DEBUG_EXCEPTION }
#Import ".\WHV_INTERNAL_ACTIVITY_REGISTER.ahk" { WHV_INTERNAL_ACTIVITY_REGISTER }
#Import ".\WHV_X64_PENDING_INTERRUPTION_REGISTER.ahk" { WHV_X64_PENDING_INTERRUPTION_REGISTER }
#Import ".\WHV_X64_PENDING_EXCEPTION_EVENT.ahk" { WHV_X64_PENDING_EXCEPTION_EVENT }
#Import ".\WHV_X64_SEGMENT_REGISTER.ahk" { WHV_X64_SEGMENT_REGISTER }
#Import ".\WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER.ahk" { WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER }
#Import ".\WHV_X64_XMM_CONTROL_STATUS_REGISTER.ahk" { WHV_X64_XMM_CONTROL_STATUS_REGISTER }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_REGISTER_VALUE {
    #StructPack 8

    Reg128 : WHV_UINT128

    static __New() {
        DefineProp(this.Prototype, 'Reg64', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'Reg32', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'Reg16', { type: UInt16, offset: 0 })
        DefineProp(this.Prototype, 'Reg8', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'Fp', { type: WHV_X64_FP_REGISTER, offset: 0 })
        DefineProp(this.Prototype, 'FpControlStatus', { type: WHV_X64_FP_CONTROL_STATUS_REGISTER, offset: 0 })
        DefineProp(this.Prototype, 'XmmControlStatus', { type: WHV_X64_XMM_CONTROL_STATUS_REGISTER, offset: 0 })
        DefineProp(this.Prototype, 'Segment', { type: WHV_X64_SEGMENT_REGISTER, offset: 0 })
        DefineProp(this.Prototype, 'Table', { type: WHV_X64_TABLE_REGISTER, offset: 0 })
        DefineProp(this.Prototype, 'InterruptState', { type: WHV_X64_INTERRUPT_STATE_REGISTER, offset: 0 })
        DefineProp(this.Prototype, 'PendingInterruption', { type: WHV_X64_PENDING_INTERRUPTION_REGISTER, offset: 0 })
        DefineProp(this.Prototype, 'DeliverabilityNotifications', { type: WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER, offset: 0 })
        DefineProp(this.Prototype, 'ExceptionEvent', { type: WHV_X64_PENDING_EXCEPTION_EVENT, offset: 0 })
        DefineProp(this.Prototype, 'ExtIntEvent', { type: WHV_X64_PENDING_EXT_INT_EVENT, offset: 0 })
        DefineProp(this.Prototype, 'InternalActivity', { type: WHV_INTERNAL_ACTIVITY_REGISTER, offset: 0 })
        DefineProp(this.Prototype, 'PendingDebugException', { type: WHV_X64_PENDING_DEBUG_EXCEPTION, offset: 0 })
        this.DeleteProp("__New")
    }
}
