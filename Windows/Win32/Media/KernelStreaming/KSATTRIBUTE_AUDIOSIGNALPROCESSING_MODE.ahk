#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSATTRIBUTE.ahk" { KSATTRIBUTE }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSATTRIBUTE_AUDIOSIGNALPROCESSING_MODE {
    #StructPack 4

    AttributeHeader : KSATTRIBUTE

    SignalProcessingMode : Guid

}
