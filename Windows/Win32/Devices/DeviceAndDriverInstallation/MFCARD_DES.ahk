#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PMF_FLAGS.ahk" { PMF_FLAGS }

/**
 * The MFCARD_DES structure is used for specifying either a resource list or a resource requirements list that describes resource usage by one of the hardware functions provided by an instance of a multifunction device.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-mfcard_des
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct MFCARD_DES {
    #StructPack 4

    /**
     * Must be 1.
     */
    PMF_Count : UInt32

    /**
     * <i>Not used.</i>
     */
    PMF_Type : UInt32

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
     */
    PMF_Flags : PMF_FLAGS

    /**
     * Contents of the 8-bit PCMCIA Configuration Option Register.
     */
    PMF_ConfigOptions : Int8

    /**
     * Zero-based index indicating the [IO_RESOURCE](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-io_resource) structure that describes the I/O resources for the hardware function being described by this MFCARD_DES structure.
     */
    PMF_IoResourceIndex : Int8

    /**
     * <i>Not used.</i>
     */
    PMF_Reserved : Int8[2]

    /**
     * Offset from the beginning of the card's attribute memory space to the base configuration register address.
     */
    PMF_ConfigRegisterBase : UInt32

}
