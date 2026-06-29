#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSATTRIBUTE.ahk" { KSATTRIBUTE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct VIDEOFORMAT_DX12 {
    #StructPack 4

    Header : KSATTRIBUTE

    resourceLayout : UInt32

    resourceFlags : UInt32

    customLayout : Guid

}
