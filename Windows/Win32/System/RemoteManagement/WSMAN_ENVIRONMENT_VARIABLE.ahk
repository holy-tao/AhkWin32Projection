#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Defines an individual environment variable by using a name and value pair.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_environment_variable
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_ENVIRONMENT_VARIABLE {
    #StructPack 8

    /**
     * Defines the environment variable name. This parameter cannot be <b>NULL</b>.
     */
    name : PWSTR

    /**
     * Defines the environment variable value. <b>NULL</b> or empty string values are permitted.
     */
    value : PWSTR

}
