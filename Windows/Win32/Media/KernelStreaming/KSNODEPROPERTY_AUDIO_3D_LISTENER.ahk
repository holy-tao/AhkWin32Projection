#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import ".\KSNODEPROPERTY.ahk" { KSNODEPROPERTY }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @architecture X64, Arm64
 */
export default struct KSNODEPROPERTY_AUDIO_3D_LISTENER {
    #StructPack 8

    NodeProperty : KSNODEPROPERTY

    ListenerId : IntPtr

}
