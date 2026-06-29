#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The MPR_DEVICE_0 structure stores information about a device used for a link in a multilinked demand dial interface.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_device_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_DEVICE_0 {
    #StructPack 2

    /**
     * Specifies a null-terminated string that indicates the RAS device type referenced by <b>szDeviceName</b>. See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_interface_2">MPR_INTERFACE_2</a> for a list of possible device types.
     */
    szDeviceType : WCHAR[17]

    /**
     * Specifies a null-terminated string that contains the name of the TAPI device to use with this phone-book entry.
     */
    szDeviceName : WCHAR[129]

}
