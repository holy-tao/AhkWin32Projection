#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_ENVIRONMENT_VARIABLE_SET.ahk" { WSMAN_ENVIRONMENT_VARIABLE_SET }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSMAN_SHELL_STARTUP_INFO_V10.ahk" { WSMAN_SHELL_STARTUP_INFO_V10 }
#Import ".\WSMAN_STREAM_ID_SET.ahk" { WSMAN_STREAM_ID_SET }

/**
 * The WSMAN_SHELL_STARTUP_INFO_V11 (wsman.h) structure defines the shell startup parameters to be used with the WSManCreateShell function.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_shell_startup_info_v11
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_SHELL_STARTUP_INFO_V11 {
    #StructPack 8

    Base : WSMAN_SHELL_STARTUP_INFO_V10

    /**
     * Specifies an optional friendly name to be associated with the shell. This parameter is only functional when the client passes the  flag <b>WSMAN_FLAG_REQUESTED_API_VERSION_1_1</b> to WSManInitialize.
     */
    name : PWSTR

}
