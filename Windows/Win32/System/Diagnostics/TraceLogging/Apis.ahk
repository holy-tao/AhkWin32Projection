#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.TraceLogging
 * @version v4.0.30319
 */
class TraceLogging {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_CHANNEL_CLASSIC_TRACE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_CHANNEL_GLOBAL_SYSTEM => 8

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_CHANNEL_GLOBAL_APPLICATION => 9

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_CHANNEL_GLOBAL_SECURITY => 10

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_CHANNEL_TRACELOGGING => 11

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_CHANNEL_PROVIDERMETADATA => 12

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_LEVEL_LOG_ALWAYS => 0

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_LEVEL_CRITICAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_LEVEL_ERROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_LEVEL_WARNING => 3

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_LEVEL_INFO => 4

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_LEVEL_VERBOSE => 5

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_LEVEL_RESERVED_6 => 6

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_LEVEL_RESERVED_7 => 7

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_LEVEL_RESERVED_8 => 8

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_LEVEL_RESERVED_9 => 9

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_LEVEL_RESERVED_10 => 10

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_LEVEL_RESERVED_11 => 11

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_LEVEL_RESERVED_12 => 12

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_LEVEL_RESERVED_13 => 13

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_LEVEL_RESERVED_14 => 14

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_LEVEL_RESERVED_15 => 15

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_INFO => 0

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_START => 1

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_STOP => 2

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_DC_START => 3

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_DC_STOP => 4

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_EXTENSION => 5

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_REPLY => 6

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RESUME => 7

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_SUSPEND => 8

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_SEND => 9

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RECEIVE => 240

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RESERVED_241 => 241

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RESERVED_242 => 242

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RESERVED_243 => 243

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RESERVED_244 => 244

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RESERVED_245 => 245

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RESERVED_246 => 246

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RESERVED_247 => 247

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RESERVED_248 => 248

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RESERVED_249 => 249

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RESERVED_250 => 250

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RESERVED_251 => 251

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RESERVED_252 => 252

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RESERVED_253 => 253

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RESERVED_254 => 254

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_OPCODE_RESERVED_255 => 255

    /**
     * @type {Integer (Int32)}
     */
    static WINEVENT_TASK_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WINEVT_KEYWORD_ANY => 0

    /**
     * @type {Integer (Int64)}
     */
    static WINEVENT_KEYWORD_RESPONSE_TIME => 281474976710656

    /**
     * @type {Integer (Int64)}
     */
    static WINEVENT_KEYWORD_RESERVED_49 => 562949953421312

    /**
     * @type {Integer (Int64)}
     */
    static WINEVENT_KEYWORD_WDI_DIAG => 1125899906842624

    /**
     * @type {Integer (Int64)}
     */
    static WINEVENT_KEYWORD_SQM => 2251799813685248

    /**
     * @type {Integer (Int64)}
     */
    static WINEVENT_KEYWORD_AUDIT_FAILURE => 4503599627370496

    /**
     * @type {Integer (Int64)}
     */
    static WINEVENT_KEYWORD_AUDIT_SUCCESS => 9007199254740992

    /**
     * @type {Integer (Int64)}
     */
    static WINEVENT_KEYWORD_CORRELATION_HINT => 18014398509481984

    /**
     * @type {Integer (Int64)}
     */
    static WINEVENT_KEYWORD_EVENTLOG_CLASSIC => 36028797018963968

    /**
     * @type {Integer (Int64)}
     */
    static WINEVENT_KEYWORD_RESERVED_56 => 72057594037927936

    /**
     * @type {Integer (Int64)}
     */
    static WINEVENT_KEYWORD_RESERVED_57 => 144115188075855872

    /**
     * @type {Integer (Int64)}
     */
    static WINEVENT_KEYWORD_RESERVED_58 => 288230376151711744

    /**
     * @type {Integer (Int64)}
     */
    static WINEVENT_KEYWORD_RESERVED_59 => 576460752303423488

    /**
     * @type {Integer (Int64)}
     */
    static WINEVENT_KEYWORD_RESERVED_60 => 1152921504606846976

    /**
     * @type {Integer (Int64)}
     */
    static WINEVENT_KEYWORD_RESERVED_61 => 2305843009213693952

