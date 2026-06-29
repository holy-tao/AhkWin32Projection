#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct DOS_IMAGE_INFO {
    #StructPack 8

    PdbName : PSTR

    ImageBaseAddress : Int64

    ImageSize : UInt32

    Timestamp : UInt32

}
