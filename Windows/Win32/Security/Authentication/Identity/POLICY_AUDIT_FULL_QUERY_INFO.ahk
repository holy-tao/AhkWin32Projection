#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_AUDIT_FULL_QUERY_INFO {
    #StructPack 1

    ShutDownOnFull : BOOLEAN

    LogIsFull : BOOLEAN

}
