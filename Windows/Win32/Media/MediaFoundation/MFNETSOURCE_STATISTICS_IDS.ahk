#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines statistics collected by the network source.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfnetsource_statistics_ids
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFNETSOURCE_STATISTICS_IDS extends Win32Enum {

    /**
     * The number of packets received (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_RECVPACKETS_ID
     * @type {Integer (Int32)}
     */
    static RECVPACKETS_ID => 0

    /**
     * The number of packets lost (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_LOSTPACKETS_ID
     * @type {Integer (Int32)}
     */
    static LOSTPACKETS_ID => 1

    /**
     * The number of requests to resend packets (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_RESENDSREQUESTED_ID
     * @type {Integer (Int32)}
     */
    static RESENDSREQUESTED_ID => 2

    /**
     * The number of resent packets received (<b>LONG</b>) (<b>VT_I4</b>).
     * Native name: MFNETSOURCE_RESENDSRECEIVED_ID
     * @type {Integer (Int32)}
     */
    static RESENDSRECEIVED_ID => 3

    /**
     * The total number of packets recovered by error correction (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_RECOVEREDBYECCPACKETS_ID
     * @type {Integer (Int32)}
     */
    static RECOVEREDBYECCPACKETS_ID => 4

    /**
     * The total number of packets recovered by retransmission (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_RECOVEREDBYRTXPACKETS_ID
     * @type {Integer (Int32)}
     */
    static RECOVEREDBYRTXPACKETS_ID => 5

    /**
     * The total number of packets returned to user, including recovered packets (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_OUTPACKETS_ID
     * @type {Integer (Int32)}
     */
    static OUTPACKETS_ID => 6

    /**
     * The 10-second average receiving rate (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_RECVRATE_ID
     * @type {Integer (Int32)}
     */
    static RECVRATE_ID => 7

    /**
     * The average bandwidth of the clip (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_AVGBANDWIDTHBPS_ID
     * @type {Integer (Int32)}
     */
    static AVGBANDWIDTHBPS_ID => 8

    /**
     * The total number of bytes received (<b>ULONGLONG</b>, <b>VT_UI8</b>).
     * Native name: MFNETSOURCE_BYTESRECEIVED_ID
     * @type {Integer (Int32)}
     */
    static BYTESRECEIVED_ID => 9

    /**
     * The type of control protocol used to receive the data (<b>LONG</b>, <b>VT_I4</b>). The value is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfnetsource_protocol_type">MFNETSOURCE_PROTOCOL_TYPE</a> enumeration.
     * Native name: MFNETSOURCE_PROTOCOL_ID
     * @type {Integer (Int32)}
     */
    static PROTOCOL_ID => 10

    /**
     * The type of control protocol used to receive the data (<b>LONG</b>, <b>VT_I4</b>). The value is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfnetsource_transport_type">MFNETSOURCE_TRANSPORT_TYPE</a> enumeration.
     * Native name: MFNETSOURCE_TRANSPORT_ID
     * @type {Integer (Int32)}
     */
    static TRANSPORT_ID => 11

    /**
     * The status of cache for a media file or entry (<b>LONG</b>, <b>VT_I4</b>). The value is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfnetsource_cache_state">MFNETSOURCE_CACHE_STATE</a> enumeration.
     * Native name: MFNETSOURCE_CACHE_STATE_ID
     * @type {Integer (Int32)}
     */
    static CACHE_STATE_ID => 12

    /**
     * The current link bandwidth, in bits per second (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_LINKBANDWIDTH_ID
     * @type {Integer (Int32)}
     */
    static LINKBANDWIDTH_ID => 13

    /**
     * The current bit rate of the content (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_CONTENTBITRATE_ID
     * @type {Integer (Int32)}
     */
    static CONTENTBITRATE_ID => 14

    /**
     * The negotiated speed factor used in data transmission (<b>LONG</b>, <b>VT_I4</b>). The sender transmits data at the rate of the speed factor multiplied by the bit rate of the content.
     * Native name: MFNETSOURCE_SPEEDFACTOR_ID
     * @type {Integer (Int32)}
     */
    static SPEEDFACTOR_ID => 15

    /**
     * The playout buffer size, in milliseconds (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_BUFFERSIZE_ID
     * @type {Integer (Int32)}
     */
    static BUFFERSIZE_ID => 16

    /**
     * The percentage of the playout buffer filled during buffering. The value is an integer in the range 0–100. (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_BUFFERPROGRESS_ID
     * @type {Integer (Int32)}
     */
    static BUFFERPROGRESS_ID => 17

    /**
     * The number of ticks since the last bandwidth switch (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_LASTBWSWITCHTS_ID
     * @type {Integer (Int32)}
     */
    static LASTBWSWITCHTS_ID => 18

    /**
     * The start of the seekable range, in 100-nanosecond units (<b>ULONGLONG</b>, <b>VT_UI8</b>).
     * Native name: MFNETSOURCE_SEEKRANGESTART_ID
     * @type {Integer (Int32)}
     */
    static SEEKRANGESTART_ID => 19

    /**
     * The end of the seekable range, in 100-nanosecond units (<b>ULONGLONG</b>, <b>VT_UI8</b>).
     * Native name: MFNETSOURCE_SEEKRANGEEND_ID
     * @type {Integer (Int32)}
     */
    static SEEKRANGEEND_ID => 20

    /**
     * The number of times buffering has occurred, including the initial buffering (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_BUFFERINGCOUNT_ID
     * @type {Integer (Int32)}
     */
    static BUFFERINGCOUNT_ID => 21

    /**
     * The number of packets that had incorrect signatures (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_INCORRECTLYSIGNEDPACKETS_ID
     * @type {Integer (Int32)}
     */
    static INCORRECTLYSIGNEDPACKETS_ID => 22

    /**
     * Boolean value indicating whether the current session is signed (<b>VARIANT_BOOL</b>, <b>VT_BOOL</b>).
     * Native name: MFNETSOURCE_SIGNEDSESSION_ID
     * @type {Integer (Int32)}
     */
    static SIGNEDSESSION_ID => 23

    /**
     * The current maximum bit rate of the content (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_MAXBITRATE_ID
     * @type {Integer (Int32)}
     */
    static MAXBITRATE_ID => 24

    /**
     * The reception quality (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_RECEPTION_QUALITY_ID
     * @type {Integer (Int32)}
     */
    static RECEPTION_QUALITY_ID => 25

    /**
     * The total number of recovered packets (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_RECOVEREDPACKETS_ID
     * @type {Integer (Int32)}
     */
    static RECOVEREDPACKETS_ID => 26

    /**
     * Boolean value indicating whether the content has a variable bit rate (<b>VARIANT_BOOL</b>, <b>VT_BOOL</b>).
     * Native name: MFNETSOURCE_VBR_ID
     * @type {Integer (Int32)}
     */
    static VBR_ID => 27

    /**
     * The percentage of the content that has been downloaded. The value is an integer in the range 0–100.  (<b>LONG</b>, <b>VT_I4</b>).
     * Native name: MFNETSOURCE_DOWNLOADPROGRESS_ID
     * @type {Integer (Int32)}
     */
    static DOWNLOADPROGRESS_ID => 28

    /**
     * Native name: MFNETSOURCE_UNPREDEFINEDPROTOCOLNAME_ID
     * @type {Integer (Int32)}
     */
    static UNPREDEFINEDPROTOCOLNAME_ID => 29
}
