#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The MPR_DEVICE_1 structure stores information about a device used for a link in a multilinked demand dial interface. In addition to the information in MPR_DEVICE_0, MPR_DEVICE_1 contains phone-number information.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_device_1
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_DEVICE_1 extends Win32Struct
{
    static sizeof => 560

    static packingSize => 8

    /**
     * Specifies a null-terminated string that indicates the device type referenced by <b>szDeviceName</b>. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a> for a list of possible device types.
     * @type {String}
     */
    szDeviceType {
        get => StrGet(this.ptr + 0, 16, "UTF-16")
        set => StrPut(value, this.ptr + 0, 16, "UTF-16")
    }

    /**
     * Specifies a null-terminated string that contains the name of the TAPI device to use with this phone-book entry.
     * @type {String}
     */
    szDeviceName {
        get => StrGet(this.ptr + 34, 128, "UTF-16")
        set => StrPut(value, this.ptr + 34, 128, "UTF-16")
    }

    /**
     * Specifies a null-terminated Unicode string that contains a telephone number. The router uses the <b>szLocalPhoneNumber</b> string as the entire phone number.
     * @type {String}
     */
    szLocalPhoneNumber {
        get => StrGet(this.ptr + 292, 128, "UTF-16")
        set => StrPut(value, this.ptr + 292, 128, "UTF-16")
    }

    /**
     * Pointer to a list of consecutive null-terminated Unicode strings. The last string is terminated by two consecutive null characters. The strings are alternate phone numbers that the router dials in the order listed if the primary number (see <b>szLocalPhoneNumber</b>) fails to connect.
     * @type {PWSTR}
     */
    szAlternates{
        get {
            if(!this.HasProp("__szAlternates"))
                this.__szAlternates := PWSTR(this.ptr + 552)
            return this.__szAlternates
        }
    }
}
