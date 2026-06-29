#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_PROFILE_MEDIAINFO {
    #StructPack 8


    struct _Resolution {
        X : UInt32

        Y : UInt32

    }

    struct _MaxFrameRate {
        Numerator : UInt32

        Denominator : UInt32

    }

    Resolution : KSCAMERA_PROFILE_MEDIAINFO._Resolution

    MaxFrameRate : KSCAMERA_PROFILE_MEDIAINFO._MaxFrameRate

    Flags : Int64

    Data0 : UInt32

    Data1 : UInt32

    Data2 : UInt32

    Data3 : UInt32

}
