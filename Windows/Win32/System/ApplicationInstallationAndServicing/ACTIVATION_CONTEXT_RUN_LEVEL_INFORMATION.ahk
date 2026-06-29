#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACTCTX_REQUESTED_RUN_LEVEL.ahk" { ACTCTX_REQUESTED_RUN_LEVEL }

/**
 * The ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION structure is used by the QueryActCtxW function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-activation_context_run_level_information
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION {
    #StructPack 4

    /**
     * This parameter is reserved for future use. This parameter currently returns 0.
     */
    ulFlags : UInt32

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-actctx_requested_run_level">ACTCTX_REQUESTED_RUN_LEVEL</a> enumeration value that gives the requested run level of the activation context.
     */
    RunLevel : ACTCTX_REQUESTED_RUN_LEVEL

    /**
     * This parameter returns zero if the <b>uiAccess</b> attribute in the application manifest is false. This parameter returns a non-zero value if the <b>uiAccess</b> attribute in the manifest is true. True means that UI accessibility applications require access higher privileges.
     */
    UiAccess : UInt32

}
