#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\OBO_TOKEN_TYPE.ahk" { OBO_TOKEN_TYPE }
#Import ".\INetCfgComponent.ahk" { INetCfgComponent }

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
