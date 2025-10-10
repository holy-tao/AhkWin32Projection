#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a function table for the StartupEx callback function.
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ns-resapi-clres_callback_function_table
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLRES_CALLBACK_FUNCTION_TABLE extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plog_event_routine">LogEvent</a> entry point.
     * @type {Pointer<PLOG_EVENT_ROUTINE>}
     */
    LogEvent {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_status_routine_ex">SetResourceStatusEx</a> entry point.
     * @type {Pointer<PSET_RESOURCE_STATUS_ROUTINE_EX>}
     */
    SetResourceStatusEx {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_locked_mode_routine">SetResourceLockedMode</a> entry point.
     * @type {Pointer<PSET_RESOURCE_LOCKED_MODE_ROUTINE>}
     */
    SetResourceLockedMode {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-psignal_failure_routine">SignalFailure</a> entry point.
     * @type {Pointer<PSIGNAL_FAILURE_ROUTINE>}
     */
    SignalFailure {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_inmemory_nodelocal_properties_routine">SetResourceInMemoryNodeLocalProperties</a> entry point.
     * @type {Pointer<PSET_RESOURCE_INMEMORY_NODELOCAL_PROPERTIES_ROUTINE>}
     */
    SetResourceInMemoryNodeLocalProperties {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pend_control_call">EndControlCall</a> entry point.
     * 
     * <b>Windows Server 2012:  </b>This member was added in Windows Server 2012 R2.
     * @type {Pointer<PEND_CONTROL_CALL>}
     */
    EndControlCall {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pend_type_control_call">EndTypeControlCall</a> entry point.
     * 
     * <b>Windows Server 2012:  </b>This member was added in Windows Server 2012 R2.
     * @type {Pointer<PEND_TYPE_CONTROL_CALL>}
     */
    EndTypeControlCall {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pextend_res_control_call">ExtendControlCall</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     * @type {Pointer<PEXTEND_RES_CONTROL_CALL>}
     */
    ExtendControlCall {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pextend_res_type_control_call">ExtendResTypeControlCall</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     * @type {Pointer<PEXTEND_RES_TYPE_CONTROL_CALL>}
     */
    ExtendTypeControlCall {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-praise_res_type_notification">RaiseResTypeNotification</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     * @type {Pointer<PRAISE_RES_TYPE_NOTIFICATION>}
     */
    RaiseResTypeNotification {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pchange_resource_process_for_dumps">ChangeResourceProcessForDumps</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     * @type {Pointer<PCHANGE_RESOURCE_PROCESS_FOR_DUMPS>}
     */
    ChangeResourceProcessForDumps {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pchange_res_type_process_for_dumps">ChangeResTypeProcessForDumps</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     * @type {Pointer<PCHANGE_RES_TYPE_PROCESS_FOR_DUMPS>}
     */
    ChangeResTypeProcessForDumps {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_internal_state">SetInternalState</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     * @type {Pointer<PSET_INTERNAL_STATE>}
     */
    SetInternalState {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * 
     * @type {Pointer<PSET_RESOURCE_LOCKED_MODE_EX_ROUTINE>}
     */
    SetResourceLockedModeEx {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<PREQUEST_DUMP_ROUTINE>}
     */
    RequestDump {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<PSET_RESOURCE_WPR_POLICY_ROUTINE>}
     */
    SetResourceWprPolicy {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<PARM_WPR_WATCHDOG_FOR_CURRENT_RESOURCE_CALL_ROUTINE>}
     */
    ArmWprWatchdogForCurrentResourceCall {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
