#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk
#Include .\DISPLAYCONFIG_TARGET_DEVICE_NAME_FLAGS.ahk

/**
 * The DISPLAYCONFIG_TARGET_DEVICE_NAME structure contains information about the target.
 * @remarks
 * Extended display identification data (EDID) is a set of data that is provided by a display to describe its capabilities to a graphics adapter. EDID data allows a computer to detect the type of monitor that is connected to it. EDID data includes the manufacturer name, the product type, the timings that are supported by the display, the display size, as well as other display characteristics. EDID is defined by a standard published by the Video Electronics Standards Association (VESA).
 * 
 * A named device object has a path and name of the form <i>\Device\DeviceName</i>. This is known as the <i>device name</i> of the device object.
 * 
 * If an application calls the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-displayconfiggetdeviceinfo">DisplayConfigGetDeviceInfo</a> function to obtain the monitor name and <b>DisplayConfigGetDeviceInfo</b> either cannot get the monitor name or the target is forced without a monitor connected, the string in the <b>monitorFriendlyDeviceName</b> member of the DISPLAYCONFIG_TARGET_DEVICE_NAME structure is a <b>NULL</b> string and none of the bit-field flags in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_target_device_name_flags">DISPLAYCONFIG_TARGET_DEVICE_NAME_FLAGS</a> structure are set.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_target_device_name
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_TARGET_DEVICE_NAME extends Win32Struct
{
    static sizeof => 424

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_device_info_header">DISPLAYCONFIG_DEVICE_INFO_HEADER</a> structure that contains information about the request for the target device name. The caller should set the <b>type</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER to DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_NAME and the <b>adapterId</b> and <b>id</b> members of DISPLAYCONFIG_DEVICE_INFO_HEADER to the target for which the caller wants the target device name. The caller should set the <b>size</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER to at least the size of the DISPLAYCONFIG_TARGET_DEVICE_NAME structure.
     * @type {DISPLAYCONFIG_DEVICE_INFO_HEADER}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := DISPLAYCONFIG_DEVICE_INFO_HEADER(0, this)
            return this.__header
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_target_device_name_flags">DISPLAYCONFIG_TARGET_DEVICE_NAME_FLAGS</a> structure that identifies, in bit-field flags, information about the target.
     * @type {DISPLAYCONFIG_TARGET_DEVICE_NAME_FLAGS}
     */
    flags{
        get {
            if(!this.HasProp("__flags"))
                this.__flags := DISPLAYCONFIG_TARGET_DEVICE_NAME_FLAGS(24, this)
            return this.__flags
        }
    }

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_video_output_technology">DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY</a> enumeration that specifies the target's connector type.
     * @type {Integer}
     */
    outputTechnology {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * The manufacture identifier from the monitor extended display identification data (EDID). This member is set only when the <b>edidIdsValid</b> bit-field is set in the <b>flags</b> member.
     * @type {Integer}
     */
    edidManufactureId {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * The product code from the monitor EDID. This member is set only when the <b>edidIdsValid</b> bit-field is set in the <b>flags</b> member.
     * @type {Integer}
     */
    edidProductCodeId {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }

    /**
     * The one-based instance number of this particular target only when the adapter has multiple targets of this type. The connector instance is a consecutive one-based number that is unique within each adapter. If this is the only target of this type on the adapter, this value is zero.
     * @type {Integer}
     */
    connectorInstance {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * A NULL-terminated WCHAR string that is the  device name for the monitor. This name can be used with <i>SetupAPI.dll</i> to obtain the device name that is contained in the installation package.
     * @type {String}
     */
    monitorFriendlyDeviceName {
        get => StrGet(this.ptr + 40, 63, "UTF-16")
        set => StrPut(value, this.ptr + 40, 63, "UTF-16")
    }

    /**
     * A NULL-terminated WCHAR string that is the  path to the device name for the monitor. This path can be used with <i>SetupAPI.dll</i> to obtain the device name that is contained in the installation package.
     * @type {String}
     */
    monitorDevicePath {
        get => StrGet(this.ptr + 168, 127, "UTF-16")
        set => StrPut(value, this.ptr + 168, 127, "UTF-16")
    }
}
