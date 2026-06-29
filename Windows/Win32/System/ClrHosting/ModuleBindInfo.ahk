#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ModuleBindInfo {
    #StructPack 8

    dwAppDomainId : UInt32

    lpAssemblyIdentity : PWSTR

    lpModuleName : PWSTR

}
