#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct SPC_SIGINFO {
    #StructPack 4

    dwSipVersion : UInt32

    gSIPGuid : Guid

    dwReserved1 : UInt32

    dwReserved2 : UInt32

    dwReserved3 : UInt32

    dwReserved4 : UInt32

    dwReserved5 : UInt32

}