    /**
     * @type {Integer (Int64)}
     */
    static WINEVENT_KEYWORD_RESERVED_62 => 4611686018427387904

    /**
     * @type {Integer (UInt64)}
     */
    static WINEVENT_KEYWORD_RESERVED_63 => 9223372036854775808

    /**
     * @type {Integer (Int32)}
     */
    static MSG_category_Devices => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSG_category_Disk => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSG_category_Printers => 3

    /**
     * @type {Integer (Int32)}
     */
    static MSG_category_Services => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSG_category_Shell => 5

    /**
     * @type {Integer (Int32)}
     */
    static MSG_category_SystemEvent => 6

    /**
     * @type {Integer (Int32)}
     */
    static MSG_category_Network => 7

    /**
     * @type {Integer (Int32)}
     */
    static MSG_channel_Application => 256

    /**
     * @type {Integer (Int32)}
     */
    static MSG_channel_Security => 257

    /**
     * @type {Integer (Int32)}
     */
    static MSG_channel_System => 258

    /**
     * @type {Integer (Int32)}
     */
    static MSG_keyword_AnyKeyword => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static MSG_keyword_ResponseTime => 268435505

    /**
     * @type {Integer (Int32)}
     */
    static MSG_keyword_WDIDiag => 268435507

    /**
     * @type {Integer (Int32)}
     */
    static MSG_keyword_SQM => 268435508

    /**
     * @type {Integer (Int32)}
     */
    static MSG_keyword_AuditFailure => 268435509

    /**
     * @type {Integer (Int32)}
     */
    static MSG_keyword_AuditSuccess => 268435510

    /**
     * @type {Integer (Int32)}
     */
    static MSG_keyword_CorrelationHint => 268435511

    /**
     * @type {Integer (Int32)}
     */
    static MSG_keyword_Classic => 268435512

    /**
     * @type {Integer (Int32)}
     */
    static MSG_opcode_Info => 805306368

    /**
     * @type {Integer (Int32)}
     */
    static MSG_opcode_Start => 805371904

    /**
     * @type {Integer (Int32)}
     */
    static MSG_opcode_Stop => 805437440

    /**
     * @type {Integer (Int32)}
     */
    static MSG_opcode_DCStart => 805502976

    /**
     * @type {Integer (Int32)}
     */
    static MSG_opcode_DCStop => 805568512

    /**
     * @type {Integer (Int32)}
     */
    static MSG_opcode_Extension => 805634048

    /**
     * @type {Integer (Int32)}
     */
    static MSG_opcode_Reply => 805699584

    /**
     * @type {Integer (Int32)}
     */
    static MSG_opcode_Resume => 805765120

    /**
     * @type {Integer (Int32)}
     */
    static MSG_opcode_Suspend => 805830656

    /**
     * @type {Integer (Int32)}
     */
    static MSG_opcode_Send => 805896192

    /**
     * @type {Integer (Int32)}
     */
    static MSG_opcode_Receive => 821035008

    /**
     * @type {Integer (Int32)}
     */
    static MSG_level_LogAlways => 1342177280

    /**
     * @type {Integer (Int32)}
     */
    static MSG_level_Critical => 1342177281

    /**
     * @type {Integer (Int32)}
     */
    static MSG_level_Error => 1342177282

    /**
     * @type {Integer (Int32)}
     */
    static MSG_level_Warning => 1342177283

    /**
     * @type {Integer (Int32)}
     */
    static MSG_level_Informational => 1342177284

    /**
     * @type {Integer (Int32)}
     */
    static MSG_level_Verbose => 1342177285

    /**
     * @type {Integer (Int32)}
     */
    static MSG_task_None => 1879048192

    /**
     * @type {Integer (Int32)}
     */
    static MSG_channel_TraceClassic => -1879048191

    /**
     * @type {Integer (Int32)}
     */
    static MSG_channel_TraceLogging => -1879048190

    /**
     * @type {Integer (Int32)}
     */
    static MSG_channel_ProviderMetadata => -1879048189
;@endregion Constants

;@region Methods
;@endregion Methods
}
