#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PPM_IDLE_STATE_BUCKET_EX {
    #StructPack 8

    TotalTimeUs : Int64

    MinTimeUs : UInt32

    MaxTimeUs : UInt32

    Count : UInt32

}
