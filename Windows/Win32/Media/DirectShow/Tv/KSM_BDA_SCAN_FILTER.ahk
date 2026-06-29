#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSM_BDA_SCAN_FILTER {
    #StructPack 8

    Method : KSIDENTIFIER

    ulScanModulationTypeSize : UInt32

    AnalogVideoStandards : Int64

    argbScanModulationTypes : Int8[1]

}
