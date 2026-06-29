#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The MPR_DEVICE_1 structure stores information about a device used for a link in a multilinked demand dial interface. In addition to the information in MPR_DEVICE_0, MPR_DEVICE_1 contains phone-number information.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_device_1
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_DEVICE_1 {
    #StructPack 8

    /**
     * Specifies a null-terminated string that indicates the device type referenced by <b>szDeviceName</b>. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a> for a list of possible device types.
     */
    szDeviceType : WCHAR[17]

    /**
     * Specifies a null-terminated string that contains the name of the TAPI device to use with this phone-book entry.
     */
    szDeviceName : WCHAR[129]

    /**
     * Specifies a null-terminated Unicode string that contains a telephone number. The router uses the <b>szLocalPhoneNumber</b> string as the entire phone number.
     */
    szLocalPhoneNumber : WCHAR[129]

    /**
     * Pointer to a list of consecutive null-terminated Unicode strings. The last string is terminated by two consecutive null characters. The strings are alternate phone numbers that the router dials in the order listed if the primary number (see <b>szLocalPhoneNumber</b>) fails to connect.
     */
    szAlternates : PWSTR

}
