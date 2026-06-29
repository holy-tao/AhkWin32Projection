#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OUTPUT_COLOR_ENCODING.ahk" { OUTPUT_COLOR_ENCODING }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct OUTPUT_WIRE_FORMAT {
    #StructPack 4

    ColorEncoding : OUTPUT_COLOR_ENCODING

    BitsPerPixel : UInt32

}
