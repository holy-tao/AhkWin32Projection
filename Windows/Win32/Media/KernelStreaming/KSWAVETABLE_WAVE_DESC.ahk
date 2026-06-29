#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSWAVETABLE_WAVE_DESC {
    #StructPack 8

    Identifier : KSIDENTIFIER

    Size : UInt32

    Looped : BOOL

    LoopPoint : UInt32

    InROM : BOOL

    Format : KSDATAFORMAT

}
