#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VSS_ROLLFORWARD_TYPE enumeration is used by a requester to indicate the type of roll-forward operation it is about to perform.
 * @remarks
 * 
 * A requester sets the roll-forward operation type and specifies the restore point for partial roll-forward operations using 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponentsex2-setrollforward">IVssBackupComponentsEx2::SetRollForward</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vss/ne-vss-vss_rollforward_type
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_ROLLFORWARD_TYPE{

    /**
     * No roll-forward type is defined. 
 *       
 * 
 * This indicates an error on the part of the requester.
     * @type {Integer (Int32)}
     */
    static VSS_RF_UNDEFINED => 0

    /**
     * The roll-forward operation should not roll forward through logs.
     * @type {Integer (Int32)}
     */
    static VSS_RF_NONE => 1

    /**
     * The roll-forward operation should roll forward through all logs.
     * @type {Integer (Int32)}
     */
    static VSS_RF_ALL => 2

    /**
     * The roll-forward operation should roll forward through logs up to a specified restore point.
     * @type {Integer (Int32)}
     */
    static VSS_RF_PARTIAL => 3
}
