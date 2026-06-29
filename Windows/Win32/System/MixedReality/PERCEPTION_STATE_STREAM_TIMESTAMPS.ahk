#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.MixedReality
 */
export default struct PERCEPTION_STATE_STREAM_TIMESTAMPS {
    #StructPack 8

    InputTimestampInQpcCounts : Int64

    AvailableTimestampInQpcCounts : Int64

}
