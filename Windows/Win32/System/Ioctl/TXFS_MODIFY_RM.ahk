#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TXFS_RMF_LAGS.ahk" { TXFS_RMF_LAGS }

/**
 * Contains the information required when modifying log parameters and logging mode for a secondary resource manager.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_modify_rm
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct TXFS_MODIFY_RM {
    #StructPack 8

    /**
     * The log parameters to be set.
     */
    Flags : TXFS_RMF_LAGS

    /**
     * The maximum size of the log, in containers.
     */
    LogContainerCountMax : UInt32

    /**
     * The minimum size of the log, in containers.
     */
    LogContainerCountMin : UInt32

    /**
     * The actual size of the log, in containers.
     */
    LogContainerCount : UInt32

    /**
     * The number of containers or percentage of space that should be added to the log.
     */
    LogGrowthIncrement : UInt32

    /**
     * The percentage of log space to keep free. This member is used when the 
     *       <b>TXFS_RM_FLAG_LOG_AUTO_SHRINK_PERCENTAGE</b> flag is used, and instructs the log to 
     *       automatically shrink itself, so no more than <b>LogAutoShrinkPercentage</b> of the log is 
     *       free at any given time.
     */
    LogAutoShrinkPercentage : UInt32

    /**
     * Reserved.
     */
    Reserved : Int64

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

}
