#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Reserved for system use.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-storage_miniport_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_MINIPORT_DESCRIPTOR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type of port driver as enumerated by the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_port_code_set">STORAGE_PORT_CODE_SET</a> enumeration.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="StoragePortCodeSetReserved"></a><a id="storageportcodesetreserved"></a><a id="STORAGEPORTCODESETRESERVED"></a><dl>
     * <dt><b>StoragePortCodeSetReserved</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an unknown storage adapter driver type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="StoragePortCodeSetStorport"></a><a id="storageportcodesetstorport"></a><a id="STORAGEPORTCODESETSTORPORT"></a><dl>
     * <dt><b>StoragePortCodeSetStorport</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Storage adapter driver is a Storport-miniport driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="StoragePortCodeSetSCSIport"></a><a id="storageportcodesetscsiport"></a><a id="STORAGEPORTCODESETSCSIPORT"></a><dl>
     * <dt><b>StoragePortCodeSetSCSIport</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Storage adapter driver is a SCSI Port-miniport driver.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Portdriver {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Indicates whether a LUN reset is supported.
     * @type {Integer}
     */
    LUNResetSupported {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * Indicates whether a target reset is supported.
     * @type {Integer}
     */
    TargetResetSupported {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * 
     * @type {Integer}
     */
    IoTimeoutValue {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * 
     * @type {Integer}
     */
    ExtraIoInfoSupported {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * @type {Integer}
     */
    AsBYTE {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * 
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 18, 2, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * 
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
