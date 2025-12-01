#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MFCARD_DES structure is used for specifying either a resource list or a resource requirements list that describes resource usage by one of the hardware functions provided by an instance of a multifunction device.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-mfcard_des
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class MFCARD_DES extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Must be 1.
     * @type {Integer}
     */
    PMF_Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <i>Not used.</i>
     * @type {Integer}
     */
    PMF_Type {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * One bit flag is defined, as described in the following table.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Definition</th>
     * </tr>
     * <tr>
     * <td>
     * fPMF_AUDIO_ENABLE
     * 
     * </td>
     * <td>
     * If set, audio is enabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    PMF_Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contents of the 8-bit PCMCIA Configuration Option Register.
     * @type {Integer}
     */
    PMF_ConfigOptions {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * Zero-based index indicating the [IO_RESOURCE](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-io_resource) structure that describes the I/O resources for the hardware function being described by this MFCARD_DES structure.
     * @type {Integer}
     */
    PMF_IoResourceIndex {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * <i>Not used.</i>
     * @type {Array<Byte>}
     */
    PMF_Reserved{
        get {
            if(!this.HasProp("__PMF_ReservedProxyArray"))
                this.__PMF_ReservedProxyArray := Win32FixedArray(this.ptr + 14, 2, Primitive, "char")
            return this.__PMF_ReservedProxyArray
        }
    }

    /**
     * Offset from the beginning of the card's attribute memory space to the base configuration register address.
     * @type {Integer}
     */
    PMF_ConfigRegisterBase {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
