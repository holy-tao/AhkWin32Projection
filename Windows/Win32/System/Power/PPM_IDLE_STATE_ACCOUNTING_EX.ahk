#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPM_IDLE_STATE_BUCKET_EX.ahk" { PPM_IDLE_STATE_BUCKET_EX }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PPM_IDLE_STATE_ACCOUNTING_EX {
    #StructPack 8

    TotalTime : Int64

    IdleTransitions : UInt32

    FailedTransitions : UInt32

    InvalidBucketIndex : UInt32

    MinTimeUs : UInt32

    MaxTimeUs : UInt32

    CancelledTransitions : UInt32

    IdleTimeBuckets : PPM_IDLE_STATE_BUCKET_EX[16]

}
