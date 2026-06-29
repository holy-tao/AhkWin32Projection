#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Console\COORD.ahk" { COORD }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct FONT_IMAGE_INFO {
    #StructPack 8

    FontSize : COORD

    ImageBits : IntPtr

}
