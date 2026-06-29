#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOS_IMAGE_INFO.ahk" { DOS_IMAGE_INFO }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct MODULE_INFO {
    #StructPack 8

    ProcessImageName : PSTR

    Image : DOS_IMAGE_INFO

}
