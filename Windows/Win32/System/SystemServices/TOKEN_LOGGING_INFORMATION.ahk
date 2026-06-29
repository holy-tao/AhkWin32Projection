#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\TOKEN_ELEVATION.ahk" { TOKEN_ELEVATION }
#Import "..\..\Security\SECURITY_IMPERSONATION_LEVEL.ahk" { SECURITY_IMPERSONATION_LEVEL }
#Import "..\..\Security\TOKEN_TYPE.ahk" { TOKEN_TYPE }
#Import "..\..\Security\SID_AND_ATTRIBUTES.ahk" { SID_AND_ATTRIBUTES }
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\Security\TOKEN_ELEVATION_TYPE.ahk" { TOKEN_ELEVATION_TYPE }
#Import "..\..\Security\PSID.ahk" { PSID }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TOKEN_LOGGING_INFORMATION {
    #StructPack 8

    TokenType : TOKEN_TYPE

    TokenElevation : TOKEN_ELEVATION

    TokenElevationType : TOKEN_ELEVATION_TYPE

    ImpersonationLevel : SECURITY_IMPERSONATION_LEVEL

    IntegrityLevel : UInt32

    User : SID_AND_ATTRIBUTES

    TrustLevelSid : PSID

    SessionId : UInt32

    AppContainerNumber : UInt32

    AuthenticationId : LUID

    GroupCount : UInt32

    GroupsLength : UInt32

    Groups : SID_AND_ATTRIBUTES.Ptr

}
