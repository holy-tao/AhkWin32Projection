#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct NL_PATH_BANDWIDTH_ROD {
    #StructPack 8

    Bandwidth : Int64

    Instability : Int64

    BandwidthPeaked : BOOLEAN

}
