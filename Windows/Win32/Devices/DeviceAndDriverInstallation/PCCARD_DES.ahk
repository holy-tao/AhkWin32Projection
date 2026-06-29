#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PCD_FLAGS.ahk" { PCD_FLAGS }

/**
 * The PCCARD_DES structure is used for specifying either a resource list or a resource requirements list that describes resource usage by a PC Card instance. For more information about resource lists and resource requirements lists, see Hardware Resources.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-pccard_des
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct PCCARD_DES {
    #StructPack 4

    /**
     * Must be 1.
     */
    PCD_Count : UInt32

    /**
     * <i>Not used.</i>
     */
    PCD_Type : UInt32

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
     */
    PCD_Flags : PCD_FLAGS

    /**
     * The 8-bit index value used to locate the device's configuration.
     */
    PCD_ConfigIndex : Int8

    /**
     * <i>Not used.</i>
     */
    PCD_Reserved : Int8[3]

    /**
     * <i>Optional</i>, card base address of the first memory window.
     */
    PCD_MemoryCardBase1 : UInt32

    /**
     * <i>Optional</i>, card base address of the second memory window.
     */
    PCD_MemoryCardBase2 : UInt32

    /**
     * This member is currently unused.
     */
    PCD_MemoryCardBase : UInt32[2]

    /**
     * This member is currently unused.
     */
    PCD_MemoryFlags : UInt16[2]

    /**
     * This member is currently unused.
     */
    PCD_IoFlags : Int8[2]

}
