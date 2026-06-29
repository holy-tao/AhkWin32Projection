#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VIDEO_PERFORMANCE_COUNTER.ahk" { VIDEO_PERFORMANCE_COUNTER }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_QUERY_PERFORMANCE_COUNTER {
    #StructPack 8

    BufferSize : UInt32

    Buffer : VIDEO_PERFORMANCE_COUNTER.Ptr

}
