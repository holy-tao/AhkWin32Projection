#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_VBIINFOHEADER.ahk" { KS_VBIINFOHEADER }
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DATAFORMAT_VBIINFOHEADER {
    #StructPack 8

    DataFormat : KSDATAFORMAT

    VBIInfoHeader : KS_VBIINFOHEADER

}
