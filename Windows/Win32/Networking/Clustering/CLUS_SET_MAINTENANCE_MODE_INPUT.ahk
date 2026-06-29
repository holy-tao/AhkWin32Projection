#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_SET_MAINTENANCE_MODE_INPUT {
    #StructPack 4

    InMaintenance : BOOL

    ExtraParameterSize : UInt32

    ExtraParameter : Int8[1]

}
