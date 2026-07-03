#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DRH_APIBITMAPDATA {
    #StructPack 8

    pso : SURFOBJ.Ptr

    b : BOOL

}
