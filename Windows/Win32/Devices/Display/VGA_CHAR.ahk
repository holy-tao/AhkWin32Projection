#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VGA_CHAR {
    #StructPack 1

    Char : CHAR

    Attributes : CHAR

}
