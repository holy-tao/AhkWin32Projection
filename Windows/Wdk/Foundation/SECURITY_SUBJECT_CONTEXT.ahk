#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Win32\Security\SECURITY_IMPERSONATION_LEVEL.ahk" { SECURITY_IMPERSONATION_LEVEL }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct SECURITY_SUBJECT_CONTEXT {
    #StructPack 8

    ClientToken : IntPtr

    ImpersonationLevel : SECURITY_IMPERSONATION_LEVEL

    PrimaryToken : IntPtr

    ProcessAuditId : IntPtr

}
