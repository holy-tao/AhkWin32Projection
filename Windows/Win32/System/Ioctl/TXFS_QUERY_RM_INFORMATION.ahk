#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TXFS_RMF_LAGS.ahk" { TXFS_RMF_LAGS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains information about the resource manager (RM).
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_query_rm_information
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct TXFS_QUERY_RM_INFORMATION {
    #StructPack 8

    /**
     * If <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_txfs_query_rm_information">FSCTL_TXFS_QUERY_RM_INFORMATION</a> 
     *       returns <b>ERROR_BUFFER_TOO_SMALL</b>, this member specifies the minimum number of bytes 
     *       needed to return the information requested, including the <b>NULL</b> terminating 
     *       character.
     */
    BytesRequired : UInt32

    /**
     * The oldest log sequence number (LSN) currently used by the RM.
     */
    TailLsn : Int64

    /**
     * The LSN most recently used by the RM in its log.
     */
    CurrentLsn : Int64

    /**
     * The LSN of the archive tail of the log.
     */
    ArchiveTailLsn : Int64

    /**
     * The actual size of a log container, in bytes.
     */
    LogContainerSize : Int64

    /**
     * The highest timestamp associated with a log record.
     */
    HighestVirtualClock : Int64

    /**
     * The number of log containers.
     */
    LogContainerCount : UInt32

    /**
     * The maximum number of log containers.
     */
    LogContainerCountMax : UInt32

    /**
     * The minimum number of containers allowed in the log.
     */
    LogContainerCountMin : UInt32

    /**
     * The amount the log will grow by, which is either a number of containers or percentage of the log size; the 
     *       growth type used is specified by the flags set in <b>Flags</b> member.
     */
    LogGrowthIncrement : UInt32

    /**
     * If the auto-shrink policy is active, this member specifies the maximum allowable amount of free space in 
     *       the log. If this member is zero, the auto-shrink policy is not active.
     */
    LogAutoShrinkPercentage : UInt32

    Flags : TXFS_RMF_LAGS

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
     */
    LoggingMode : UInt16

    /**
     * Reserved.
     */
    Reserved : UInt16

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
     */
    RmState : UInt32

    /**
     * The total capacity of the log, in bytes.
     */
    LogCapacity : Int64

    /**
     * The number of bytes free in the log.
     */
    LogFree : Int64

    /**
     * The size of the $Tops file, in bytes.
     */
    TopsSize : Int64

    /**
     * The amount of the $Tops file that is in use, in bytes.
     */
    TopsUsed : Int64

    /**
     * The number of active transactions, at the time the query was issued.
     */
    TransactionCount : Int64

    /**
     * The number of single-phase commit operations that have occurred on this RM.
     */
    OnePCCount : Int64

    /**
     * The number of two-phase commit operations that have occurred on this RM.
     */
    TwoPCCount : Int64

    /**
     * The number of times this RM's log has become full.
     */
    NumberLogFileFull : Int64

    /**
     * The length of the oldest active transaction, in milliseconds.
     */
    OldestTransactionAge : Int64

    /**
     * The <b>GUID</b> that indicates the name of this RM.
     */
    RMName : Guid

    /**
     * The offset from the beginning of this structure to a <b>NULL</b>-terminated Unicode 
     *       string that contains the path to the TM's log.
     */
    TmLogPathOffset : UInt32

}
