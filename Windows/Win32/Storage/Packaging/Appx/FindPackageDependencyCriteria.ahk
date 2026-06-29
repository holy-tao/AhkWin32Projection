#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Security\PSID.ahk" { PSID }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct FindPackageDependencyCriteria {
    #StructPack 8

    User : PSID

    ScopeIsSystem : BOOL

    PackageFamilyName : PWSTR

}
