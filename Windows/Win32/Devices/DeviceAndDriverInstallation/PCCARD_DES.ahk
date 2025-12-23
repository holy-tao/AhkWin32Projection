#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PCCARD_DES structure is used for specifying either a resource list or a resource requirements list that describes resource usage by a PC Card instance. For more information about resource lists and resource requirements lists, see Hardware Resources.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-pccard_des
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class PCCARD_DES extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Must be 1.
     * @type {Integer}
     */
    PCD_Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <i>Not used.</i>
     * @type {Integer}
     */
    PCD_Type {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * One bit flag from <i>each</i> of the flag sets described in the following table.
     * 
     * <table>
     * <tr>
     * <th></th>
     * <th>Flag</th>
     * <th>Definition</th>
     * </tr>
     * <tr>
     * <td colspan="2">
     * <i>I/O Addressing Flags</i>
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * fPCD_IO_8
     * 
     * </td>
     * <td>
     * The device uses 8-bit I/O addressing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * fPCD_IO_16
     * 
     * </td>
     * <td>
     * The device uses 16-bit I/O addressing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * mPCD_IO_8_16
     * 
     * </td>
     * <td>
     * Bitmask for the bit within <b>PCD_Flags</b> that specifies 8-bit or 16-bit I/O addressing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td colspan="2">
     * <i>Memory Addressing Flags</i>
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * fPCD_MEM_8
     * 
     * </td>
     * <td>
     * The device uses 8-bit memory addressing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * fPCD_MEM_16
     * 
     * </td>
     * <td>
     * The device uses 16-bit memory addressing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * mPCD_MEM_8_16
     * 
     * </td>
     * <td>
     * Bitmask for the bit within <b>PCD_Flags</b> that specifies 8-bit or 16-bit memory addressing.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    PCD_Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The 8-bit index value used to locate the device's configuration.
     * @type {Integer}
     */
    PCD_ConfigIndex {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * <i>Not used.</i>
     * @type {Array<Byte>}
     */
    PCD_Reserved{
        get {
            if(!this.HasProp("__PCD_ReservedProxyArray"))
                this.__PCD_ReservedProxyArray := Win32FixedArray(this.ptr + 13, 3, Primitive, "char")
            return this.__PCD_ReservedProxyArray
        }
    }

    /**
     * <i>Optional</i>, card base address of the first memory window.
     * @type {Integer}
     */
    PCD_MemoryCardBase1 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * <i>Optional</i>, card base address of the second memory window.
     * @type {Integer}
     */
    PCD_MemoryCardBase2 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * This member is currently unused.
     * @type {Array<UInt32>}
     */
    PCD_MemoryCardBase{
        get {
            if(!this.HasProp("__PCD_MemoryCardBaseProxyArray"))
                this.__PCD_MemoryCardBaseProxyArray := Win32FixedArray(this.ptr + 24, 2, Primitive, "uint")
            return this.__PCD_MemoryCardBaseProxyArray
        }
    }

    /**
     * This member is currently unused.
     * @type {Array<UInt16>}
     */
    PCD_MemoryFlags{
        get {
            if(!this.HasProp("__PCD_MemoryFlagsProxyArray"))
                this.__PCD_MemoryFlagsProxyArray := Win32FixedArray(this.ptr + 32, 2, Primitive, "ushort")
            return this.__PCD_MemoryFlagsProxyArray
        }
    }

    /**
     * This member is currently unused.
     * @type {Array<Byte>}
     */
    PCD_IoFlags{
        get {
            if(!this.HasProp("__PCD_IoFlagsProxyArray"))
                this.__PCD_IoFlagsProxyArray := Win32FixedArray(this.ptr + 36, 2, Primitive, "char")
            return this.__PCD_IoFlagsProxyArray
        }
    }
}
