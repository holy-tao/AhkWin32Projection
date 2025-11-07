#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used by requesters to identify an object as a shadow copy set, shadow copy, or provider.
 * @remarks
 * 
 * <b>VSS_OBJECT_TYPE</b> is used when calling 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-query">IVssBackupComponents::Query</a> to specify the 
 *     types of objects about which to obtain information. An input of <b>VSS_OBJECT_NONE</b> will 
 *     return information about all objects.
 * 
 * In addition, <b>VSS_OBJECT_TYPE</b> is used as an input to 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-deletesnapshots">IVssBackupComponents::DeleteSnapshots</a>. 
 *     However, <b>DeleteSnapshots</b> accepts 
 *     only <b>VSS_OBJECT_TYPE</b> values of 
 *     <b>VSS_OBJECT_SNAPSHOT_SET</b> or <b>VSS_OBJECT_SNAPSHOT</b>.
 * 
 * The <b>Type</b> member of 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_object_prop">VSS_OBJECT_PROP</a> is a member of the 
 *     <b>VSS_OBJECT_TYPE</b> enumeration.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vss/ne-vss-vss_object_type
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_OBJECT_TYPE{

    /**
     * The object type is not known.
 *       
 * 
 * This indicates an application error.
     * @type {Integer (Int32)}
     */
    static VSS_OBJECT_UNKNOWN => 0

    /**
     * The interpretation of this value depends on whether it is used as an input to a VSS method or returned as 
 *       an output from a VSS method. 
 *       
 * 
 * When used as an input to a VSS method, it indicates that the method is not restricted to any particular 
 *        object type, but should act on all appropriate objects. In this sense, 
 *        <b>VSS_OBJECT_NONE</b> can be thought of as a wildcard input.
 * 
 * When returned as an output, the object type is not known and means that there has been an application 
 *        error.
     * @type {Integer (Int32)}
     */
    static VSS_OBJECT_NONE => 1

    /**
     * Shadow copy set.
     * @type {Integer (Int32)}
     */
    static VSS_OBJECT_SNAPSHOT_SET => 2

    /**
     * Shadow copy.
     * @type {Integer (Int32)}
     */
    static VSS_OBJECT_SNAPSHOT => 3

    /**
     * Shadow copy provider.
     * @type {Integer (Int32)}
     */
    static VSS_OBJECT_PROVIDER => 4

    /**
     * Reserved value.
     * @type {Integer (Int32)}
     */
    static VSS_OBJECT_TYPE_COUNT => 5
}
