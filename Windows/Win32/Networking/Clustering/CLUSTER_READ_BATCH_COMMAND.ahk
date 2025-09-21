#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a result for a single command in a read batch.
 * @remarks
 * The pointers in the <b>CLUSTER_READ_BATCH_COMMAND</b> structure are valid until the read batch result handle is closed by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterregclosereadbatchreply">ClusterRegCloseReadBatchReply</a> function.
  * 
  * Errors from read commands are independent from each other.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-cluster_read_batch_command
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_READ_BATCH_COMMAND extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The command result status, which can be one of these values.
     * @type {Integer}
     */
    Command {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The registry value type or the read error type, depending on the <i>Command</i> result.
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The name of the key requested in the read command.
     * @type {Pointer<Char>}
     */
    wzSubkeyName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The name of the value requested in the read command.
     * @type {Pointer<Char>}
     */
    wzValueName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to value data.
     * @type {Pointer<Byte>}
     */
    lpData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The count, in bytes, of the <i>lpData</i> value data.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
