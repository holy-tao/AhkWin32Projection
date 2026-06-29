#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct AssemblyBindInfo {
    #StructPack 8

    dwAppDomainId : UInt32

    lpReferencedIdentity : PWSTR

    lpPostPolicyIdentity : PWSTR

    ePolicyLevel : UInt32

}
