#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the information required when modifying log parameters and logging mode for a secondary resource manager.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_modify_rm
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class TXFS_MODIFY_RM extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The log parameters to be set.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum size of the log, in containers.
     * @type {Integer}
     */
    LogContainerCountMax {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The minimum size of the log, in containers.
     * @type {Integer}
     */
    LogContainerCountMin {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The actual size of the log, in containers.
     * @type {Integer}
     */
    LogContainerCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of containers or percentage of space that should be added to the log.
     * @type {Integer}
     */
    LogGrowthIncrement {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The percentage of log space to keep free. This member is used when the 
     *       <b>TXFS_RM_FLAG_LOG_AUTO_SHRINK_PERCENTAGE</b> flag is used, and instructs the log to 
     *       automatically shrink itself, so no more than <b>LogAutoShrinkPercentage</b> of the log is 
     *       free at any given time.
     * @type {Integer}
     */
    LogAutoShrinkPercentage {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
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
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }
}
