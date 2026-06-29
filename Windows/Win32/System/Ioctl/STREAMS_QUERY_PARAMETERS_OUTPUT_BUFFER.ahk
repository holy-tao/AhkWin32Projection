#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STREAMS_QUERY_PARAMETERS_OUTPUT_BUFFER {
    #StructPack 4

    OptimalWriteSize : UInt32

    StreamGranularitySize : UInt32

    StreamIdMin : UInt32

    StreamIdMax : UInt32

}
