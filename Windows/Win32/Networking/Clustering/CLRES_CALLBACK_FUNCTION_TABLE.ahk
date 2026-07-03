#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PARM_WPR_WATCHDOG_FOR_CURRENT_RESOURCE_CALL_ROUTINE.ahk" { PARM_WPR_WATCHDOG_FOR_CURRENT_RESOURCE_CALL_ROUTINE }
#Import ".\PCHANGE_RESOURCE_PROCESS_FOR_DUMPS.ahk" { PCHANGE_RESOURCE_PROCESS_FOR_DUMPS }
#Import ".\PCHANGE_RES_TYPE_PROCESS_FOR_DUMPS.ahk" { PCHANGE_RES_TYPE_PROCESS_FOR_DUMPS }
#Import ".\PEND_CONTROL_CALL.ahk" { PEND_CONTROL_CALL }
#Import ".\PEND_TYPE_CONTROL_CALL.ahk" { PEND_TYPE_CONTROL_CALL }
#Import ".\PEXTEND_RES_CONTROL_CALL.ahk" { PEXTEND_RES_CONTROL_CALL }
#Import ".\PEXTEND_RES_TYPE_CONTROL_CALL.ahk" { PEXTEND_RES_TYPE_CONTROL_CALL }
#Import ".\PLOG_EVENT_ROUTINE.ahk" { PLOG_EVENT_ROUTINE }
#Import ".\PRAISE_RES_TYPE_NOTIFICATION.ahk" { PRAISE_RES_TYPE_NOTIFICATION }
#Import ".\PREQUEST_DUMP_ROUTINE.ahk" { PREQUEST_DUMP_ROUTINE }
#Import ".\PSET_INTERNAL_STATE.ahk" { PSET_INTERNAL_STATE }
#Import ".\PSET_RESOURCE_INMEMORY_NODELOCAL_PROPERTIES_ROUTINE.ahk" { PSET_RESOURCE_INMEMORY_NODELOCAL_PROPERTIES_ROUTINE }
#Import ".\PSET_RESOURCE_LOCKED_MODE_EX_ROUTINE.ahk" { PSET_RESOURCE_LOCKED_MODE_EX_ROUTINE }
#Import ".\PSET_RESOURCE_LOCKED_MODE_ROUTINE.ahk" { PSET_RESOURCE_LOCKED_MODE_ROUTINE }
#Import ".\PSET_RESOURCE_STATUS_ROUTINE_EX.ahk" { PSET_RESOURCE_STATUS_ROUTINE_EX }
#Import ".\PSET_RESOURCE_WPR_POLICY_ROUTINE.ahk" { PSET_RESOURCE_WPR_POLICY_ROUTINE }
#Import ".\PSIGNAL_FAILURE_ROUTINE.ahk" { PSIGNAL_FAILURE_ROUTINE }

/**
 * Represents a function table for the StartupEx callback function.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-clres_callback_function_table
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLRES_CALLBACK_FUNCTION_TABLE {
    #StructPack 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plog_event_routine">LogEvent</a> entry point.
     */
    LogEvent : PLOG_EVENT_ROUTINE

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_status_routine_ex">SetResourceStatusEx</a> entry point.
     */
    SetResourceStatusEx : PSET_RESOURCE_STATUS_ROUTINE_EX

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_locked_mode_routine">SetResourceLockedMode</a> entry point.
     */
    SetResourceLockedMode : PSET_RESOURCE_LOCKED_MODE_ROUTINE

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-psignal_failure_routine">SignalFailure</a> entry point.
     */
    SignalFailure : PSIGNAL_FAILURE_ROUTINE

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_inmemory_nodelocal_properties_routine">SetResourceInMemoryNodeLocalProperties</a> entry point.
     */
    SetResourceInMemoryNodeLocalProperties : PSET_RESOURCE_INMEMORY_NODELOCAL_PROPERTIES_ROUTINE

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pend_control_call">EndControlCall</a> entry point.
     * 
     * <b>Windows Server 2012:  </b>This member was added in Windows Server 2012 R2.
     */
    EndControlCall : PEND_CONTROL_CALL

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pend_type_control_call">EndTypeControlCall</a> entry point.
     * 
     * <b>Windows Server 2012:  </b>This member was added in Windows Server 2012 R2.
     */
    EndTypeControlCall : PEND_TYPE_CONTROL_CALL

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pextend_res_control_call">ExtendControlCall</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     */
    ExtendControlCall : PEXTEND_RES_CONTROL_CALL

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pextend_res_type_control_call">ExtendResTypeControlCall</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     */
    ExtendTypeControlCall : PEXTEND_RES_TYPE_CONTROL_CALL

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-praise_res_type_notification">RaiseResTypeNotification</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     */
    RaiseResTypeNotification : PRAISE_RES_TYPE_NOTIFICATION

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pchange_resource_process_for_dumps">ChangeResourceProcessForDumps</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     */
    ChangeResourceProcessForDumps : PCHANGE_RESOURCE_PROCESS_FOR_DUMPS

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pchange_res_type_process_for_dumps">ChangeResTypeProcessForDumps</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     */
    ChangeResTypeProcessForDumps : PCHANGE_RES_TYPE_PROCESS_FOR_DUMPS

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_internal_state">SetInternalState</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     */
    SetInternalState : PSET_INTERNAL_STATE

    SetResourceLockedModeEx : PSET_RESOURCE_LOCKED_MODE_EX_ROUTINE

    RequestDump : PREQUEST_DUMP_ROUTINE

    SetResourceWprPolicy : PSET_RESOURCE_WPR_POLICY_ROUTINE

    ArmWprWatchdogForCurrentResourceCall : PARM_WPR_WATCHDOG_FOR_CURRENT_RESOURCE_CALL_ROUTINE

}
