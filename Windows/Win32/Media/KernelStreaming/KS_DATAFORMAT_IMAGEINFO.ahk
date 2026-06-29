#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import ".\KS_BITMAPINFOHEADER.ahk" { KS_BITMAPINFOHEADER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DATAFORMAT_IMAGEINFO {
    #StructPack 8

    DataFormat : KSDATAFORMAT

    ImageInfoHeader : KS_BITMAPINFOHEADER

}
