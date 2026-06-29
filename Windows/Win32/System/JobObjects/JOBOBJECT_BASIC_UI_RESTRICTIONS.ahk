#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JOB_OBJECT_UILIMIT.ahk" { JOB_OBJECT_UILIMIT }

/**
 * Contains basic user-interface restrictions for a job object.
 * @remarks
 * If you specify the JOB_OBJECT_UILIMIT_HANDLES flag, when a process associated with the job broadcasts messages, they are only sent to top-level windows owned by processes associated with the same job. In addition, hooks can be installed only on threads belonging to processes associated with the job.
 * 
 * To grant access to a User handle to a job that has a user-interface restriction, use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-userhandlegrantaccess">UserHandleGrantAccess</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_basic_ui_restrictions
 * @namespace Windows.Win32.System.JobObjects
 */
export default struct JOBOBJECT_BASIC_UI_RESTRICTIONS {
    #StructPack 4

    UIRestrictionsClass : JOB_OBJECT_UILIMIT

}
