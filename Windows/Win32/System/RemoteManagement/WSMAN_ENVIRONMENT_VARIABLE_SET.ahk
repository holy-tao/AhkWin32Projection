#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_ENVIRONMENT_VARIABLE.ahk" { WSMAN_ENVIRONMENT_VARIABLE }

/**
 * Defines an array of environment variables.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_environment_variable_set
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_ENVIRONMENT_VARIABLE_SET {
    #StructPack 8

    /**
     * Specifies the number of environment variables contained within the <b>vars</b> array.
     */
    varsCount : UInt32

    /**
     * Defines an array of environment variables. Each element of the array is of type <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_environment_variable">WSMAN_ENVIRONMENT_VARIABLE</a>.
     */
    vars : WSMAN_ENVIRONMENT_VARIABLE.Ptr

}
