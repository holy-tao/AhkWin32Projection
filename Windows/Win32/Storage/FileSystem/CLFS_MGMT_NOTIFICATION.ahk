#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLS_LSN.ahk

/**
 * The CLFS_MGMT_NOTIFICATION structure specifies information about the notifications that the client receives.
 * @see https://docs.microsoft.com/windows/win32/api//clfsmgmt/ns-clfsmgmt-clfs_mgmt_notification
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLFS_MGMT_NOTIFICATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The type of notification to receive.  The following  values are valid.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ClfsMgmtAdvanceTailNotification"></a><a id="clfsmgmtadvancetailnotification"></a><a id="CLFSMGMTADVANCETAILNOTIFICATION"></a><dl>
     * <dt><b>ClfsMgmtAdvanceTailNotification</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The notification to advance the log tail. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/clfsmgmtw32/nc-clfsmgmtw32-plog_tail_advance_callback">LOG_TAIL_ADVANCE_CALLBACK</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ClfsMgmtLogFullHandlerNotification"></a><a id="clfsmgmtlogfullhandlernotification"></a><a id="CLFSMGMTLOGFULLHANDLERNOTIFICATION"></a><dl>
     * <dt><b>ClfsMgmtLogFullHandlerNotification</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The notification that a  call to <a href="https://docs.microsoft.com/windows/desktop/api/clfsmgmtw32/nf-clfsmgmtw32-handlelogfull">HandleLogFull</a> is 
     *         complete. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/clfsmgmtw32/nc-clfsmgmtw32-plog_full_handler_callback">LOG_FULL_HANDLER_CALLBACK</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ClfsMgmtLogUnpinnedNotification"></a><a id="clfsmgmtlogunpinnednotification"></a><a id="CLFSMGMTLOGUNPINNEDNOTIFICATION"></a><dl>
     * <dt><b>ClfsMgmtLogUnpinnedNotification</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The notification that the log is unpinned. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/clfsmgmtw32/nc-clfsmgmtw32-plog_unpinned_callback">LOG_UNPINNED_CALLBACK</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ClfsMgmtLogWriteNotification"></a><a id="clfsmgmtlogwritenotification"></a><a id="CLFSMGMTLOGWRITENOTIFICATION"></a><dl>
     * <dt><b>ClfsMgmtLogWriteNotification</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The notification that a nonzero number of bytes has been written to the log. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/clfsmgmtw32/nf-clfsmgmtw32-registerforlogwritenotification">RegisterForLogWriteNotification</a>.
     *         
     * 
     * <b>Windows Server 2003 R2 and Windows Vista before SP1:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Notification {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * If <b>Notification</b> is <b>ClfsMgmtAdvanceTailNotification</b>, 
     *       <b>Lsn</b> specifies the target log sequence number (LSN) the client should advance the log 
     *       tail to.
     * @type {CLS_LSN}
     */
    Lsn{
        get {
            if(!this.HasProp("__Lsn"))
                this.__Lsn := CLS_LSN(8, this)
            return this.__Lsn
        }
    }

    /**
     * If <b>Notification</b> is <b>ClfsMgmtLogUnpinnedNotification</b>, 
     *       <b>LogIsPinned</b> indicates  that the log is pinned. This member is 
     *       <b>TRUE</b> if the log is pinned.
     * @type {Integer}
     */
    LogIsPinned {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }
}
