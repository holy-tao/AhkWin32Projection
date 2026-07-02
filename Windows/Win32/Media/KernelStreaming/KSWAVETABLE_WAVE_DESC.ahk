#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\KSDATAFORMAT.ahk" { KSDATAFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

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
