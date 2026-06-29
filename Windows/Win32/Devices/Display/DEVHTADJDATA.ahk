#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVHTINFO.ahk" { DEVHTINFO }

/**
 * The DEVHTADJDATA structure is used as input to the HTUI_DeviceColorAdjustment function.
 * @remarks
 * If <b>pAdjHTInfo</b> is <b>NULL</b>, or if <b>pAdjHTInfo</b> and <b>pDefHTInfo</b> point to the same buffer, the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-htui_devicecoloradjustment">HTUI_DeviceColorAdjustment</a> function displays the halftoning properties supplied by <b>pDefHTInfo</b> but does not allow the user to modify them.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-devhtadjdata
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DEVHTADJDATA {
    #StructPack 8

    /**
     * Is a set of flags, set by the caller, describing color mixing and color versus gray-scale output. Either, both, or neither of the following flags should be set, as appropriate:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Definition</th>
     * </tr>
     * <tr>
     * <td>
     * DEVHTADJF_ADDITIVE_DEVICE
     * 
     * </td>
     * <td>
     * 
     * <dl>
     * <dt>If set, the device uses additive color mixing.</dt>
     * <dt>If not set, the device uses subtractive color mixing.</dt>
     * </dl>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DEVHTADJF_COLOR_DEVICE
     * 
     * </td>
     * <td>
     * 
     * <dl>
     * <dt>If set, the device produces color output.</dt>
     * <dt>If not set, the device produces gray-scaled output.</dt>
     * </dl>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     */
    DeviceFlags : UInt32

    /**
     * Is the caller-supplied horizontal resolution, in dots per inch, for the device.
     */
    DeviceXDPI : UInt32

    /**
     * Is the caller-supplied vertical resolution, in dots per inch, for the device.
     */
    DeviceYDPI : UInt32

    /**
     * Is a caller-supplied pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-devhtinfo">DEVHTINFO</a> structure containing the device's default halftoning properties.
     */
    pDefHTInfo : DEVHTINFO.Ptr

    /**
     * Is a caller-supplied pointer to a DEVHTINFO structure containing the device's current halftoning properties. Before the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-htui_devicecoloradjustment">HTUI_DeviceColorAdjustment</a> function returns, it modifies this structure's contents, if the user has adjusted the halftoning properties. Can be <b>NULL</b> (see the following Remarks section).
     */
    pAdjHTInfo : DEVHTINFO.Ptr

}
