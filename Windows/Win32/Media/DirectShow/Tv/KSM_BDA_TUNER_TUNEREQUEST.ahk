#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSM_BDA_TUNER_TUNEREQUEST {
    #StructPack 8

    Method : KSIDENTIFIER

    ulTuneLength : UInt32

    argbTuneData : Int8[1]

}
