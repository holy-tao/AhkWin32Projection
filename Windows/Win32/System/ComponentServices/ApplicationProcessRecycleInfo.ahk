#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Represents details about the recycling of a process hosting COM+ applications.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/ns-comsvcs-applicationprocessrecycleinfo
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ApplicationProcessRecycleInfo extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Indicates whether the process is one that can be recycled. For example, only COM+ server applications can be recycled, and applications running as Windows services cannot be recycled.
     * @type {Integer}
     */
    IsRecyclable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Indicates whether the process is a COM+ server application instance that has been recycled.
     * @type {Integer}
     */
    IsRecycled {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The time at which the process was recycled. This member is meaningful only if <b>IsRecycled</b> is <b>TRUE</b>.
     * @type {FILETIME}
     */
    TimeRecycled{
        get {
            if(!this.HasProp("__TimeRecycled"))
                this.__TimeRecycled := FILETIME(this.ptr + 8)
            return this.__TimeRecycled
        }
    }

    /**
     * The time at which a recycled process will be forcibly terminated if it does not shut down on its own before this time. This member is meaningful only if <b>IsRecycled</b> is <b>TRUE</b>.
     * @type {FILETIME}
     */
    TimeToTerminate{
        get {
            if(!this.HasProp("__TimeToTerminate"))
                this.__TimeToTerminate := FILETIME(this.ptr + 16)
            return this.__TimeToTerminate
        }
    }

    /**
     * A code that indicates the reason a process was recycled. This is usually one of the recycle reason code constants defined in Comsvcs.h (for example, CRR_RECYCLED_FROM_UI), but may be any code supplied by an administrative application in a call to <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/nf-comadmin-icomadmincatalog2-recycleapplicationinstances">ICOMAdminCatalog2::RecycleApplicationInstances</a>. This member is meaningful only if <b>IsRecycled</b> is <b>TRUE</b>.
     * @type {Integer}
     */
    RecycleReasonCode {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Indicates whether a paused COM+ server application instance has met the conditions for automatic recycling. If so, the application instance will be recycled when it is resumed.
     * @type {Integer}
     */
    IsPendingRecycle {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Indicates whether the process is an instance of a COM+ server application that has been configured for automatic recycling based on lifetime.
     * @type {Integer}
     */
    HasAutomaticLifetimeRecycling {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The time at which the process will be automatically recycled. This member is meaningful only if <b>HasAutomaticLifetimeRecycling</b> is <b>TRUE</b>.
     * @type {FILETIME}
     */
    TimeForAutomaticRecycling{
        get {
            if(!this.HasProp("__TimeForAutomaticRecycling"))
                this.__TimeForAutomaticRecycling := FILETIME(this.ptr + 40)
            return this.__TimeForAutomaticRecycling
        }
    }

    /**
     * The recycling memory limit configured for a COM+ server application in kilobytes, or 0 if the application is not configured for automatic recycling based on memory usage.
     * @type {Integer}
     */
    MemoryLimitInKB {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The memory usage of the process in kilobytes the last time this metric was calculated by the Tracker Server. This is set to DATA_NOT_AVAILABLE (0xFFFFFFFF) if the application is not configured for automatic recycling based on memory usage, or if memory usage has not yet been checked.
     * @type {Integer}
     */
    MemoryUsageInKBLastCheck {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The activation limit configured for a COM+ server application, or 0 if the application is not configured for automatic recycling based on activation count. This data is not currently available, and is always set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     * @type {Integer}
     */
    ActivationLimit {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The total number of activations performed in a COM+ server application instance, or 0 if the process is not hosting a COM+ server application. This data is not currently available, and is always set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     * @type {Integer}
     */
    NumActivationsLastReported {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * The call limit configured for a COM+ server application, or zero if the application is not configured for automatic recycling based on number of calls. This data is not currently available, and is always set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     * @type {Integer}
     */
    CallLimit {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The total number of calls serviced by a COM+ server application instance, or 0 if the process is not hosting a COM+ server application. This data is not currently available, and is always set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     * @type {Integer}
     */
    NumCallsLastReported {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }
}
