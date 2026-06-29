#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_PORT_CODE_SET.ahk" { STORAGE_PORT_CODE_SET }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Reserved for system use. (STORAGE_MINIPORT_DESCRIPTOR)
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_miniport_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_MINIPORT_DESCRIPTOR {
    #StructPack 4


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - LogicalPoFxForDisk
         * - ForwardIo
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        LogicalPoFxForDisk {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        ForwardIo {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsBYTE', { type: Int8, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure.
     */
    Version : UInt32

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     */
    Size : UInt32

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
     */
    Portdriver : STORAGE_PORT_CODE_SET

    /**
     * Indicates whether a LUN reset is supported.
     */
    LUNResetSupported : BOOLEAN

    /**
     * Indicates whether a target reset is supported.
     */
    TargetResetSupported : BOOLEAN

    IoTimeoutValue : UInt16

    ExtraIoInfoSupported : BOOLEAN

    Flags : STORAGE_MINIPORT_DESCRIPTOR._Flags

    Reserved0 : Int8[2]

    Reserved1 : UInt32

}
