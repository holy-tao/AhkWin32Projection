#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MPR_DEVICE_0 structure stores information about a device used for a link in a multilinked demand dial interface.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-mpr_device_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_DEVICE_0 extends Win32Struct
{
    static sizeof => 292

    static packingSize => 2

    /**
     * Specifies a null-terminated string that indicates the RAS device type referenced by <b>szDeviceName</b>. See 
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
}
