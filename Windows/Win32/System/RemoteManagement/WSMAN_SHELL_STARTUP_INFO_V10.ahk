#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_ENVIRONMENT_VARIABLE_SET.ahk" { WSMAN_ENVIRONMENT_VARIABLE_SET }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSMAN_STREAM_ID_SET.ahk" { WSMAN_STREAM_ID_SET }

/**
 * The WSMAN_SHELL_STARTUP_INFO_V10 (wsman.h) structure defines the shell startup parameters to be used with the WSManCreateShell function.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_shell_startup_info_v10
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_SHELL_STARTUP_INFO_V10 {
    #StructPack 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_stream_id_set">WSMAN_STREAM_ID_SET</a> structure that specifies a set of input streams for the shell. Streams not present in the filter can be ignored by the shell implementation.  For the Windows Cmd.exe shell, this value should be L"stdin".
     * If the value is <b>NULL</b>, the implementation uses an array with L"stdin" as the default value.
     */
    inputStreamSet : WSMAN_STREAM_ID_SET.Ptr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_stream_id_set">WSMAN_STREAM_ID_SET</a> structure that specifies a set of output streams for the shell.  Streams not present in the filter can be ignored by the shell implementation. For the Windows cmd.exe shell, this value should be L"stdout stderr".
     * If the value is <b>NULL</b>, the implementation uses an array with L"stdout" and L"stderr" as the default value.
     */
    outputStreamSet : WSMAN_STREAM_ID_SET.Ptr

    /**
     * Specifies the maximum duration, in milliseconds, the shell will stay open without any client request. When the maximum duration is exceeded, the shell is automatically deleted. Any value from 0  to 0xFFFFFFFF can be set. This duration has a maximum value specified by the Idle time-out GPO setting, if enabled, or by the IdleTimeout local configuration. The default value of the maximum duration in the GPO/local configuration is 15 minutes. However, a system administrator can change this value. To use the maximum value from the GPO/local configuration, the client should specify 0 (zero) in this field. If an explicit value between 0 to 0xFFFFFFFF is used, the minimum value between the explicit API value and the value from the GPO/local configuration is used.
     */
    idleTimeoutMs : UInt32

    /**
     * Specifies the starting directory for a shell. It is  used with any execution command. If this member is a <b>NULL</b> value, a default directory will be used by the remote machine when executing the command. An empty value is treated by the underlying protocol as an omitted value.
     */
    workingDirectory : PWSTR

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_environment_variable_set">WSMAN_ENVIRONMENT_VARIABLE_SET</a> structure that specifies an array of variable name and value pairs, which describe the starting environment for the shell. The content of these elements is shell specific and can be defined in terms of other environment variables. If a <b>NULL</b> value is passed, the default environment is used on the server side.
     */
    variableSet : WSMAN_ENVIRONMENT_VARIABLE_SET.Ptr

}
