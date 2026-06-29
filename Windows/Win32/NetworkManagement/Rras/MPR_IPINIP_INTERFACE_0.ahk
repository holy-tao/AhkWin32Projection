#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_IPINIP_INTERFACE_0 {
    #StructPack 4

    wszFriendlyName : WCHAR[257]

    Guid : Guid

}
