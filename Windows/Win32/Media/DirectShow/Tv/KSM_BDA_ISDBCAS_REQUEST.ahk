#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\KernelStreaming\KSM_NODE.ahk" { KSM_NODE }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSM_BDA_ISDBCAS_REQUEST {
    #StructPack 8

    NodeMethod : KSM_NODE

    ulRequestID : UInt32

    ulIsdbCommandSize : UInt32

    argbIsdbCommandData : Int8[1]

}
