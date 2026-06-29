#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\System\Console\COORD.ahk" { COORD }
#Import "..\..\System\Console\CHAR_INFO.ahk" { CHAR_INFO }
#Import ".\FONT_IMAGE_INFO.ahk" { FONT_IMAGE_INFO }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct CHAR_IMAGE_INFO {
    #StructPack 8

    CharInfo : CHAR_INFO

    FontImageInfo : FONT_IMAGE_INFO

}
