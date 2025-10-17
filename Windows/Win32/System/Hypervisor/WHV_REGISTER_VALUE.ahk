#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_UINT128.ahk
#Include .\WHV_X64_FP_REGISTER.ahk
#Include .\WHV_X64_FP_CONTROL_STATUS_REGISTER.ahk
#Include .\WHV_X64_XMM_CONTROL_STATUS_REGISTER.ahk
#Include .\WHV_X64_SEGMENT_REGISTER.ahk
#Include .\WHV_X64_TABLE_REGISTER.ahk
#Include .\WHV_X64_INTERRUPT_STATE_REGISTER.ahk
#Include .\WHV_X64_PENDING_INTERRUPTION_REGISTER.ahk
#Include .\WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER.ahk
#Include .\WHV_X64_PENDING_EXCEPTION_EVENT.ahk
#Include .\WHV_X64_PENDING_EXT_INT_EVENT.ahk
#Include .\WHV_INTERNAL_ACTIVITY_REGISTER.ahk
#Include .\WHV_X64_PENDING_DEBUG_EXCEPTION.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_REGISTER_VALUE extends Win32Struct
{
    static sizeof => 400

    static packingSize => 8

    /**
     * @type {WHV_UINT128}
     */
    Reg128{
        get {
            if(!this.HasProp("__Reg128"))
                this.__Reg128 := WHV_UINT128(0, this)
            return this.__Reg128
        }
    }

    /**
     * @type {Integer}
     */
    Reg64 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reg32 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reg16 {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reg8 {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {WHV_X64_FP_REGISTER}
     */
    Fp{
        get {
            if(!this.HasProp("__Fp"))
                this.__Fp := WHV_X64_FP_REGISTER(0, this)
            return this.__Fp
        }
    }

    /**
     * @type {WHV_X64_FP_CONTROL_STATUS_REGISTER}
     */
    FpControlStatus{
        get {
            if(!this.HasProp("__FpControlStatus"))
                this.__FpControlStatus := WHV_X64_FP_CONTROL_STATUS_REGISTER(0, this)
            return this.__FpControlStatus
        }
    }

    /**
     * @type {WHV_X64_XMM_CONTROL_STATUS_REGISTER}
     */
    XmmControlStatus{
        get {
            if(!this.HasProp("__XmmControlStatus"))
                this.__XmmControlStatus := WHV_X64_XMM_CONTROL_STATUS_REGISTER(0, this)
            return this.__XmmControlStatus
        }
    }

    /**
     * @type {WHV_X64_SEGMENT_REGISTER}
     */
    Segment{
        get {
            if(!this.HasProp("__Segment"))
                this.__Segment := WHV_X64_SEGMENT_REGISTER(0, this)
            return this.__Segment
        }
    }

    /**
     * @type {WHV_X64_TABLE_REGISTER}
     */
    Table{
        get {
            if(!this.HasProp("__Table"))
                this.__Table := WHV_X64_TABLE_REGISTER(0, this)
            return this.__Table
        }
    }

    /**
     * @type {WHV_X64_INTERRUPT_STATE_REGISTER}
     */
    InterruptState{
        get {
            if(!this.HasProp("__InterruptState"))
                this.__InterruptState := WHV_X64_INTERRUPT_STATE_REGISTER(0, this)
            return this.__InterruptState
        }
    }

    /**
     * @type {WHV_X64_PENDING_INTERRUPTION_REGISTER}
     */
    PendingInterruption{
        get {
            if(!this.HasProp("__PendingInterruption"))
                this.__PendingInterruption := WHV_X64_PENDING_INTERRUPTION_REGISTER(0, this)
            return this.__PendingInterruption
        }
    }

    /**
     * @type {WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER}
     */
    DeliverabilityNotifications{
        get {
            if(!this.HasProp("__DeliverabilityNotifications"))
                this.__DeliverabilityNotifications := WHV_X64_DELIVERABILITY_NOTIFICATIONS_REGISTER(0, this)
            return this.__DeliverabilityNotifications
        }
    }

    /**
     * @type {WHV_X64_PENDING_EXCEPTION_EVENT}
     */
    ExceptionEvent{
        get {
            if(!this.HasProp("__ExceptionEvent"))
                this.__ExceptionEvent := WHV_X64_PENDING_EXCEPTION_EVENT(0, this)
            return this.__ExceptionEvent
        }
    }

    /**
     * @type {WHV_X64_PENDING_EXT_INT_EVENT}
     */
    ExtIntEvent{
        get {
            if(!this.HasProp("__ExtIntEvent"))
                this.__ExtIntEvent := WHV_X64_PENDING_EXT_INT_EVENT(0, this)
            return this.__ExtIntEvent
        }
    }

    /**
     * @type {WHV_INTERNAL_ACTIVITY_REGISTER}
     */
    InternalActivity{
        get {
            if(!this.HasProp("__InternalActivity"))
                this.__InternalActivity := WHV_INTERNAL_ACTIVITY_REGISTER(0, this)
            return this.__InternalActivity
        }
    }

    /**
     * @type {WHV_X64_PENDING_DEBUG_EXCEPTION}
     */
    PendingDebugException{
        get {
            if(!this.HasProp("__PendingDebugException"))
                this.__PendingDebugException := WHV_X64_PENDING_DEBUG_EXCEPTION(0, this)
            return this.__PendingDebugException
        }
    }
}
