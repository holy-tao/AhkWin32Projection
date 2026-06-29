#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_DVD_YUV.ahk" { KS_DVD_YUV }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_SPPAL {
    #StructPack 1

    sppal : KS_DVD_YUV[16]

}
