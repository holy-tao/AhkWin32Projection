#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains statistical information about the server.
 * @see https://learn.microsoft.com/windows/win32/api/lmstats/ns-lmstats-stat_server_0
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class STAT_SERVER_0 extends Win32Struct
{
    static sizeof => 68

    static packingSize => 4

    /**
     * Specifies a DWORD value that indicates the time when statistics collection started (or when the statistics were last cleared). The value is stored as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT. To calculate the length of time that statistics have been collected, subtract the value of this member from the present time.
     * @type {Integer}
     */
    sts0_start {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a DWORD value that indicates the number of times a file is opened on a server. This includes the number of times named pipes are opened.
     * @type {Integer}
     */
    sts0_fopens {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies a DWORD value that indicates the number of times a server device is opened.
     * @type {Integer}
     */
    sts0_devopens {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies a DWORD value that indicates the number of server print jobs spooled.
     * @type {Integer}
     */
    sts0_jobsqueued {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies a DWORD value that indicates the number of times the server session started.
     * @type {Integer}
     */
    sts0_sopens {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies a DWORD value that indicates the number of times the server session automatically disconnected.
     * @type {Integer}
     */
    sts0_stimedout {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies a DWORD value that indicates the number of times the server sessions failed with an error.
     * @type {Integer}
     */
    sts0_serrorout {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies a DWORD value that indicates the number of server password violations.
     * @type {Integer}
     */
    sts0_pwerrors {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Specifies a DWORD value that indicates the number of server access permission errors.
     * @type {Integer}
     */
    sts0_permerrors {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Specifies a DWORD value that indicates the number of server system errors.
     * @type {Integer}
     */
    sts0_syserrors {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Specifies the low-order DWORD of the number of server bytes sent to the network.
     * @type {Integer}
     */
    sts0_bytessent_low {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Specifies the high-order DWORD of the number of server bytes sent to the network.
     * @type {Integer}
     */
    sts0_bytessent_high {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Specifies the low-order DWORD of the number of server bytes received from the network.
     * @type {Integer}
     */
    sts0_bytesrcvd_low {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Specifies the high-order DWORD of the number of server bytes received from the network.
     * @type {Integer}
     */
    sts0_bytesrcvd_high {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Specifies a DWORD value that indicates the average server response time (in milliseconds).
     * @type {Integer}
     */
    sts0_avresponse {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Specifies a DWORD value that indicates the number of times the server required a request buffer but failed to allocate one. This value indicates that the server parameters may need adjustment.
     * @type {Integer}
     */
    sts0_reqbufneed {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Specifies a DWORD value that indicates the number of times the server required a big buffer but failed to allocate one. This value indicates that the server parameters may need adjustment.
     * @type {Integer}
     */
    sts0_bigbufneed {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
