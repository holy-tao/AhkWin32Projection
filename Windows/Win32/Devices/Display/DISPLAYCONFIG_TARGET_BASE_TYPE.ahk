#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk

/**
 * Specifies base output technology info for a given target ID.
 * @remarks
 * 
 * For a Miracast display device, a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-displayconfiggetdeviceinfo">DisplayConfigGetDeviceInfo</a>  function always returns  a value of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_video_output_technology">DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY</a>.<b>DISPLAYCONFIG_OUTPUT_TECHNOLOGY_MIRACAST</b>, regardless of what the Miracast sink reports as the connector type.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-displayconfig_target_base_type
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_TARGET_BASE_TYPE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_device_info_header">DISPLAYCONFIG_DEVICE_INFO_HEADER</a> structure that contains info about the request for the target device name. The caller should set the <b>type</b> member of <b>DISPLAYCONFIG_DEVICE_INFO_HEADER</b> to <b>DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_BASE_TYPE</b> and the <b>adapterId</b> and <b>id</b> members of <b>DISPLAYCONFIG_DEVICE_INFO_HEADER</b> to the target for which the caller wants the target device name.
     * 
     *  The caller should set the <b>size</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_device_info_header">DISPLAYCONFIG_DEVICE_INFO_HEADER</a> to at least the size of the <b>DISPLAYCONFIG_TARGET_BASE_TYPE</b> structure.
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
     * The base output technology, given as a constant value of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_video_output_technology">DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY</a> enumeration, of the adapter and the target specified by the <b>header</b> member. See Remarks.
     * @type {Integer}
     */
    baseOutputTechnology {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
