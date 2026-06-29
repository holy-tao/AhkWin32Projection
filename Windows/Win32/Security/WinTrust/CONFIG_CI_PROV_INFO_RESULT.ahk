#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CONFIG_CI_PROV_INFO_RESULT {
    #StructPack 4

    hr : HRESULT

    dwResult : UInt32

    dwPolicyIndex : UInt32

    fIsExplicitDeny : BOOLEAN

}
