#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains statistical information about the server.
 * @see https://learn.microsoft.com/windows/win32/api/lmstats/ns-lmstats-stat_server_0
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct STAT_SERVER_0 {
    #StructPack 4

    /**
     * Specifies a DWORD value that indicates the time when statistics collection started (or when the statistics were last cleared). The value is stored as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT. To calculate the length of time that statistics have been collected, subtract the value of this member from the present time.
     */
    sts0_start : UInt32

    /**
     * Specifies a DWORD value that indicates the number of times a file is opened on a server. This includes the number of times named pipes are opened.
     */
    sts0_fopens : UInt32

    /**
     * Specifies a DWORD value that indicates the number of times a server device is opened.
     */
    sts0_devopens : UInt32

    /**
     * Specifies a DWORD value that indicates the number of server print jobs spooled.
     */
    sts0_jobsqueued : UInt32

    /**
     * Specifies a DWORD value that indicates the number of times the server session started.
     */
    sts0_sopens : UInt32

    /**
     * Specifies a DWORD value that indicates the number of times the server session automatically disconnected.
     */
    sts0_stimedout : UInt32

    /**
     * Specifies a DWORD value that indicates the number of times the server sessions failed with an error.
     */
    sts0_serrorout : UInt32

    /**
     * Specifies a DWORD value that indicates the number of server password violations.
     */
    sts0_pwerrors : UInt32

    /**
     * Specifies a DWORD value that indicates the number of server access permission errors.
     */
    sts0_permerrors : UInt32

    /**
     * Specifies a DWORD value that indicates the number of server system errors.
     */
    sts0_syserrors : UInt32

    /**
     * Specifies the low-order DWORD of the number of server bytes sent to the network.
     */
    sts0_bytessent_low : UInt32

    /**
     * Specifies the high-order DWORD of the number of server bytes sent to the network.
     */
    sts0_bytessent_high : UInt32

    /**
     * Specifies the low-order DWORD of the number of server bytes received from the network.
     */
    sts0_bytesrcvd_low : UInt32

    /**
     * Specifies the high-order DWORD of the number of server bytes received from the network.
     */
    sts0_bytesrcvd_high : UInt32

    /**
     * Specifies a DWORD value that indicates the average server response time (in milliseconds).
     */
    sts0_avresponse : UInt32

    /**
     * Specifies a DWORD value that indicates the number of times the server required a request buffer but failed to allocate one. This value indicates that the server parameters may need adjustment.
     */
    sts0_reqbufneed : UInt32

    /**
     * Specifies a DWORD value that indicates the number of times the server required a big buffer but failed to allocate one. This value indicates that the server parameters may need adjustment.
     */
    sts0_bigbufneed : UInt32

}
