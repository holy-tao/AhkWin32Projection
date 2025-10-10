#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk

/**
 * The DISPLAYCONFIG_DEVICE_INFO_HEADER structure contains display information about the device.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-displayconfiggetdeviceinfo">DisplayConfigGetDeviceInfo</a> function uses the DISPLAYCONFIG_DEVICE_INFO_HEADER structure for retrieving display configuration information about the device, and the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-displayconfigsetdeviceinfo">DisplayConfigSetDeviceInfo</a> function uses the DISPLAYCONFIG_DEVICE_INFO_HEADER structure for setting display configuration information for the device.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-displayconfig_device_info_header
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_DEVICE_INFO_HEADER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_device_info_type">DISPLAYCONFIG_DEVICE_INFO_TYPE</a> enumerated value that determines the type of device information to retrieve or set. The remainder of the packet for the retrieve or set operation follows immediately after the DISPLAYCONFIG_DEVICE_INFO_HEADER structure.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The size, in bytes, of the device information that is retrieved or set. This size includes the size of the header and the size of the additional data that follows the header. This device information depends on the request type.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A locally unique identifier (LUID) that identifies the adapter that the device information packet refers to.
     * @type {LUID}
     */
    adapterId{
        get {
            if(!this.HasProp("__adapterId"))
                this.__adapterId := LUID(this.ptr + 8)
            return this.__adapterId
        }
    }

    /**
     * The source or target identifier to get or set the device information for. The meaning of this identifier is related to the type of information being requested. For example, in the case of DISPLAYCONFIG_DEVICE_INFO_GET_SOURCE_NAME, this is the source identifier.
     * @type {Integer}
     */
    id {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
