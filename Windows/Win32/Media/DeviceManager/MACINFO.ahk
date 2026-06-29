#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct MACINFO {
    #StructPack 4

    fUsed : BOOL

    abMacState : Int8[36]

}
