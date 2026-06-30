#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

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
 */
class AMCOPPCommand extends Win32Struct {
    static sizeof => 4096

    static packingSize => 4

    /**
     * Message Authentication Code (MAC) of the command data. Use AES-based one-key CBC MAC (OMAC) to calculate this value.
     * @type {Guid}
     */
    macKDI {
        get {
            if(!this.HasProp("__macKDI"))
                this.__macKDI := Guid(0, this)
            return this.__macKDI
        }
    }

    /**
     * GUID that specifies the command.
     * @type {Guid}
     */
    guidCommandID {
        get {
            if(!this.HasProp("__guidCommandID"))
                this.__guidCommandID := Guid(16, this)
            return this.__guidCommandID
        }
    }

    /**
     * Sequence number. The application must keep a running count of the COPP commands issued. For each command, increment the sequence number by one.
     * @type {Integer}
     */
    dwSequence {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Number of bytes of valid data in the <b>CommandData</b> member.
     * @type {Integer}
     */
    cbSizeData {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Data for the command. The meaning of the data depends on the command.
     * @type {Array<Integer>}
     */
    CommandData {
        get {
            if(!this.HasProp("__CommandDataProxyArray"))
                this.__CommandDataProxyArray := Win32FixedArray(this.ptr + 40, 4056, Primitive, "char")
            return this.__CommandDataProxyArray
        }
    }
}
