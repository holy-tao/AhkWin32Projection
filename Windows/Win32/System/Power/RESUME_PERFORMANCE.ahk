#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct RESUME_PERFORMANCE {
    #StructPack 8

    PostTimeMs : UInt32

    TotalResumeTimeMs : Int64

    ResumeCompleteTimestamp : Int64

}
