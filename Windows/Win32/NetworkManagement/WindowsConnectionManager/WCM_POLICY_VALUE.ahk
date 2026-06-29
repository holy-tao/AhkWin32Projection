#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information about the current value of a policy.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ns-wcmapi-wcm_policy_value
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
export default struct WCM_POLICY_VALUE {
    #StructPack 4

    /**
     * Type: <b>BOOL</b>
     * 
     * True if the policy is enabled; otherwise, false.
     */
    fValue : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * True if the current value was provided by Group Policy; otherwise, false.
     */
    fIsGroupPolicy : BOOL

}
