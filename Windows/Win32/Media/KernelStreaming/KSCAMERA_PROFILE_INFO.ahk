#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSCAMERA_PROFILE_PININFO.ahk" { KSCAMERA_PROFILE_PININFO }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_PROFILE_INFO {
    #StructPack 8

    ProfileId : Guid

    Index : UInt32

    PinCount : UInt32

    Pins : KSCAMERA_PROFILE_PININFO.Ptr

}
