#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SURFOBJ.ahk" { SURFOBJ }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DRH_APIBITMAPDATA {
    #StructPack 8

    pso : SURFOBJ.Ptr

    b : BOOL

}
