#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\KernelStreaming\KSM_NODE.ahk" { KSM_NODE }
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSM_BDA_BUFFER {
    #StructPack 8

    NodeMethod : KSM_NODE

    ulBufferSize : UInt32

    argbBuffer : Int8[1]

}
