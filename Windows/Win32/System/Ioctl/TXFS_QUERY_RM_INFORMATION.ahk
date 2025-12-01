#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the resource manager (RM).
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_query_rm_information
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class TXFS_QUERY_RM_INFORMATION extends Win32Struct
{
    static sizeof => 168

    static packingSize => 8

    /**
     * If <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_txfs_query_rm_information">FSCTL_TXFS_QUERY_RM_INFORMATION</a> 
     *       returns <b>ERROR_BUFFER_TOO_SMALL</b>, this member specifies the minimum number of bytes 
     *       needed to return the information requested, including the <b>NULL</b> terminating 
     *       character.
     * @type {Integer}
     */
    BytesRequired {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The oldest log sequence number (LSN) currently used by the RM.
     * @type {Integer}
     */
    TailLsn {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The LSN most recently used by the RM in its log.
     * @type {Integer}
     */
    CurrentLsn {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The LSN of the archive tail of the log.
     * @type {Integer}
     */
    ArchiveTailLsn {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The actual size of a log container, in bytes.
     * @type {Integer}
     */
    LogContainerSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The highest timestamp associated with a log record.
     * @type {Integer}
     */
    HighestVirtualClock {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * The number of log containers.
     * @type {Integer}
     */
    LogContainerCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The maximum number of log containers.
     * @type {Integer}
     */
    LogContainerCountMax {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The minimum number of containers allowed in the log.
     * @type {Integer}
     */
    LogContainerCountMin {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The amount the log will grow by, which is either a number of containers or percentage of the log size; the 
     *       growth type used is specified by the flags set in <b>Flags</b> member.
     * @type {Integer}
     */
    LogGrowthIncrement {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * If the auto-shrink policy is active, this member specifies the maximum allowable amount of free space in 
     *       the log. If this member is zero, the auto-shrink policy is not active.
     * @type {Integer}
     */
    LogAutoShrinkPercentage {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The current logging mode.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXFS_LOGGING_MODE_SIMPLE"></a><a id="txfs_logging_mode_simple"></a><dl>
     * <dt><b><b>TXFS_LOGGING_MODE_SIMPLE</b></b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Simple logging is used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXFS_LOGGING_MODE_FULL"></a><a id="txfs_logging_mode_full"></a><dl>
     * <dt><b><b>TXFS_LOGGING_MODE_FULL</b></b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Full logging is used
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    LoggingMode {
        get => NumGet(this, 72, "ushort")
        set => NumPut("ushort", value, this, 72)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 74, "ushort")
        set => NumPut("ushort", value, this, 74)
    }

    /**
     * The state of the RM. Valid values are as follows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXFS_RM_STATE_NOT_STARTED"></a><a id="txfs_rm_state_not_started"></a><dl>
     * <dt><b>TXFS_RM_STATE_NOT_STARTED</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RM is not yet started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXFS_RM_STATE_STARTING"></a><a id="txfs_rm_state_starting"></a><dl>
     * <dt><b>TXFS_RM_STATE_STARTING</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RM is starting.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXFS_RM_STATE_ACTIVE"></a><a id="txfs_rm_state_active"></a><dl>
     * <dt><b>TXFS_RM_STATE_ACTIVE</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RM is active and ready to accept transactions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXFS_RM_STATE_SHUTTING_DOWN"></a><a id="txfs_rm_state_shutting_down"></a><dl>
     * <dt><b>TXFS_RM_STATE_SHUTTING_DOWN</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RM is shutting down.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    RmState {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * The total capacity of the log, in bytes.
     * @type {Integer}
     */
    LogCapacity {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The number of bytes free in the log.
     * @type {Integer}
     */
    LogFree {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The size of the $Tops file, in bytes.
     * @type {Integer}
     */
    TopsSize {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * The amount of the $Tops file that is in use, in bytes.
     * @type {Integer}
     */
    TopsUsed {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * The number of active transactions, at the time the query was issued.
     * @type {Integer}
     */
    TransactionCount {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * The number of single-phase commit operations that have occurred on this RM.
     * @type {Integer}
     */
    OnePCCount {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * The number of two-phase commit operations that have occurred on this RM.
     * @type {Integer}
     */
    TwoPCCount {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * The number of times this RM's log has become full.
     * @type {Integer}
     */
    NumberLogFileFull {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * The length of the oldest active transaction, in milliseconds.
     * @type {Integer}
     */
    OldestTransactionAge {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * The <b>GUID</b> that indicates the name of this RM.
     * @type {Pointer<Guid>}
     */
    RMName {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * The offset from the beginning of this structure to a <b>NULL</b>-terminated Unicode 
     *       string that contains the path to the TM's log.
     * @type {Integer}
     */
    TmLogPathOffset {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }
}
