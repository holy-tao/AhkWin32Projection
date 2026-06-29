#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISPLAYCONFIG_DEVICE_INFO_TYPE.ahk" { DISPLAYCONFIG_DEVICE_INFO_TYPE }
#Import "..\..\Foundation\LUID.ahk" { LUID }

/**
 * The DISPLAYCONFIG_DEVICE_INFO_HEADER structure contains display information about the device.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-displayconfiggetdeviceinfo">DisplayConfigGetDeviceInfo</a> function uses the DISPLAYCONFIG_DEVICE_INFO_HEADER structure for retrieving display configuration information about the device, and the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-displayconfigsetdeviceinfo">DisplayConfigSetDeviceInfo</a> function uses the DISPLAYCONFIG_DEVICE_INFO_HEADER structure for setting display configuration information for the device.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_device_info_header
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_DEVICE_INFO_HEADER {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_device_info_type">DISPLAYCONFIG_DEVICE_INFO_TYPE</a> enumerated value that determines the type of device information to retrieve or set. The remainder of the packet for the retrieve or set operation follows immediately after the DISPLAYCONFIG_DEVICE_INFO_HEADER structure.
     */
    type : DISPLAYCONFIG_DEVICE_INFO_TYPE

    /**
     * The size, in bytes, of the device information that is retrieved or set. This size includes the size of the header and the size of the additional data that follows the header. This device information depends on the request type.
     */
    size : UInt32

    /**
     * A locally unique identifier (LUID) that identifies the adapter that the device information packet refers to.
     */
    adapterId : LUID

    /**
     * The source or target identifier to get or set the device information for. The meaning of this identifier is related to the type of information being requested. For example, in the case of DISPLAYCONFIG_DEVICE_INFO_GET_SOURCE_NAME, this is the source identifier.
     */
    id : UInt32

}
