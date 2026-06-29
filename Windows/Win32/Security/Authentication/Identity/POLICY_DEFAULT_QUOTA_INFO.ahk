#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\QUOTA_LIMITS.ahk" { QUOTA_LIMITS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_DEFAULT_QUOTA_INFO {
    #StructPack 8

    QuotaLimits : QUOTA_LIMITS

}
