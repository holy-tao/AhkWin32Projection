#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The USB_PASS_THRU_PARAMETERS structure is used with the IOCTL_USB_USER_REQUEST I/O control request to pass a vendor-specific command to the host controller miniport driver.
 * @remarks
 * The <b>USB_PASS_THRU_PARAMETERS</b> structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usbuser_pass_thru_request">USBUSER_PASS_THRU</a> user-mode request. For more information about this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usb_pass_thru_parameters
 * @namespace Windows.Win32.Devices.Usb
 */
class USB_PASS_THRU_PARAMETERS extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * A GUID that identifies the operation for the host controller miniport driver.
     * @type {Guid}
     */
    FunctionGUID {
        get {
            if(!this.HasProp("__FunctionGUID"))
                this.__FunctionGUID := Guid(0, this)
            return this.__FunctionGUID
        }
    }

    /**
     * The size, in bytes, of the USB_PASS_THRU_PARAMETERS structure.
     * @type {Integer}
     */
    ParameterLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A variable length array with the parameter data for the command.
     * @type {Array<Integer>}
     */
    Parameters {
        get {
            if(!this.HasProp("__ParametersProxyArray"))
                this.__ParametersProxyArray := Win32FixedArray(this.ptr + 20, 4, Primitive, "char")
            return this.__ParametersProxyArray
        }
    }
}
