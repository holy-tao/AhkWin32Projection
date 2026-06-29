#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
    LogEvent : IntPtr

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_status_routine_ex">SetResourceStatusEx</a> entry point.
     */
    SetResourceStatusEx : IntPtr

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_locked_mode_routine">SetResourceLockedMode</a> entry point.
     */
    SetResourceLockedMode : IntPtr

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-psignal_failure_routine">SignalFailure</a> entry point.
     */
    SignalFailure : IntPtr

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_inmemory_nodelocal_properties_routine">SetResourceInMemoryNodeLocalProperties</a> entry point.
     */
    SetResourceInMemoryNodeLocalProperties : IntPtr

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pend_control_call">EndControlCall</a> entry point.
     * 
     * <b>Windows Server 2012:  </b>This member was added in Windows Server 2012 R2.
     */
    EndControlCall : IntPtr

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pend_type_control_call">EndTypeControlCall</a> entry point.
     * 
     * <b>Windows Server 2012:  </b>This member was added in Windows Server 2012 R2.
     */
    EndTypeControlCall : IntPtr

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pextend_res_control_call">ExtendControlCall</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     */
    ExtendControlCall : IntPtr

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pextend_res_type_control_call">ExtendResTypeControlCall</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     */
    ExtendTypeControlCall : IntPtr

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-praise_res_type_notification">RaiseResTypeNotification</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     */
    RaiseResTypeNotification : IntPtr

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pchange_resource_process_for_dumps">ChangeResourceProcessForDumps</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     */
    ChangeResourceProcessForDumps : IntPtr

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pchange_res_type_process_for_dumps">ChangeResTypeProcessForDumps</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     */
    ChangeResTypeProcessForDumps : IntPtr

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_internal_state">SetInternalState</a> entry point.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member was added in Windows Server 2016.
     */
    SetInternalState : IntPtr

    SetResourceLockedModeEx : IntPtr

    RequestDump : IntPtr

    SetResourceWprPolicy : IntPtr

    ArmWprWatchdogForCurrentResourceCall : IntPtr

}
