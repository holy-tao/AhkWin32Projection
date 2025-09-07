#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a function table for the StartupEx callback function.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-clres_callback_function_table
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLRES_CALLBACK_FUNCTION_TABLE extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plog_event_routine">LogEvent</a> entry point.
     * @type {Pointer<Ptr>}
     */
    LogEvent {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_status_routine_ex">SetResourceStatusEx</a> entry point.
     * @type {Pointer<Ptr>}
     */
    SetResourceStatusEx {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_locked_mode_routine">SetResourceLockedMode</a> entry point.
     * @type {Pointer<Ptr>}
     */
    SetResourceLockedMode {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-psignal_failure_routine">SignalFailure</a> entry point.
     * @type {Pointer<Ptr>}
     */
    SignalFailure {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_inmemory_nodelocal_properties_routine">SetResourceInMemoryNodeLocalProperties</a> entry point.
     * @type {Pointer<Ptr>}
     */
    SetResourceInMemoryNodeLocalProperties {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pend_control_call">EndControlCall</a> entry point.
     * 
     * <b>Windows Server 2012:  </b>This member was added in Windows Server 2012 R2.
     * @type {Pointer<Ptr>}
     */
    EndControlCall {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pend_type_control_call">EndTypeControlCall</a> entry point.
     * 
     * <b>Windows Server 2012:  </b>This member was added in Windows Server 2012 R2.
     * @type {Pointer<Ptr>}
     */
    EndTypeControlCall {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pextend_res_control_call">ExtendControlCall</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     * @type {Pointer<Ptr>}
     */
    ExtendControlCall {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pextend_res_type_control_call">ExtendResTypeControlCall</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     * @type {Pointer<Ptr>}
     */
    ExtendTypeControlCall {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-praise_res_type_notification">RaiseResTypeNotification</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     * @type {Pointer<Ptr>}
     */
    RaiseResTypeNotification {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pchange_resource_process_for_dumps">ChangeResourceProcessForDumps</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     * @type {Pointer<Ptr>}
     */
    ChangeResourceProcessForDumps {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pchange_res_type_process_for_dumps">ChangeResTypeProcessForDumps</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     * @type {Pointer<Ptr>}
     */
    ChangeResTypeProcessForDumps {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_internal_state">SetInternalState</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     * @type {Pointer<Ptr>}
     */
    SetInternalState {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    SetResourceLockedModeEx {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    RequestDump {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    SetResourceWprPolicy {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ArmWprWatchdogForCurrentResourceCall {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
