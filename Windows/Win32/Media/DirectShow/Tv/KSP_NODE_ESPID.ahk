#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\KernelStreaming\KSP_NODE.ahk" { KSP_NODE }
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSP_NODE_ESPID {
    #StructPack 8

    Property : KSP_NODE

    EsPid : UInt32

}
