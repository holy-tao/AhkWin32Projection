#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumerates the possible cluster registry commands that a local node will perform when attempting to join a cluster.
 * @remarks
 * 
  * The <b>CLUSREG_VALUE_DELETED</b> command precedes every <b>CLUSREG_SET_VALUE</b> and <b>CLUSREG_DELETE_VALUE</b> command in the returned notification data, if the value had existing data.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_reg_command
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_REG_COMMAND{

    /**
     * This constant is not a valid command. It and the <b>CLUSREG_LAST_COMMAND</b> constant act as brackets  that contain the valid commands.
     * @type {Integer (Int32)}
     */
    static CLUSREG_COMMAND_NONE => 0

    /**
     * This command sets a value relative to the last executed <b>CLUSREG_CREATE_KEY</b> command or (if not provided) relative to a key passed into  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterregcreatebatch">ClusterRegCreateBatch</a> function.
     * @type {Integer (Int32)}
     */
    static CLUSREG_SET_VALUE => 1

    /**
     * This command will create a specified cluster registry key if it does not exist, or opens an existing one.
     * @type {Integer (Int32)}
     */
    static CLUSREG_CREATE_KEY => 2

    /**
     * This command will delete a key with all values and nested subkeys.  No commands that operate on values can follow <b>CLUSREG_DELETE_KEY</b> until <b>CLUSREG_CREATE_KEY</b> is added.
     * @type {Integer (Int32)}
     */
    static CLUSREG_DELETE_KEY => 3

    /**
     * This command deletes a value relative to the last executed <b>CLUSREG_CREATE_KEY</b> command or (if not provided) relative to a key passed into  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterregcreatebatch">ClusterRegCreateBatch</a> function.
     * @type {Integer (Int32)}
     */
    static CLUSREG_DELETE_VALUE => 4

    /**
     * This command is reserved for future use.
     * @type {Integer (Int32)}
     */
    static CLUSREG_SET_KEY_SECURITY => 5

    /**
     * This command is returned only through a batch update notification port. It indicates whether a  specific cluster registry value has been deleted or whether the data of that cluster registry value has been changed.
     * @type {Integer (Int32)}
     */
    static CLUSREG_VALUE_DELETED => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLUSREG_READ_KEY => 7

    /**
     * This command indicates that content was read successfully for the requested value.
     * @type {Integer (Int32)}
     */
    static CLUSREG_READ_VALUE => 8

    /**
     * This command indicates that a value was missing or another error occurred during read.
     * @type {Integer (Int32)}
     */
    static CLUSREG_READ_ERROR => 9

    /**
     * A control command.
 * 
 * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is not available before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLUSREG_CONTROL_COMMAND => 10

    /**
     * A condition that indicates that a value exists.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSREG_CONDITION_EXISTS => 11

    /**
     * A condition that indicates that a value does not exist.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSREG_CONDITION_NOT_EXISTS => 12

    /**
     * A condition that indicates that a value is equal to another.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSREG_CONDITION_IS_EQUAL => 13

    /**
     * A condition that indicates that a value is not equal to another.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSREG_CONDITION_IS_NOT_EQUAL => 14

    /**
     * A condition that indicates that a value is greater than another.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSREG_CONDITION_IS_GREATER_THAN => 15

    /**
     * A condition that indicates that a value is less than another.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSREG_CONDITION_IS_LESS_THAN => 16

    /**
     * A condition that indicates that a key exists.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSREG_CONDITION_KEY_EXISTS => 17

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLUSREG_CONDITION_KEY_NOT_EXISTS => 18

    /**
     * This constant is not a valid command. It and the <b>CLUSREG_COMMAND_NONE</b> constant act as brackets  that contain the valid commands.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>The value of this constant is lower before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSREG_LAST_COMMAND => 19
}
