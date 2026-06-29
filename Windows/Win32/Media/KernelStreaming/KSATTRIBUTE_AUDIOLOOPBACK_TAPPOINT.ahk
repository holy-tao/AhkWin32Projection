#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AUDIOLOOPBACK_TAPPOINT_TYPE.ahk" { AUDIOLOOPBACK_TAPPOINT_TYPE }
#Import ".\KSATTRIBUTE.ahk" { KSATTRIBUTE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSATTRIBUTE_AUDIOLOOPBACK_TAPPOINT {
    #StructPack 4

    AttributeHeader : KSATTRIBUTE

    TapPoint : AUDIOLOOPBACK_TAPPOINT_TYPE

}
