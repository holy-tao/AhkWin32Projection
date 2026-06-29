#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_ROUTESTATE {
    #StructPack 4

    bRoutesSetToStack : BOOL

}
