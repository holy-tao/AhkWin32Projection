#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct TRACE_PROFILE_INTERVAL {
    #StructPack 4

    Source : UInt32

    Interval : UInt32

}
