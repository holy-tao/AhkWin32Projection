#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VBICODECFILTERING_STATISTICS_CC.ahk" { VBICODECFILTERING_STATISTICS_CC }
#Import ".\VBICODECFILTERING_STATISTICS_COMMON.ahk" { VBICODECFILTERING_STATISTICS_COMMON }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VBICODECFILTERING_STATISTICS_CC_S {
    #StructPack 8

    Property : KSIDENTIFIER

    Statistics : VBICODECFILTERING_STATISTICS_CC

}
