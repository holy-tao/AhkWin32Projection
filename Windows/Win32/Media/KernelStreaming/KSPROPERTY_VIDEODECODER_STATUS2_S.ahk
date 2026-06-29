#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VIDEODECODER_STATUS2_S {
    #StructPack 8

    Property : KSIDENTIFIER

    NumberOfLines : UInt32

    SignalLocked : UInt32

    ChromaLock : UInt32

}
