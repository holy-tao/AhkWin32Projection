#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import ".\KSNODEPROPERTY.ahk" { KSNODEPROPERTY }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @architecture X64, Arm64
 */
export default struct KSNODEPROPERTY_AUDIO_PROPERTY {
    #StructPack 8

    NodeProperty : KSNODEPROPERTY

    AppContext : IntPtr

    Length : UInt32

}
