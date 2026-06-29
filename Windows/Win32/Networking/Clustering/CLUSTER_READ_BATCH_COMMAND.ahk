#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CLUSTER_REG_COMMAND.ahk" { CLUSTER_REG_COMMAND }

/**
 * Represents a result for a single command in a read batch.
 * @remarks
 * The pointers in the <b>CLUSTER_READ_BATCH_COMMAND</b> structure are valid until the read batch result handle is closed by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterregclosereadbatchreply">ClusterRegCloseReadBatchReply</a> function.
 * 
 * Errors from read commands are independent from each other.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-cluster_read_batch_command
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_READ_BATCH_COMMAND {
    #StructPack 8

    /**
     * The command result status, which can be one of these values.
     */
    Command : CLUSTER_REG_COMMAND

    /**
     * The registry value type or the read error type, depending on the <i>Command</i> result.
     */
    dwOptions : UInt32

    /**
     * The name of the key requested in the read command.
     */
    wzSubkeyName : PWSTR

    /**
     * The name of the value requested in the read command.
     */
    wzValueName : PWSTR

    /**
     * A pointer to value data.
     */
    lpData : IntPtr

    /**
     * The count, in bytes, of the <i>lpData</i> value data.
     */
    cbData : UInt32

}
