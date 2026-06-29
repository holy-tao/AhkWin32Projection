#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct SPLCLIENT_INFO_1 {
    #StructPack 8

    dwSize : UInt32

    pMachineName : PWSTR

    pUserName : PWSTR

    dwBuildNum : UInt32

    dwMajorVersion : UInt32

    dwMinorVersion : UInt32

    wProcessorArchitecture : UInt16

}
