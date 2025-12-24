#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\DISPLAYCONFIG_RATIONAL.ahk

/**
 * The DISPLAYCONFIG_PATH_TARGET_INFO structure contains target information for a single path.
 * @remarks
 * A DISPLAYCONFIG_PATH_TARGET_INFO structure is specified in the <b>targetInfo</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_info">DISPLAYCONFIG_PATH_INFO</a> structure.
 * 
 * A target corresponds to the number of possible video outputs on a display adapter. This number, however, does not equate to the number of physical connectors on the display adapter. Each connector exposes a number of targets that includes backward compatibility with older connector technology. For example, a DVI connector exposes a DVI target, as well as a VGA target. A DisplayPort connector, which was introduced in 2006, exposes DisplayPort, HDMI, DVI, legacy TV, and VGA targets.
 * 
 * The <b>statusFlags</b> member is set when you call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-querydisplayconfig">QueryDisplayConfig</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_path_target_info
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_PATH_TARGET_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 4

    /**
     * The identifier of the adapter that the path is on.
     * @type {LUID}
     */
    adapterId{
        get {
            if(!this.HasProp("__adapterId"))
                this.__adapterId := LUID(0, this)
            return this.__adapterId
        }
    }

    /**
     * The target identifier on the specified adapter that this path relates to.
     * @type {Integer}
     */
    id {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    modeInfoIdx {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * This bitfield backs the following members:
     * - desktopModeInfoIdx
     * - targetModeInfoIdx
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    desktopModeInfoIdx {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    targetModeInfoIdx {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }

    /**
     * The target's connector type. For a list of possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_video_output_technology">DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY</a> enumerated type.
     * @type {Integer}
     */
    outputTechnology {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A value that specifies the rotation of the target. For a list of possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_rotation">DISPLAYCONFIG_ROTATION</a> enumerated type.
     * @type {Integer}
     */
    rotation {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * A value that specifies how the source image is scaled to the target. For a list of possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_scaling">DISPLAYCONFIG_SCALING</a> enumerated type. For more information about scaling, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/scaling-the-desktop-image">Scaling the Desktop Image</a>.
     * @type {Integer}
     */
    scaling {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_rational">DISPLAYCONFIG_RATIONAL</a> structure that specifies the refresh rate of the target. If the caller specifies target mode information, the operating system will instead use the refresh rate that is stored in the <b>vSyncFreq</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_video_signal_info">DISPLAYCONFIG_VIDEO_SIGNAL_INFO</a> structure. In this case, the caller specifies this value in the <b>targetVideoSignalInfo</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_target_mode">DISPLAYCONFIG_TARGET_MODE</a> structure. A refresh rate with both the numerator and denominator set to zero indicates that the caller does not specify a refresh rate and the operating system should use the most optimal refresh rate available. For this case, in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setdisplayconfig">SetDisplayConfig</a> function, the caller must set the <b>scanLineOrdering</b> member to the DISPLAYCONFIG_SCANLINE_ORDERING_UNSPECIFIED value; otherwise, <b>SetDisplayConfig</b> fails.
     * @type {DISPLAYCONFIG_RATIONAL}
     */
    refreshRate{
        get {
            if(!this.HasProp("__refreshRate"))
                this.__refreshRate := DISPLAYCONFIG_RATIONAL(28, this)
            return this.__refreshRate
        }
    }

    /**
     * A value that specifies the scan-line ordering of the output on the target. For a list of possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_scanline_ordering">DISPLAYCONFIG_SCANLINE_ORDERING</a> enumerated type. If the caller specifies target mode information, the operating system will instead use the scan-line ordering that is stored in the <b>scanLineOrdering</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_video_signal_info">DISPLAYCONFIG_VIDEO_SIGNAL_INFO</a> structure. In this case, the caller specifies this value in the <b>targetVideoSignalInfo</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_target_mode">DISPLAYCONFIG_TARGET_MODE</a> structure.
     * @type {Integer}
     */
    scanLineOrdering {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * A Boolean value that specifies whether the target is available. <b>TRUE</b> indicates that the target is available.
     * 
     * Because the asynchronous nature of display topology changes when a monitor is removed, a path might still be marked as active even though the monitor has been removed. In such a case, <b>targetAvailable</b> could be <b>FALSE</b> for an active path. This is typically a transient situation that will change after the operating system  takes action on the monitor removal.
     * @type {BOOL}
     */
    targetAvailable {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * A bitwise OR of flag values that indicates the status of the target. The following values are supported:
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPLAYCONFIG_TARGET_IN_USE"></a><a id="displayconfig_target_in_use"></a><dl>
     * <dt><b>DISPLAYCONFIG_TARGET_IN_USE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Target is in use on an active path.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPLAYCONFIG_TARGET_FORCIBLE"></a><a id="displayconfig_target_forcible"></a><dl>
     * <dt><b>DISPLAYCONFIG_TARGET_FORCIBLE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output can be forced on this target even if a monitor is not detected.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_BOOT"></a><a id="displayconfig_target_forced_availability_boot"></a><dl>
     * <dt><b>DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_BOOT</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Output is currently being forced in a boot-persistent manner.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_PATH"></a><a id="displayconfig_target_forced_availability_path"></a><dl>
     * <dt><b>DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_PATH</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Output is currently being forced in a path-persistent manner.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_SYSTEM"></a><a id="displayconfig_target_forced_availability_system"></a><dl>
     * <dt><b>DISPLAYCONFIG_TARGET_FORCED_AVAILABILITY_SYSTEM</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Output is currently being forced in a nonpersistent manner.
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DISPLAYCONFIG_TARGET_IS_HMD"></a><a id="displayconfig_target_is_hmd"></a><dl>
     * <dt><b>DISPLAYCONFIG_TARGET_IS_HMD</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output is a head-mounted display (HMD). Such a path is only returned from QueryDisplayConfig using the QDC_INCLUDE_HMD flag.
     * 
     * Supported starting in the Windows 10 Creators Update (Version 1703).
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    statusFlags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
