#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by a requester to indicate the type of restore operation it is about to perform.
 * @remarks
 * A requester can optionally set the type of a restore operation using 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setrestorestate">IVssBackupComponents::SetRestoreState</a>.
 * 
 * A writer can retrieve the type of a restore operation by calling 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-getrestoretype">CVssWriter::GetRestoreType</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vss/ne-vss-vss_restore_type
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_RESTORE_TYPE extends Win32Enum{

    /**
     * No restore type is defined. 
     *       This is the default restore type. However, writers should treat this restore type as if it were VSS_RTYPE_BY_COPY.
     * 
     * This indicates an error on the part of the requester.
     * @type {Integer (Int32)}
     */
    static VSS_RTYPE_UNDEFINED => 0

    /**
     * A requester restores backed-up data to the original volume from a backup 
     *       medium.
     * @type {Integer (Int32)}
     */
    static VSS_RTYPE_BY_COPY => 1

    /**
     * A requester does not copy data from a backup medium, but imports a transportable shadow copy and uses this 
     *       imported volume for operations such as data mining. 
     *       
     * 
     * <b>Windows Server 2003, Standard Edition and Windows Server 2003, Web Edition:  </b>This value is not supported. All editions of Windows Server 2003 with SP1 support this value.
     * @type {Integer (Int32)}
     */
    static VSS_RTYPE_IMPORT => 2

    /**
     * A restore type not currently enumerated. This value indicates an application error.
     * @type {Integer (Int32)}
     */
    static VSS_RTYPE_OTHER => 3
}
