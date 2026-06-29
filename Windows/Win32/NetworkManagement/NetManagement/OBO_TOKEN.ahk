#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\INetCfgComponent.ahk" { INetCfgComponent }
#Import ".\OBO_TOKEN_TYPE.ahk" { OBO_TOKEN_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct OBO_TOKEN {
    #StructPack 8

    Type : OBO_TOKEN_TYPE

    pncc : INetCfgComponent

    pszwManufacturer : PWSTR

    pszwProduct : PWSTR

    pszwDisplayName : PWSTR

    fRegistered : BOOL

}
