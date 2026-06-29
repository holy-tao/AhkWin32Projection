#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY.ahk" { DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY }
#Import ".\DISPLAYCONFIG_DEVICE_INFO_TYPE.ahk" { DISPLAYCONFIG_DEVICE_INFO_TYPE }
#Import ".\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk" { DISPLAYCONFIG_DEVICE_INFO_HEADER }
#Import "..\..\Foundation\LUID.ahk" { LUID }

/**
 * Specifies base output technology info for a given target ID.
 * @remarks
 * For a Miracast display device, a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-displayconfiggetdeviceinfo">DisplayConfigGetDeviceInfo</a>  function always returns  a value of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_video_output_technology">DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY</a>.<b>DISPLAYCONFIG_OUTPUT_TECHNOLOGY_MIRACAST</b>, regardless of what the Miracast sink reports as the connector type.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_target_base_type
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_TARGET_BASE_TYPE {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_device_info_header">DISPLAYCONFIG_DEVICE_INFO_HEADER</a> structure that contains info about the request for the target device name. The caller should set the <b>type</b> member of <b>DISPLAYCONFIG_DEVICE_INFO_HEADER</b> to <b>DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_BASE_TYPE</b> and the <b>adapterId</b> and <b>id</b> members of <b>DISPLAYCONFIG_DEVICE_INFO_HEADER</b> to the target for which the caller wants the target device name.
     * 
     *  The caller should set the <b>size</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_device_info_header">DISPLAYCONFIG_DEVICE_INFO_HEADER</a> to at least the size of the <b>DISPLAYCONFIG_TARGET_BASE_TYPE</b> structure.
     */
    header : DISPLAYCONFIG_DEVICE_INFO_HEADER

    /**
     * The base output technology, given as a constant value of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_video_output_technology">DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY</a> enumeration, of the adapter and the target specified by the <b>header</b> member. See Remarks.
     */
    baseOutputTechnology : DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY

}
