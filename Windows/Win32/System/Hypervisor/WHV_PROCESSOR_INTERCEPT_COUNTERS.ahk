#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_PROCESSOR_INTERCEPT_COUNTER.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_PROCESSOR_INTERCEPT_COUNTERS extends Win32Struct
{
    static sizeof => 224

    static packingSize => 8

    /**
     * @type {WHV_PROCESSOR_INTERCEPT_COUNTER}
     */
    PageInvalidations{
        get {
            if(!this.HasProp("__PageInvalidations"))
                this.__PageInvalidations := WHV_PROCESSOR_INTERCEPT_COUNTER(this.ptr + 0)
            return this.__PageInvalidations
        }
    }

    /**
     * @type {WHV_PROCESSOR_INTERCEPT_COUNTER}
     */
    ControlRegisterAccesses{
        get {
            if(!this.HasProp("__ControlRegisterAccesses"))
                this.__ControlRegisterAccesses := WHV_PROCESSOR_INTERCEPT_COUNTER(this.ptr + 16)
            return this.__ControlRegisterAccesses
        }
    }

    /**
     * @type {WHV_PROCESSOR_INTERCEPT_COUNTER}
     */
    IoInstructions{
        get {
            if(!this.HasProp("__IoInstructions"))
                this.__IoInstructions := WHV_PROCESSOR_INTERCEPT_COUNTER(this.ptr + 32)
            return this.__IoInstructions
        }
    }

    /**
     * @type {WHV_PROCESSOR_INTERCEPT_COUNTER}
     */
    HaltInstructions{
        get {
            if(!this.HasProp("__HaltInstructions"))
                this.__HaltInstructions := WHV_PROCESSOR_INTERCEPT_COUNTER(this.ptr + 48)
            return this.__HaltInstructions
        }
    }

    /**
     * @type {WHV_PROCESSOR_INTERCEPT_COUNTER}
     */
    CpuidInstructions{
        get {
            if(!this.HasProp("__CpuidInstructions"))
                this.__CpuidInstructions := WHV_PROCESSOR_INTERCEPT_COUNTER(this.ptr + 64)
            return this.__CpuidInstructions
        }
    }

    /**
     * @type {WHV_PROCESSOR_INTERCEPT_COUNTER}
     */
    MsrAccesses{
        get {
            if(!this.HasProp("__MsrAccesses"))
                this.__MsrAccesses := WHV_PROCESSOR_INTERCEPT_COUNTER(this.ptr + 80)
            return this.__MsrAccesses
        }
    }

    /**
     * @type {WHV_PROCESSOR_INTERCEPT_COUNTER}
     */
    OtherIntercepts{
        get {
            if(!this.HasProp("__OtherIntercepts"))
                this.__OtherIntercepts := WHV_PROCESSOR_INTERCEPT_COUNTER(this.ptr + 96)
            return this.__OtherIntercepts
        }
    }

    /**
     * @type {WHV_PROCESSOR_INTERCEPT_COUNTER}
     */
    PendingInterrupts{
        get {
            if(!this.HasProp("__PendingInterrupts"))
                this.__PendingInterrupts := WHV_PROCESSOR_INTERCEPT_COUNTER(this.ptr + 112)
            return this.__PendingInterrupts
        }
    }

    /**
     * @type {WHV_PROCESSOR_INTERCEPT_COUNTER}
     */
    EmulatedInstructions{
        get {
            if(!this.HasProp("__EmulatedInstructions"))
                this.__EmulatedInstructions := WHV_PROCESSOR_INTERCEPT_COUNTER(this.ptr + 128)
            return this.__EmulatedInstructions
        }
    }

    /**
     * @type {WHV_PROCESSOR_INTERCEPT_COUNTER}
     */
    DebugRegisterAccesses{
        get {
            if(!this.HasProp("__DebugRegisterAccesses"))
                this.__DebugRegisterAccesses := WHV_PROCESSOR_INTERCEPT_COUNTER(this.ptr + 144)
            return this.__DebugRegisterAccesses
        }
    }

    /**
     * @type {WHV_PROCESSOR_INTERCEPT_COUNTER}
     */
    PageFaultIntercepts{
        get {
            if(!this.HasProp("__PageFaultIntercepts"))
                this.__PageFaultIntercepts := WHV_PROCESSOR_INTERCEPT_COUNTER(this.ptr + 160)
            return this.__PageFaultIntercepts
        }
    }

    /**
     * @type {WHV_PROCESSOR_INTERCEPT_COUNTER}
     */
    NestedPageFaultIntercepts{
        get {
            if(!this.HasProp("__NestedPageFaultIntercepts"))
                this.__NestedPageFaultIntercepts := WHV_PROCESSOR_INTERCEPT_COUNTER(this.ptr + 176)
            return this.__NestedPageFaultIntercepts
        }
    }

    /**
     * @type {WHV_PROCESSOR_INTERCEPT_COUNTER}
     */
    Hypercalls{
        get {
            if(!this.HasProp("__Hypercalls"))
                this.__Hypercalls := WHV_PROCESSOR_INTERCEPT_COUNTER(this.ptr + 192)
            return this.__Hypercalls
        }
    }

    /**
     * @type {WHV_PROCESSOR_INTERCEPT_COUNTER}
     */
    RdpmcInstructions{
        get {
            if(!this.HasProp("__RdpmcInstructions"))
                this.__RdpmcInstructions := WHV_PROCESSOR_INTERCEPT_COUNTER(this.ptr + 208)
            return this.__RdpmcInstructions
        }
    }
}
