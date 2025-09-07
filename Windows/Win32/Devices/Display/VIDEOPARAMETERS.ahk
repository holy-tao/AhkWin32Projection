#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The video miniport driver receives a pointer to a VIDEOPARAMETERS structure in the InputBuffer member of a VIDEO_REQUEST_PACKET when the IOCTL request is IOCTL_VIDEO_HANDLE_VIDEOPARAMETERS.
 * @see https://learn.microsoft.com/windows/win32/api/tvout/ns-tvout-videoparameters
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class VIDEOPARAMETERS extends Win32Struct
{
    static sizeof => 352

    static packingSize => 8

    /**
     * Specifies the globally unique identifier (GUID) for this structure {02C62061-1097-11d1-920F-00A024DF156E}. A video miniport driver must verify the GUID at the start of the structure before processing the structure.
     * @type {Pointer<Guid>}
     */
    Guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Is reserved and should be ignored by the video miniport driver.
     * @type {Integer}
     */
    dwOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    dwCommand {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Indicates which members of this structure contain valid data. When <b>dwCommand</b> is VP_COMMAND_GET, the driver should set the appropriate bits in this member to indicate in which corresponding members it has returned valid data. When <b>dwCommand</b> is VP_COMMAND_SET, the driver should set the functionality on the hardware according to values in the members that correspond with the bits set in this member. This member can be a bitwise OR of the values listed in the first column of the following table.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Corresponding Members</th>
     * <th>Commands</th>
     * </tr>
     * <tr>
     * <td>
     * VP_FLAGS_BRIGHTNESS
     * 
     * </td>
     * <td>
     * <b>dwBrightness</b>
     * 
     * </td>
     * <td>
     * get/set
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * VP_FLAGS_CONTRAST
     * 
     * </td>
     * <td>
     * <b>dwContrast</b>
     * 
     * </td>
     * <td>
     * get/set
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * VP_FLAGS_COPYPROTECT
     * 
     * </td>
     * <td>
     * <b>dwCPType</b>
     * 
     * <b>dwCPCommand</b>
     * 
     * <b>dwCPStandard</b>
     * 
     * <b>dwCPKey</b>
     * 
     * <b>bCP_APSTriggerBits</b>
     * 
     * <b>bOEMCopyProtection</b>
     * 
     * </td>
     * <td>
     * get/set
     * 
     * set
     * 
     * get
     * 
     * set
     * 
     * set
     * 
     * get/set
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * VP_FLAGS_FLICKER
     * 
     * </td>
     * <td>
     * <b>dwFlickerFilter</b>
     * 
     * </td>
     * <td>
     * get/set
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * VP_FLAGS_MAX_UNSCALED
     * 
     * </td>
     * <td>
     * <b>dwMaxUnscaledX</b>
     * 
     * <b>dwMaxUnscaledY</b>
     * 
     * </td>
     * <td>
     * get
     * 
     * get
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * VP_FLAGS_OVERSCAN
     * 
     * </td>
     * <td>
     * <b>dwOverscanX</b>
     * 
     * <b>dwOverscanY</b>
     * 
     * </td>
     * <td>
     * get/set
     * 
     * get/set
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * VP_FLAGS_POSITION
     * 
     * </td>
     * <td>
     * <b>dwPositionX</b>
     * 
     * <b>dwPositionY</b>
     * 
     * </td>
     * <td>
     * get/set
     * 
     * get/set
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * VP_FLAGS_TV_MODE
     * 
     * </td>
     * <td>
     * <b>dwMode</b>
     * 
     * <b>dwAvailableModes</b>
     * 
     * </td>
     * <td>
     * get/set
     * 
     * get
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * VP_FLAGS_TV_STANDARD
     * 
     * </td>
     * <td>
     * <b>dwTVStandard</b>
     * 
     * <b>dwAvailableTVStandard</b>
     * 
     * </td>
     * <td>
     * get/set
     * 
     * get
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    dwMode {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * 
     * @type {Integer}
     */
    dwTVStandard {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    dwAvailableModes {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * 
     * @type {Integer}
     */
    dwAvailableTVStandard {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Is a value in tenths of a percent that indicates the flicker filter state. This member can be a value between [0,1000], and is valid for both VP_COMMAND_GET and VP_COMMAND_SET.
     * @type {Integer}
     */
    dwFlickerFilter {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Is a value in tenths of a percent that indicates the amount of overscan in <i>x</i>. This member can be a value between [0,1000], and is valid for both VP_COMMAND_GET and VP_COMMAND_SET.
     * @type {Integer}
     */
    dwOverScanX {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Is a value in tenths of a percent that indicates the amount of overscan in <i>y</i>. This member can be a value between [0,1000], and is valid for both VP_COMMAND_GET and VP_COMMAND_SET.
     * @type {Integer}
     */
    dwOverScanY {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Is the maximum <i>x</i> resolution that the TV can display without having the hardware scale the video image. The miniport driver must set a value in this member when <b>dwCommand</b> is VP_COMMAND_GET. This member is invalid for VP_COMMAND_SET.
     * @type {Integer}
     */
    dwMaxUnscaledX {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Is the maximum <i>y</i> resolution that the TV can display without having the hardware scale the video image. The miniport driver must set a value in this member when <b>dwCommand</b> is VP_COMMAND_GET. This member is invalid for VP_COMMAND_SET.
     * @type {Integer}
     */
    dwMaxUnscaledY {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Is the value used by the hardware to determine the current <i>x</i> position of the image on the TV. This member is specified in pixels, and is valid for both VP_COMMAND_GET and VP_COMMAND_SET.
     * @type {Integer}
     */
    dwPositionX {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Is the value used by the hardware to determine the current <i>y</i> position of the image on the TV. This member is specified in scan lines, and is valid for both VP_COMMAND_GET and VP_COMMAND_SET.
     * @type {Integer}
     */
    dwPositionY {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Is a percentage value that indicates the brightness setting on the TV. This member can be a value between [0,100], and is valid for both VP_COMMAND_GET and VP_COMMAND_SET.
     * @type {Integer}
     */
    dwBrightness {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Is a percentage value that indicates the contrast setting on the TV. This member can be a value between [0,100], and is valid for both VP_COMMAND_GET and VP_COMMAND_SET.
     * @type {Integer}
     */
    dwContrast {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Specifies the type of copy protection supported by the device. This member is valid for both the VP_COMMAND_SET and VP_COMMAND_GET commands, and can be CP_TYPE_APS_TRIGGER.
     * @type {Integer}
     */
    dwCPType {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * 
     * @type {Integer}
     */
    dwCPCommand {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * 
     * @type {Integer}
     */
    dwCPStandard {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Is a driver-generated copy protection key that is unique to this instance of the driver. This member is valid only for the VP_COMMAND_SET command. The miniport driver generates and returns this key when <b>dwCPCommand</b> is set to VP_CP_CMD_ACTIVATE. The caller must set this key when the <b>dwCPCommand</b> field is either VP_CP_CMD_DEACTIVATE or VP_CP_CMD_CHANGE. If the caller sets an incorrect key, the driver must not change the current copy protection settings.
     * @type {Integer}
     */
    dwCPKey {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Specifies DVD analog protection system (APS) trigger bit data. Bits zero and 1 are valid. This member is valid only for the VP_COMMAND_SET command.
     * @type {Integer}
     */
    bCP_APSTriggerBits {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * OEM-specific copy protection data. This member is valid for both the VP_COMMAND_SET and VP_COMMAND_GET commands.
     * @type {Array<Byte>}
     */
    bOEMCopyProtection{
        get {
            if(!this.HasProp("__bOEMCopyProtectionProxyArray"))
                this.__bOEMCopyProtectionProxyArray := Win32FixedArray(this.ptr + 92, 1, Primitive, "char")
            return this.__bOEMCopyProtectionProxyArray
        }
    }
}
