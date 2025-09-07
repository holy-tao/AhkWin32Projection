#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AMCOPPCommand structure contains a Certified Output Protection Protocol (COPP) command.
 * @remarks
 * The following COPP commands are defined.
  * 
  * <table>
  * <tr>
  * <th><b>GUID</b></th>
  * <th>Description
  *             </th>
  * </tr>
  * <tr>
  * <td>DXVA_COPPSetProtectionLevel</td>
  * <td>Sets a specified protection type to a specified protection level.</td>
  * </tr>
  * </table>
  *  
  * 
  * For more information, see the Windows DDK documentation.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-amcoppcommand
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMCOPPCommand extends Win32Struct
{
    static sizeof => 4080

    static packingSize => 8

    /**
     * Message Authentication Code (MAC) of the command data. Use AES-based one-key CBC MAC (OMAC) to calculate this value.
     * @type {Pointer<Guid>}
     */
    macKDI {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * GUID that specifies the command.
     * @type {Pointer<Guid>}
     */
    guidCommandID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Sequence number. The application must keep a running count of the COPP commands issued. For each command, increment the sequence number by one.
     * @type {Integer}
     */
    dwSequence {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of bytes of valid data in the <b>CommandData</b> member.
     * @type {Integer}
     */
    cbSizeData {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Data for the command. The meaning of the data depends on the command.
     * @type {Array<Byte>}
     */
    CommandData{
        get {
            if(!this.HasProp("__CommandDataProxyArray"))
                this.__CommandDataProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__CommandDataProxyArray
        }
    }
}
