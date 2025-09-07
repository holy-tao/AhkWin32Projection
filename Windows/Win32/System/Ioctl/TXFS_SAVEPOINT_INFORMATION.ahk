#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The FSCTL_TXFS_SAVEPOINT_INFORMATION structure specifies the action to perform, and on which transaction.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_savepoint_information
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class TXFS_SAVEPOINT_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Handle to the transaction on which to perform the savepoint operation.
     * @type {HANDLE}
     */
    KtmTransaction{
        get {
            if(!this.HasProp("__KtmTransaction"))
                this.__KtmTransaction := HANDLE(this.ptr + 0)
            return this.__KtmTransaction
        }
    }

    /**
     * Specifies the savepoint action to perform. Valid values are:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXFS_SAVEPOINT_SET"></a><a id="txfs_savepoint_set"></a><dl>
     * <dt><b>TXFS_SAVEPOINT_SET</b></dt>
     * <dt>1 (0x1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Creates a new savepoint.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXFS_SAVEPOINT_ROLLBACK"></a><a id="txfs_savepoint_rollback"></a><dl>
     * <dt><b>TXFS_SAVEPOINT_ROLLBACK</b></dt>
     * <dt>2 (0x2)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Rolls back to the savepoint specified by the <b>SavepointId</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXFS_SAVEPOINT_CLEAR"></a><a id="txfs_savepoint_clear"></a><dl>
     * <dt><b>TXFS_SAVEPOINT_CLEAR</b></dt>
     * <dt>4 (0x4)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Clears the most recently set savepoint for the specified transaction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TXFS_SAVEPOINT_CLEAR_ALL"></a><a id="txfs_savepoint_clear_all"></a><dl>
     * <dt><b>TXFS_SAVEPOINT_CLEAR_ALL</b></dt>
     * <dt>16 (0x10)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Clears all savepoints for the transaction.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ActionCode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * If <b>ActionCode</b> is <b>TXFS_SAVEPOINT_SET</b>, on output, 
     *       returns the newly-created savepoint ID.
     * 
     * If <b>ActionCode</b> is <b>TXFS_ROLLBACK_TO_SAVEPOINT</b>, on 
     *       input, specifies the savepoint ID to roll back to. Remains unchanged on output.
     * 
     * If <b>ActionCode</b> is <b>TXFS_SAVEPOINT_CLEAR</b> or 
     *       <b>TXFS_SAVEPOINT_CLEAR_ALL</b>, this member is not used; therefore, on input, specify 
     *       <b>NULL</b>.
     * @type {Integer}
     */
    SavepointId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
