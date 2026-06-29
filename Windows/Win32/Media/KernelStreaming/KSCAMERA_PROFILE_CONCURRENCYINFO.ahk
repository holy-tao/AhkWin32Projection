#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSCAMERA_PROFILE_INFO.ahk" { KSCAMERA_PROFILE_INFO }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_PROFILE_CONCURRENCYINFO {
    #StructPack 8

    ReferenceGuid : Guid

    Reserved : UInt32

    ProfileCount : UInt32

    Profiles : KSCAMERA_PROFILE_INFO.Ptr

}
