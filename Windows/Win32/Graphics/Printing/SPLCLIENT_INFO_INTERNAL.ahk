#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct SPLCLIENT_INFO_INTERNAL {
    #StructPack 8

    cbSize : UInt32 := this.Size

    dwFlags : UInt32

    dwSize : UInt32

    pMachineName : PWSTR

    pUserName : PWSTR

    dwBuildNum : UInt32

    dwMajorVersion : UInt32

    dwMinorVersion : UInt32

    wProcessorArchitecture : UInt16

    hSplPrinter : Int64

    dwProcessId : UInt32

    dwSessionId : UInt32

}
