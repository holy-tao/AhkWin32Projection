#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the events that the writer is willing to receive.
 * @remarks
 * A bit mask (or bitwise OR) of <b>VSS_SUBSCRIBE_MASK</b> 
 *     values is used as an argument only to 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-subscribe">CVssWriter::Subscribe</a>.
 * 
 * Currently, the only supported <b>VSS_SUBSCRIBE_MASK</b> 
 *     bit mask is ( <b>VSS_SM_BACKUP_EVENTS_FLAG</b> | 
 *     <b>VSS_SM_RESTORE_EVENTS_FLAG</b>).
 * @see https://learn.microsoft.com/windows/win32/api/vswriter/ne-vswriter-vss_subscribe_mask
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_SUBSCRIBE_MASK extends Win32Enum{

    /**
     * This enumeration value is reserved for future use. 
     *       
     * 
     * Specifies that the writer expects to be notified after the shadow copy it is participating in has completed. 
     *        It will then call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpostsnapshot">CVssWriter::OnPostSnapshot</a>.
     * @type {Integer (Int32)}
     */
    static VSS_SM_POST_SNAPSHOT_FLAG => 1

    /**
     * Currently, <b>VSS_SM_BACKUP_EVENTS_FLAG</b> can be used as an argument only when 
     *       combined through a bitwise OR with <b>VSS_SM_RESTORE_EVENTS_FLAG</b>. 
     *       
     * 
     * Specifies that the writer can expect to receive the following events:
     * 
     * <ul>
     * <li>A PrepareForSnapshot event when the writer will call 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpreparesnapshot">CVssWriter::OnPrepareSnapshot</a>.</li>
     * <li>A PrepareForBackup event when the writer will call 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpreparebackup">CVssWriter::OnPrepareBackup</a>.</li>
     * <li>A Freeze event when the writer will call 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onfreeze">CVssWriter::OnFreeze</a>.</li>
     * <li>A BackupComplete event when the writer will call 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onbackupcomplete">CVssWriter::OnBackupComplete</a>.</li>
     * <li>A Thaw event when the writer will call 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onthaw">CVssWriter::OnThaw</a>.</li>
     * <li>A PostSnapshot event when the writer will call 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpostsnapshot">CVssWriter::OnPostSnapshot</a>.</li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static VSS_SM_BACKUP_EVENTS_FLAG => 2

    /**
     * Currently, <b>VSS_SM_RESTORE_EVENTS_FLAG</b> can be used as an argument only when 
     *       combined through a bitwise OR with <b>VSS_SM_BACKUP_EVENTS_FLAG</b>. 
     *       
     * 
     * Specifies that the writer can expect to receive the following events:
     * 
     * <ul>
     * <li>A PreRestore event when the writer will call 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onprerestore">CVssWriter::OnPreRestore</a>.</li>
     * <li>A PostRestore event when the writer will call 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpostrestore">CVssWriter::OnPostRestore</a>.</li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static VSS_SM_RESTORE_EVENTS_FLAG => 4

    /**
     * This enumeration value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static VSS_SM_IO_THROTTLING_FLAG => 8

    /**
     * This enumeration value is reserved for future use. 
     *       
     * 
     * Specifies that the writer expects to be notified for all events.
     * @type {Integer (Int32)}
     */
    static VSS_SM_ALL_FLAGS => -1
}
