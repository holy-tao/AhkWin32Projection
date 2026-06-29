#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about backtraces performed.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/ns-avrfsdk-avrf_backtrace_information
 * @namespace Windows.Win32.System.ApplicationVerifier
 */
export default struct AVRF_BACKTRACE_INFORMATION {
    #StructPack 8

    /**
     * The number of traces that have been collected.
     */
    Depth : UInt32

    /**
     * A unique identifier associated with the entire set of returned addresses.
     */
    Index : UInt32

    /**
     * An array of addresses returned traces. The number cannot exceed AVRF_MAX_TRACES, which is defined as 32.
     */
    ReturnAddresses : Int64[32]

}
