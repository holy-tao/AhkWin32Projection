#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PPM_IDLE_STATE_ACCOUNTING {
    #StructPack 8

    IdleTransitions : UInt32

    FailedTransitions : UInt32

    InvalidBucketIndex : UInt32

    TotalTime : Int64

    IdleTimeBuckets : UInt32[6]

}
