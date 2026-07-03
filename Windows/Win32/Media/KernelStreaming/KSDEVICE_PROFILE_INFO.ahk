#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\KSCAMERA_PROFILE_CONCURRENCYINFO.ahk" { KSCAMERA_PROFILE_CONCURRENCYINFO }
#Import ".\KSCAMERA_PROFILE_INFO.ahk" { KSCAMERA_PROFILE_INFO }
#Import ".\KSCAMERA_PROFILE_PININFO.ahk" { KSCAMERA_PROFILE_PININFO }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDEVICE_PROFILE_INFO {
    #StructPack 8


    struct _Camera {
        Info : KSCAMERA_PROFILE_INFO

        Reserved : UInt32

        ConcurrencyCount : UInt32

        Concurrency : KSCAMERA_PROFILE_CONCURRENCYINFO.Ptr

    }

    Type : UInt32

    Size : UInt32

    Camera : KSDEVICE_PROFILE_INFO._Camera

}
