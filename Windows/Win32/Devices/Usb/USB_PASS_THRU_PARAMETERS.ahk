#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USB_PASS_THRU_PARAMETERS structure is used with the IOCTL_USB_USER_REQUEST I/O control request to pass a vendor-specific command to the host controller miniport driver.
 * @remarks
 * The <b>USB_PASS_THRU_PARAMETERS</b> structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usbuser_pass_thru_request">USBUSER_PASS_THRU</a> user-mode request. For more information about this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usb_pass_thru_parameters
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_PASS_THRU_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A GUID that identifies the operation for the host controller miniport driver.
     * @type {Pointer<Guid>}
     */
    FunctionGUID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size, in bytes, of the USB_PASS_THRU_PARAMETERS structure.
     * @type {Integer}
     */
    ParameterLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A variable length array with the parameter data for the command.
     * @type {Array<Byte>}
     */
    Parameters{
        get {
            if(!this.HasProp("__ParametersProxyArray"))
                this.__ParametersProxyArray := Win32FixedArray(this.ptr + 12, 4, Primitive, "char")
            return this.__ParametersProxyArray
        }
    }
}
