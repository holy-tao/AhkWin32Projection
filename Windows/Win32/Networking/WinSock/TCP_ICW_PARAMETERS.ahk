#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TCP_ICW_LEVEL.ahk" { TCP_ICW_LEVEL }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct TCP_ICW_PARAMETERS {
    #StructPack 4

    Level : TCP_ICW_LEVEL

}
