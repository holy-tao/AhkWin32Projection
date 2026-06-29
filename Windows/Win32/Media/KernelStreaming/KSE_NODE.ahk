#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSE_NODE {
    #StructPack 8

    Event : KSIDENTIFIER

    NodeId : UInt32

    Reserved : UInt32

}
