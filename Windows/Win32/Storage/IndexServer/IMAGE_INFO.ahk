#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_PIXELFORMAT.ahk" { IMAGE_PIXELFORMAT }

/**
 * @namespace Windows.Win32.Storage.IndexServer
 */
export default struct IMAGE_INFO {
    #StructPack 4

    Width : UInt32

    Height : UInt32

    Format : IMAGE_PIXELFORMAT

}
