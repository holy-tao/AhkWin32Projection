#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * An SP_DEVICE_INTERFACE_DETAIL_DATA structure contains the path for a device interface. (Unicode)
 * @remarks
 * An SP_DEVICE_INTERFACE_DETAIL_DATA structure identifies the path for a device interface in a device information set.
 * 
 * <b>SetupDi</b><i>Xxx</i> functions that take an SP_DEVICE_INTERFACE_DETAIL_DATA structure as a parameter verify that the <b>cbSize</b> member of the supplied structure is equal to the size, in bytes, of the structure. If the <b>cbSize</b> member is not set correctly for an input parameter, the function will fail and set an error code of ERROR_INVALID_PARAMETER. If the <b>cbSize</b> member is not set correctly for an output parameter, the function will fail and set an error code of ERROR_INVALID_USER_BUFFER.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The setupapi.h header defines SP_DEVICE_INTERFACE_DETAIL_DATA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_device_interface_detail_data_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset Unicode
 * @architecture X64, Arm64
 */
export default struct SP_DEVICE_INTERFACE_DETAIL_DATA_W {
    #StructPack 4

    /**
     * The size, in bytes, of the SP_DEVICE_INTERFACE_DETAIL_DATA structure. For more information, see the following Remarks section.
     */
    cbSize : UInt32 := this.Size

    /**
     * A NULL-terminated string that contains the device interface path. This path can be passed to Win32 functions such as <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a>.
     */
    DevicePath : WCHAR[1]

}
