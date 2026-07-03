#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\KernelStreaming\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSP_BDA_NODE_PIN {
    #StructPack 8

    Property : KSIDENTIFIER

    ulNodeType : UInt32

    ulInputPinId : UInt32

    ulOutputPinId : UInt32

}
