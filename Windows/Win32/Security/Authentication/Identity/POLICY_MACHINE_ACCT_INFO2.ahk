#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\PSID.ahk" { PSID }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_MACHINE_ACCT_INFO2 {
    #StructPack 8

    Rid : UInt32

    Sid : PSID

    ObjectGuid : Guid

}
