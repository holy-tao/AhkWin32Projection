#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Represents the order in which current batch command data is sent to the ClusterRegBatchReadCommand function.
 * @remarks
 * 
  * The <b>wzName</b> and <b>lpData</b> pointers are valid until the batch 
  *      notification is closed via the 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterregbatchclosenotification">ClusterRegBatchCloseNotification</a> 
  *      function.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-cluster_batch_command
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_BATCH_COMMAND extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A command that is supported by this API and taken from the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ne-clusapi-cluster_reg_command">CLUSTER_REG_COMMAND</a> enumeration. The possible 
     *        commands are as follows.
     * @type {Integer}
     */
    Command {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * If the <b>Command</b> member takes either the 
     *        <b>CLUSREG_SET_VALUE</b> command or the <b>CLUSREG_DELETE_VALUE</b> 
     *        command, then this member takes one of the standard 
     *        <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">registry value types</a>. If not, then 
     *        <b>Command</b> is set to 0.
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The name of the value or key relative to the command issued by <b>Command</b>.
     * @type {PWSTR}
     */
    wzName{
        get {
            if(!this.HasProp("__wzName"))
                this.__wzName := PWSTR(this.ptr + 8)
            return this.__wzName
        }
    }

    /**
     * A pointer to the data relative to the command issued by <b>Command</b>. The value of this 
     *        member is <b>NULL</b> for all the commands except the 
     *        <b>CLUSREG_SET_VALUE</b> and <b>CLUSREG_DELETE_VALUE</b> 
     *        commands.
     * @type {Pointer<Byte>}
     */
    lpData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The count, in bytes, of the data relative to the command issued by <b>Command</b>. The 
     *        value of this member is 0 for all the commands except the <b>CLUSREG_SET_VALUE</b> and 
     *        <b>CLUSREG_DELETE_VALUE</b> commands.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
