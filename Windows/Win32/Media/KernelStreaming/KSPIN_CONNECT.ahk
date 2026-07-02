#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\KSPRIORITY.ahk" { KSPRIORITY }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPIN_CONNECT {
    #StructPack 8

    Interface : KSIDENTIFIER

    Medium : KSIDENTIFIER

    PinId : UInt32

    PinToHandle : HANDLE

    Priority : KSPRIORITY

}
