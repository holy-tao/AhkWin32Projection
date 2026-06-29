#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SECURITY_IMPERSONATION_LEVEL.ahk" { SECURITY_IMPERSONATION_LEVEL }

/**
 * @namespace Windows.Win32.Security
 */
export default struct SE_IMPERSONATION_STATE {
    #StructPack 8

    Token : IntPtr

    CopyOnOpen : BOOLEAN

    EffectiveOnly : BOOLEAN

    Level : SECURITY_IMPERSONATION_LEVEL

}
